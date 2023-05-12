using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TActivityCollect
    {
        public int AcoId { get; set; }
        public int Aco活動Id { get; set; }
        public int Aco會員Id { get; set; }
        public int Aco收藏 { get; set; }
        public string? Aco備註 { get; set; }

        public virtual TMember Aco會員 { get; set; } = null!;
        public virtual TActivity Aco活動 { get; set; } = null!;
    }
}
