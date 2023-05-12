using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TRoombed
    {
        public TRoombed()
        {
            TBeds = new HashSet<TBed>();
        }

        public int RbId { get; set; }
        public string? Rb房型 { get; set; }
        public string? Rb床號 { get; set; }
        public string? Rb空床 { get; set; }
        public DateTime? Rb建立日期 { get; set; }
        public string? Rb建立者工號 { get; set; }
        public DateTime? Rb修改日期 { get; set; }
        public string? Rb修改者工號 { get; set; }

        public virtual ICollection<TBed> TBeds { get; set; }
    }
}
