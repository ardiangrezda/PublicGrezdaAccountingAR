using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using Accounting.Models.Enums;

namespace Accounting.Models
{
    [Table("PurchaseInvoices")]
    public class PurchaseInvoice
    {
        [Key]
        public int Id { get; set; }

        // Internal system-generated invoice number
        [StringLength(50)]
        public string InvoiceNumber { get; set; } = string.Empty;

        [StringLength(100)]
        public string? ExternalInvoiceNumber { get; set; }

        [Required]
        public DateTime InvoiceDate { get; set; }

        public DateTime? InvoiceExpiryDate { get; set; }

        [Required(ErrorMessage = "Supplier is required")]
        public int SupplierId { get; set; }

        [StringLength(50)]
        public string SupplierCode { get; set; } = string.Empty;

        [Required]
        [StringLength(255)]
        public string SupplierName { get; set; } = string.Empty;

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalWithoutVAT { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalVATAmount { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalWithVAT { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalDiscountAmount { get; set; }

        [Required]
        [StringLength(20)]
        public string Status { get; set; } = nameof(PurchaseStatus.Draft);

        // Keep existing boolean flags for backward compatibility
        public bool IsCancelled { get; set; }

        [StringLength(255)]
        public string? CancellationReason { get; set; }

        public bool IsPosted { get; set; }

        public DateTime? PostedDate { get; set; }

        [Required]
        [StringLength(450)]
        public string CreatedByUserId { get; set; } = string.Empty;

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        [StringLength(450)]
        public string? LastModifiedByUserId { get; set; }

        public DateTime? LastModifiedAt { get; set; }

        [Required]
        public int PurchaseCategoryId { get; set; }

        public virtual PurchaseCategory PurchaseCategory { get; set; } = null!;

        [Required]
        public int BusinessUnitId { get; set; }

        [Required]
        public int SequentialNumber { get; set; }

        // Fields for Returns
        public bool IsReturn { get; set; }

        public int? OriginalInvoiceId { get; set; }

        [StringLength(50)]
        public string? OriginalInvoiceNumber { get; set; }

        [StringLength(500)]
        public string? ReturnReason { get; set; }

        [StringLength(100)]
        public string? Shipment { get; set; }

        public int? TradingAgentId { get; set; }

        // Navigation properties
        [ForeignKey("TradingAgentId")]
        public virtual TradingAgent? TradingAgent { get; set; }

        [ForeignKey("SupplierId")]
        public virtual Subject Supplier { get; set; } = null!;

        [ForeignKey("CreatedByUserId")]
        public virtual ApplicationUser CreatedByUser { get; set; } = null!;

        [ForeignKey("LastModifiedByUserId")]
        public virtual ApplicationUser? LastModifiedByUser { get; set; }

        [ForeignKey("BusinessUnitId")]
        public virtual BusinessUnit? BusinessUnit { get; set; }

        [ForeignKey("OriginalInvoiceId")]
        public virtual PurchaseInvoice? OriginalInvoice { get; set; }

        [InverseProperty("OriginalInvoice")]
        public virtual ICollection<PurchaseInvoice> Returns { get; set; } = new List<PurchaseInvoice>();

        public virtual ICollection<PurchaseInvoiceItem> Items { get; set; } = new List<PurchaseInvoiceItem>();

        [NotMapped]
        public PurchaseStatus StatusEnum
        {
            get => Enum.TryParse<PurchaseStatus>(Status, out var result) ? result : PurchaseStatus.Draft;
            set => Status = value.ToString();
        }
    }
}