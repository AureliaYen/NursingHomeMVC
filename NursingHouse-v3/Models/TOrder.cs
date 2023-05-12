using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TOrder
    {
        public int M進貨編號 { get; set; }
        public int? EId { get; set; }
        public int? M衛材編號 { get; set; }
        public int? M訂購數量 { get; set; }
        public decimal? M價錢 { get; set; }
        public decimal? M小計 { get; set; }
        public DateTime? M訂購日期 { get; set; }
        public DateTime? M到貨日期 { get; set; }
        public int? M庫存數量 { get; set; }
        public bool? M訂購狀態 { get; set; }

        public virtual TEmployee? EIdNavigation { get; set; }
        public virtual TProduct? M衛材編號Navigation { get; set; }
    }
}
