using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TFamilyMember
    {
        public TFamilyMember()
        {
            TApplicationForms = new HashSet<TApplicationForm>();
        }

        public int FamId { get; set; }
        public int PId { get; set; }
        public string Fam姓名 { get; set; } = null!;
        public string Fam聯絡方式 { get; set; } = null!;
        public string Fam住址 { get; set; } = null!;
        public string? Fam備註 { get; set; }

        public virtual TPatientInfo PIdNavigation { get; set; } = null!;
        public virtual ICollection<TApplicationForm> TApplicationForms { get; set; }
    }
}
