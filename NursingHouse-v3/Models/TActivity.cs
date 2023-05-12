using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TActivity
    {
        public TActivity()
        {
            TActivityCollects = new HashSet<TActivityCollect>();
            TActivityComments = new HashSet<TActivityComment>();
            TActivityOrders = new HashSet<TActivityOrder>();
        }

        public int ActId { get; set; }
        public int EId { get; set; }
        public string Act活動編號 { get; set; } = null!;
        public string Act活動名稱 { get; set; } = null!;
        public string Act活動說明 { get; set; } = null!;
        public string Act活動圖片 { get; set; } = null!;
        public DateTime Act活動日期 { get; set; }
        public string Act地點 { get; set; } = null!;
        public DateTime Act報名截止日 { get; set; }
        public int Act價格 { get; set; }
        public string Act主講人 { get; set; } = null!;
        public string Act主講人描述 { get; set; } = null!;
        public string? Act注意事項 { get; set; }
        public int Act公開狀態 { get; set; }
        public int Act已報名人數 { get; set; }
        public int Act最大人數 { get; set; }
        public DateTime Act建立日期 { get; set; }
        public DateTime? Act修改日期 { get; set; }
        public string? Act最後修改人 { get; set; }
        public int? Act結案 { get; set; }
        public string? Act備註 { get; set; }

        public virtual TEmployee EIdNavigation { get; set; } = null!;
        public virtual ICollection<TActivityCollect> TActivityCollects { get; set; }
        public virtual ICollection<TActivityComment> TActivityComments { get; set; }
        public virtual ICollection<TActivityOrder> TActivityOrders { get; set; }
    }
}
