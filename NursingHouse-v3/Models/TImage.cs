﻿using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TImage
    {
        public int MaId { get; set; }
        public int? MeId { get; set; }
        public string? 月圖 { get; set; }
        public string? 早圖 { get; set; }
        public string? 午圖 { get; set; }
        public string? 晚圖 { get; set; }
        public string? 圖一 { get; set; }
        public string? 圖二 { get; set; }
        public string? 圖三 { get; set; }

        public virtual TMeal? Me { get; set; }
    }
}
