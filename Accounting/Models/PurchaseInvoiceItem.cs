using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Accounting.Models
{
    [Table("PurchaseInvoiceItems")]
    public class PurchaseInvoiceItem
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int PurchaseInvoiceId { get; set; }

        [Required]
        public int ArticleId { get; set; }

        [StringLength(50)]
        public string? Barcode { get; set; }

        [StringLength(50)]
        public string ArticleCode { get; set; } = string.Empty;

        [StringLength(255)]
        public string Description { get; set; } = string.Empty;

        [Column(TypeName = "decimal(18,3)")]
        public decimal Quantity { get; set; }

        public int UnitId { get; set; }

        [StringLength(20)]
        public string UnitCode { get; set; } = string.Empty;

        [Column(TypeName = "decimal(18,2)")]
        public decimal PriceWithoutVAT { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal PriceWithVAT { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal DiscountPercent { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal DiscountAmount { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal VATPercent { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal VATAmount { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal ValueWithoutVAT { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal ValueWithVAT { get; set; }

        public int? CurrencyId { get; set; }

        [Required]
        [StringLength(3)]
        public string CurrencyCode { get; set; } = "EUR";

        [Column(TypeName = "decimal(18,4)")]
        public decimal ExchangeRate { get; set; } = 1;

        public int? OriginalInvoiceItemId { get; set; }

        // Navigation properties
        [ForeignKey("PurchaseInvoiceId")]
        public virtual PurchaseInvoice PurchaseInvoice { get; set; } = null!;

        [ForeignKey("ArticleId")]
        public virtual Article Article { get; set; } = null!;

        [ForeignKey("UnitId")]
        public virtual Unit? Unit { get; set; }

        [ForeignKey("CurrencyId")]
        public virtual Currency? Currency { get; set; }

        [ForeignKey("OriginalInvoiceItemId")]
        public virtual PurchaseInvoiceItem? OriginalInvoiceItem { get; set; }

        [InverseProperty("OriginalInvoiceItem")]
        public virtual ICollection<PurchaseInvoiceItem> ReturnItems { get; set; } = new List<PurchaseInvoiceItem>();
    }
}