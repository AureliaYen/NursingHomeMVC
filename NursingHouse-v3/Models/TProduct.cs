using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TProduct
    {
        public TProduct()
        {
            TOrders = new HashSet<TOrder>();
            TTakes = new HashSet<TTake>();
        }

        public int M衛材編號 { get; set; }
        public string? M衛材名稱 { get; set; }
        public string? M單位 { get; set; }
        public decimal? M單價 { get; set; }
        public int? M庫存數量 { get; set; }
        public int? M安全庫存數 { get; set; }
        public bool? M訂購狀態 { get; set; }

        public virtual ICollection<TOrder> TOrders { get; set; }
        public virtual ICollection<TTake> TTakes { get; set; }
    }
}
