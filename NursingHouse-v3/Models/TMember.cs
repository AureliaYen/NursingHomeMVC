using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TMember
    {
        public TMember()
        {
            TActivityCollects = new HashSet<TActivityCollect>();
            TActivityComments = new HashSet<TActivityComment>();
            TActivityMessages = new HashSet<TActivityMessage>();
            TActivityOrders = new HashSet<TActivityOrder>();
        }

        public int MId { get; set; }
        public string M手機 { get; set; } = null!;
        public string M密碼 { get; set; } = null!;
        public string M姓名 { get; set; } = null!;
        public bool? M性別 { get; set; }
        public string? MEmail { get; set; }
        public string? M照片 { get; set; }
        public string? M住址 { get; set; }
        public DateTime M加入時間 { get; set; }
        public DateTime? M修改時間 { get; set; }
        public DateTime? M最後登入時間 { get; set; }
        public string? M備註 { get; set; }
        public bool? M刪除會員 { get; set; }
        public string? M權限 { get; set; }

        public virtual ICollection<TActivityCollect> TActivityCollects { get; set; }
        public virtual ICollection<TActivityComment> TActivityComments { get; set; }
        public virtual ICollection<TActivityMessage> TActivityMessages { get; set; }
        public virtual ICollection<TActivityOrder> TActivityOrders { get; set; }
    }
}
