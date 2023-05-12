using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TMeal
    {
        public TMeal()
        {
            TImages = new HashSet<TImage>();
            TOrderMeals = new HashSet<TOrderMeal>();
        }

        public int MeId { get; set; }
        public int? SuId { get; set; }
        public string? 月 { get; set; }
        public string? 餐種 { get; set; }
        public string? 餐別 { get; set; }
        public string? 價位 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public DateTime? 修改時間 { get; set; }
        public string? 建立人 { get; set; }
        public string? 備註 { get; set; }

        public virtual TSupplier? SuIdNavigation { get; set; }
        public virtual ICollection<TImage> TImages { get; set; }
        public virtual ICollection<TOrderMeal> TOrderMeals { get; set; }
    }
}
