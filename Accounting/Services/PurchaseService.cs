using Microsoft.EntityFrameworkCore;
using Accounting.Data;
using Accounting.Models;
using Accounting.Models.Enums;

namespace Accounting.Services
{
    public class PurchaseService
    {
        private readonly ApplicationDbContext _context;
        private readonly BusinessUnitStateContainer _stateContainer;
        private readonly ArticleService _articleService;

        public PurchaseService(ApplicationDbContext context, BusinessUnitStateContainer stateContainer, ArticleService articleService)
        {
            _context = context;
            _stateContainer = stateContainer;
            _articleService = articleService;
        }

        public async Task<List<PurchaseInvoice>> GetAllPurchasesAsync(int? businessUnitId = null, string? userId = null, bool includePosted = false, int? categoryId = null)
        {
            var effectiveBusinessUnitId = businessUnitId ?? _stateContainer.CurrentBusinessUnitId;
            
            var query = _context.PurchaseInvoices.AsQueryable();

            if (effectiveBusinessUnitId.HasValue)
            {
                query = query.Where(p => p.BusinessUnitId == effectiveBusinessUnitId.Value);
            }

            if (!string.IsNullOrEmpty(userId))
            {
                query = query.Where(p => p.CreatedByUserId == userId);
            }

            if (!includePosted)
                query = query.Where(p => !p.IsPosted);

            if (categoryId.HasValue)
                query = query.Where(p => p.PurchaseCategoryId == categoryId.Value);

            return await query
                .Include(p => p.Supplier)
                .Include(p => p.OriginalInvoice)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Article)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Unit)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Currency)
                .Include(p => p.Items)
                    .ThenInclude(item => item.OriginalInvoiceItem)
                .Include(p => p.CreatedByUser)
                .OrderByDescending(p => p.InvoiceDate)
                .ToListAsync();
        }

        public async Task<PurchaseInvoice?> GetPurchaseByIdAsync(int id, string? userId = null)
        {
            var query = _context.PurchaseInvoices.AsQueryable();

            if (!string.IsNullOrEmpty(userId))
            {
                query = query.Where(p => p.CreatedByUserId == userId);
            }

            return await query
                .Include(p => p.Supplier)
                .Include(p => p.OriginalInvoice)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Article)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Unit)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Currency)
                .Include(p => p.Items)
                    .ThenInclude(item => item.OriginalInvoiceItem)
                .Include(p => p.CreatedByUser)
                .FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<PurchaseInvoice?> GetOriginalInvoiceByNumberAsync(string invoiceNumber, int businessUnitId)
        {
            return await _context.PurchaseInvoices
                .Include(p => p.Supplier)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Article)
                .Include(p => p.Items)
                    .ThenInclude(item => item.Unit)
                .FirstOrDefaultAsync(p => p.InvoiceNumber == invoiceNumber &&
                                        p.BusinessUnitId == businessUnitId &&
                                        !p.IsCancelled &&
                                        !p.IsReturn);
        }

        public async Task<bool> CheckIfInvoiceAlreadyReturnedAsync(int originalInvoiceId)
        {
            return await _context.PurchaseInvoices
                .AnyAsync(p => p.OriginalInvoiceId == originalInvoiceId && !p.IsCancelled);
        }

        public async Task<decimal> GetReturnableQuantityAsync(int originalItemId)
        {
            var originalItem = await _context.PurchaseInvoiceItems
                .FirstOrDefaultAsync(i => i.Id == originalItemId);

            if (originalItem == null) return 0;

            var totalReturned = await _context.PurchaseInvoiceItems
                .Where(i => i.OriginalInvoiceItemId == originalItemId)
                .Include(i => i.PurchaseInvoice)
                .Where(i => i.PurchaseInvoice.IsReturn && i.PurchaseInvoice.IsPosted)
                .SumAsync(i => Math.Abs(i.Quantity));

            return originalItem.Quantity - totalReturned;
        }

        public async Task<PurchaseInvoice> CreatePurchaseAsync(PurchaseInvoice purchase)
        {
            var businessUnitId = purchase.BusinessUnitId;
            
            if (businessUnitId <= 0)
            {
                throw new InvalidOperationException("Business unit ID is required");
            }

            if (purchase.SupplierId <= 0)
            {
                throw new InvalidOperationException("Supplier ID is required");
            }

            var supplier = await _context.Subjects
                .FirstOrDefaultAsync(s => s.Id == purchase.SupplierId)
                ?? throw new InvalidOperationException("Valid supplier not found");

            purchase.SupplierCode = supplier.Code;
            purchase.SupplierName = supplier.SubjectName;
            purchase.CreatedAt = DateTime.UtcNow;
            
            // **NEW: Set initial status**
            purchase.Status = nameof(PurchaseStatus.Draft);

            // Generate INTERNAL invoice number (system-generated)
            if (string.IsNullOrEmpty(purchase.InvoiceNumber))
            {
                var year = purchase.InvoiceDate.ToString("yy");
                var category = await _context.PurchaseCategories.FindAsync(purchase.PurchaseCategoryId);
                var categoryCode = category?.Code ?? "UNK";
                var businessUnit = await _context.BusinessUnits.FindAsync(purchase.BusinessUnitId);
                var unitCode = businessUnit?.Code ?? purchase.BusinessUnitId.ToString("D3");

                var lastSequential = await _context.PurchaseInvoices
                    .Where(p => p.BusinessUnitId == purchase.BusinessUnitId && 
                                p.PurchaseCategoryId == purchase.PurchaseCategoryId)
                    .MaxAsync(p => (int?)p.SequentialNumber) ?? 0;

                var nextSequential = lastSequential + 1;
                purchase.SequentialNumber = nextSequential;
                
                // This is the INTERNAL number
                purchase.InvoiceNumber = $"{year}-{categoryCode}-{unitCode}-{nextSequential:D4}";
            }

            // ExternalInvoiceNumber is already set by the user in the form
            purchase.TotalWithoutVAT = purchase.Items?.Sum(item => item.ValueWithoutVAT) ?? 0;
            purchase.TotalVATAmount = purchase.Items?.Sum(item => item.VATAmount) ?? 0;
            purchase.TotalWithVAT = purchase.Items?.Sum(item => item.ValueWithVAT) ?? 0;
            purchase.TotalDiscountAmount = purchase.Items?.Sum(item => item.DiscountAmount) ?? 0;

            _context.PurchaseInvoices.Add(purchase);
            await _context.SaveChangesAsync();

            // Update stock quantities
            if (purchase.Items != null && purchase.Items.Any())
            {
                var stockUpdates = new List<(int articleId, decimal quantityChange)>();
                foreach (var item in purchase.Items.Where(i => i.ArticleId > 0 && i.Quantity != 0))
                {
                    var stockChange = -item.Quantity;
                    stockUpdates.Add((item.ArticleId, stockChange));
                }

                if (stockUpdates.Any())
                {
                    await _articleService.UpdateStockQuantitiesAsync(stockUpdates);
                }
            }

            return purchase;
        }

        public async Task<bool> ChangeStatusAsync(int purchaseId, PurchaseStatus newStatus, string userId, string? reason = null)
        {
            var purchase = await _context.PurchaseInvoices
                .FirstOrDefaultAsync(p => p.Id == purchaseId);

            if (purchase == null)
                return false;

            // Validate status transition
            if (!IsValidStatusTransition(purchase.StatusEnum, newStatus))
            {
                throw new InvalidOperationException($"Cannot transition from {purchase.Status} to {newStatus}");
            }

            var oldStatus = purchase.Status;
            purchase.Status = newStatus.ToString();
            purchase.LastModifiedByUserId = userId;
            purchase.LastModifiedAt = DateTime.UtcNow;

            // Synchronize boolean flags with status
            switch (newStatus)
            {
                case PurchaseStatus.Posted:
                    purchase.IsPosted = true;
                    purchase.PostedDate = DateTime.UtcNow;
                    break;
                case PurchaseStatus.Cancelled:
                    purchase.IsCancelled = true;
                    purchase.CancellationReason = reason;
                    break;
            }

            await _context.SaveChangesAsync();
            return true;
        }

        private bool IsValidStatusTransition(PurchaseStatus currentStatus, PurchaseStatus newStatus)
        {
            // Define valid transitions
            var validTransitions = new Dictionary<PurchaseStatus, List<PurchaseStatus>>
            {
                { PurchaseStatus.Draft, new List<PurchaseStatus> { PurchaseStatus.Approved, PurchaseStatus.Cancelled } },
                { PurchaseStatus.Approved, new List<PurchaseStatus> { PurchaseStatus.Received, PurchaseStatus.Cancelled, PurchaseStatus.OnHold } },
                { PurchaseStatus.Received, new List<PurchaseStatus> { PurchaseStatus.Posted, PurchaseStatus.OnHold } },
                { PurchaseStatus.Posted, new List<PurchaseStatus> { PurchaseStatus.Paid, PurchaseStatus.Cancelled } },
                { PurchaseStatus.Paid, new List<PurchaseStatus> { } }, // Final state
                { PurchaseStatus.OnHold, new List<PurchaseStatus> { PurchaseStatus.Approved, PurchaseStatus.Cancelled } },
                { PurchaseStatus.Cancelled, new List<PurchaseStatus> { } } // Final state
            };

            return validTransitions.ContainsKey(currentStatus) && 
                   validTransitions[currentStatus].Contains(newStatus);
        }

        public async Task<List<PurchaseInvoice>> GetPurchasesByStatusAsync(PurchaseStatus status, int? businessUnitId = null)
        {
            var query = _context.PurchaseInvoices
                .Where(p => p.Status == status.ToString());

            if (businessUnitId.HasValue)
            {
                query = query.Where(p => p.BusinessUnitId == businessUnitId.Value);
            }

            return await query
                .Include(p => p.Supplier)
                .Include(p => p.Items)
                .OrderByDescending(p => p.InvoiceDate)
                .ToListAsync();
        }

        public async Task<bool> UpdatePurchaseAsync(PurchaseInvoice purchase, string? userId = null)
        {
            if (purchase.IsPosted)
            {
                throw new InvalidOperationException("Posted purchases cannot be modified");
            }

            var query = _context.PurchaseInvoices.Include(p => p.Items).AsQueryable();

            if (!string.IsNullOrEmpty(userId))
            {
                query = query.Where(p => p.CreatedByUserId == userId);
            }

            var existingPurchase = await query.FirstOrDefaultAsync(p => p.Id == purchase.Id);

            if (existingPurchase == null)
            {
                return false;
            }

            // Calculate stock adjustments BEFORE updating the database
            var stockAdjustments = new List<(int articleId, decimal quantityChange)>();

            // Handle removed items (restore their quantities by adding them back)
            var existingItemIds = existingPurchase.Items.Select(i => i.Id).ToList();
            var updatedItemIds = purchase.Items?.Where(i => i.Id > 0).Select(i => i.Id).ToList() ?? new List<int>();
            var itemsToRemove = existingPurchase.Items.Where(i => !updatedItemIds.Contains(i.Id)).ToList();
            
            foreach (var itemToRemove in itemsToRemove)
            {
                if (existingPurchase.IsReturn)
                {
                    // For returns being removed: subtract the quantity back (it was added to stock originally)
                    stockAdjustments.Add((itemToRemove.ArticleId, itemToRemove.Quantity));
                }
                else
                {
                    // For regular purchases being removed: add back the quantity (restore stock)
                    stockAdjustments.Add((itemToRemove.ArticleId, itemToRemove.Quantity));
                }
                _context.PurchaseInvoiceItems.Remove(itemToRemove);
            }

            // Handle updated and new items
            if (purchase.Items != null)
            {
                foreach (var item in purchase.Items)
                {
                    if (item.Id > 0)
                    {
                        // Existing item - check if quantity changed
                        var existingItem = existingPurchase.Items.FirstOrDefault(i => i.Id == item.Id);
                        if (existingItem != null && existingItem.Quantity != item.Quantity)
                        {
                            // Calculate the difference in quantities
                            var quantityDifference = item.Quantity - existingItem.Quantity;
                            if (quantityDifference != 0)
                            {
                                if (purchase.IsReturn)
                                {
                                    // For returns: if quantity increased, add more to stock (negative diff)
                                    // if quantity decreased, remove from stock (positive diff)
                                    stockAdjustments.Add((item.ArticleId, -quantityDifference));
                                }
                                else
                                {
                                    // For regular purchases: if quantity increased, add to stock (negative diff)
                                    // if quantity decreased, remove from stock (positive diff)
                                    stockAdjustments.Add((item.ArticleId, -quantityDifference));
                                }
                            }
                        }
                        
                        if (existingItem != null)
                        {
                            _context.Entry(existingItem).CurrentValues.SetValues(item);
                        }
                    }
                    else
                    {
                        // New item
                        item.PurchaseInvoiceId = purchase.Id;
                        existingPurchase.Items.Add(item);
                        
                        if (purchase.IsReturn)
                        {
                            // For new return items: add quantity to stock
                            stockAdjustments.Add((item.ArticleId, item.Quantity));
                        }
                        else
                        {
                            // For new regular purchase items: subtract quantity from stock
                            stockAdjustments.Add((item.ArticleId, -item.Quantity));
                        }
                    }
                }
            }

            // Update purchase totals
            purchase.LastModifiedAt = DateTime.UtcNow;
            purchase.LastModifiedByUserId = userId;

            purchase.TotalWithoutVAT = purchase.Items?.Sum(item => item.ValueWithoutVAT) ?? 0;
            purchase.TotalVATAmount = purchase.Items?.Sum(item => item.VATAmount) ?? 0;
            purchase.TotalWithVAT = purchase.Items?.Sum(item => item.ValueWithVAT) ?? 0;
            purchase.TotalDiscountAmount = purchase.Items?.Sum(item => item.DiscountAmount) ?? 0;

            // Update purchase properties (preserve invoice number and sequential number)
            var originalInvoiceNumber = existingPurchase.InvoiceNumber;
            var originalSequentialNumber = existingPurchase.SequentialNumber;
            _context.Entry(existingPurchase).CurrentValues.SetValues(purchase);
            existingPurchase.InvoiceNumber = originalInvoiceNumber;
            existingPurchase.SequentialNumber = originalSequentialNumber;

            try
            {
                // Save the invoice changes first
                await _context.SaveChangesAsync();

                // Apply stock adjustments if any
                if (stockAdjustments.Any())
                {
                    await _articleService.UpdateStockQuantitiesAsync(stockAdjustments);
                }

                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error updating purchase invoice: {ex.Message}");
                return false;
            }
        }
    }
}