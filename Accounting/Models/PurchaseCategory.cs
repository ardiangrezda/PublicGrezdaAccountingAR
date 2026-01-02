using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Accounting.Models
{
    [Table("PurchaseCategories")]
    public class PurchaseCategory
    {
        [Key]
        public int Id { get; set; }

        [StringLength(20)]
        public string? Code { get; set; }

        public bool IsActive { get; set; } = true;

        // Foreign keys for localization
        public int? NameStringId { get; set; }
        public int? DescriptionStringId { get; set; }

        [ForeignKey("NameStringId")]
        public virtual LocalizationString? NameString { get; set; }

        [ForeignKey("DescriptionStringId")]
        public virtual LocalizationString? DescriptionString { get; set; }

        public virtual ICollection<PurchaseInvoice> PurchaseInvoices { get; set; } = new List<PurchaseInvoice>();
    }
}