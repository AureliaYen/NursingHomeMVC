﻿using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TActivityMessage
    {
        public int AmId { get; set; }
        public int Am活動編號 { get; set; }
        public int Am會員Id { get; set; }
        public int Am發送次數 { get; set; }
        public int Am繳費通知 { get; set; }
        public int Am報名成功 { get; set; }
        public int Am行前通知 { get; set; }
        public int Am緊急訊息 { get; set; }
        public string? Am備註 { get; set; }

        public virtual TMember Am會員 { get; set; } = null!;
    }
}
