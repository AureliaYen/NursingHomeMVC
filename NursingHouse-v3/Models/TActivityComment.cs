using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TActivityComment
    {
        public int AcId { get; set; }
        public int Ac活動編號 { get; set; }
        public int Ac會員Id { get; set; }
        public double Ac評價 { get; set; }
        public string? Ac備註 { get; set; }

        public virtual TMember Ac會員 { get; set; } = null!;
        public virtual TActivity Ac活動編號Navigation { get; set; } = null!;
    }
}
