﻿using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TTake
    {
        public int M領取編號 { get; set; }
        public int? EId { get; set; }
        public int? M衛材編號 { get; set; }
        public int? M領取數量 { get; set; }
        public DateTime? M領取時間 { get; set; }
        public string? M用途 { get; set; }
        public int? M庫存數量 { get; set; }

        public virtual TEmployee? EIdNavigation { get; set; }
        public virtual TProduct? M衛材編號Navigation { get; set; }
    }
}
