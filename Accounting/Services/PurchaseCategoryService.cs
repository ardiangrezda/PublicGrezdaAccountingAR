using Microsoft.EntityFrameworkCore;
using Accounting.Data;
using Accounting.Models;

namespace Accounting.Services
{
    public class PurchaseCategoryService
    {
        private readonly ApplicationDbContext _context;
        private readonly ILocalizationService _localizationService;

        public PurchaseCategoryService(ApplicationDbContext context, ILocalizationService localizationService)
        {
            _context = context;
            _localizationService = localizationService;
        }

        public async Task<List<PurchaseCategory>> GetPurchaseCategoriesAsync()
        {
            return await _context.PurchaseCategories
                .Include(pc => pc.NameString)
                .Include(pc => pc.DescriptionString)
                .Where(pc => pc.IsActive)
                .OrderBy(pc => pc.Id)
                .ToListAsync();
        }

        public async Task<PurchaseCategory?> GetPurchaseCategoryByIdAsync(int id)
        {
            return await _context.PurchaseCategories
                .Include(pc => pc.NameString)
                .Include(pc => pc.DescriptionString)
                .FirstOrDefaultAsync(pc => pc.Id == id);
        }

        public async Task<PurchaseCategory?> GetPurchaseCategoryByCodeAsync(string code)
        {
            return await _context.PurchaseCategories
                .Include(pc => pc.NameString)
                .Include(pc => pc.DescriptionString)
                .FirstOrDefaultAsync(pc => pc.Code == code && pc.IsActive);
        }
    }
}