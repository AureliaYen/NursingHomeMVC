using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TApplicationForm
    {
        public int AppId { get; set; }
        public int PId { get; set; }
        public int EId { get; set; }
        public int FamId { get; set; }
        public int? OId { get; set; }
        public string App申請人 { get; set; } = null!;
        public string App陪同人員 { get; set; } = null!;
        public string App聯絡方式 { get; set; } = null!;
        public DateTime App申請日期 { get; set; }
        public DateTime? App外出日期 { get; set; }
        public string App事由 { get; set; } = null!;
        public string App地點 { get; set; } = null!;
        public DateTime? App出發時間 { get; set; }
        public int App預計外出時間 { get; set; }
        public DateTime? App返回時間 { get; set; }
        public string? App審核 { get; set; }
        public DateTime? App修改時間 { get; set; }
        public int? App修改人員 { get; set; }
        public int? App現況 { get; set; }
        public string? App結案 { get; set; }
        public string? App備註 { get; set; }

        public virtual TEmployee EIdNavigation { get; set; } = null!;
        public virtual TFamilyMember Fam { get; set; } = null!;
        public virtual TPatientInfo PIdNavigation { get; set; } = null!;
    }
}
