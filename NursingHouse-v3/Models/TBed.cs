using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TBed
    {
        public int BId { get; set; }
        public int? PId { get; set; }
        public int? RbId { get; set; }
        public DateTime? B入住時間 { get; set; }
        public DateTime? B預計退房時間 { get; set; }
        public DateTime? B建立日期 { get; set; }
        public string? B建立者工號 { get; set; }
        public DateTime? B修改日期 { get; set; }
        public string? B修改者工號 { get; set; }

        public virtual TPatientInfo? PIdNavigation { get; set; }
        public virtual TRoombed? RbIdNavigation { get; set; }
    }
}
