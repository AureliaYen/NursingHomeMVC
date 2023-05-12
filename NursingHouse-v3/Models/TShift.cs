using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TShift
    {
        public int SId { get; set; }
        public int? EId { get; set; }
        public DateTime? S日期 { get; set; }
        public string? S早班 { get; set; }
        public string? S中班 { get; set; }
        public string? S晚班 { get; set; }
        public string? S休假 { get; set; }
        public string? S備註 { get; set; }

        public virtual TEmployee? EIdNavigation { get; set; }
    }
}
