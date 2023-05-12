using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TSupplier
    {
        public TSupplier()
        {
            TMeals = new HashSet<TMeal>();
        }

        public int SuId { get; set; }
        public string? 廠商名稱 { get; set; }
        public string? 廠商地址 { get; set; }
        public string? 廠商email { get; set; }
        public string? 廠商電話 { get; set; }
        public string? 廠商聯絡人 { get; set; }
        public string? 聯絡人email { get; set; }
        public DateTime? 建立時間 { get; set; }
        public DateTime? 修改時間 { get; set; }
        public string? 建立人 { get; set; }
        public string? 備註 { get; set; }

        public virtual ICollection<TMeal> TMeals { get; set; }
    }
}
