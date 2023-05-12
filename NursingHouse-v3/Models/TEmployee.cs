using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TEmployee
    {
        public TEmployee()
        {
            TActivities = new HashSet<TActivity>();
            TApplicationForms = new HashSet<TApplicationForm>();
            TNursingRecords = new HashSet<TNursingRecord>();
            TOffServices = new HashSet<TOffService>();
            TOrders = new HashSet<TOrder>();
            TPatientInfos = new HashSet<TPatientInfo>();
            TShifts = new HashSet<TShift>();
            TTakes = new HashSet<TTake>();
        }

        public int EId { get; set; }
        public string? E員工編號 { get; set; }
        public string? E員工姓名 { get; set; }
        public string? E電話 { get; set; }
        public string? EEmail { get; set; }
        public string? E地址 { get; set; }
        public string? E密碼 { get; set; }
        public string? E性別 { get; set; }
        public string? E身分證號 { get; set; }
        public string? E職稱 { get; set; }
        public DateTime? E到職日期 { get; set; }
        public DateTime? E離職日期 { get; set; }
        public int? E權限 { get; set; }
        public DateTime? E建立日期 { get; set; }
        public string? E建立者工號 { get; set; }
        public DateTime? E修改日期 { get; set; }
        public string? E修改者工號 { get; set; }
        public DateTime? E員工生日 { get; set; }
        public string? EImagePath { get; set; }

        public virtual ICollection<TActivity> TActivities { get; set; }
        public virtual ICollection<TApplicationForm> TApplicationForms { get; set; }
        public virtual ICollection<TNursingRecord> TNursingRecords { get; set; }
        public virtual ICollection<TOffService> TOffServices { get; set; }
        public virtual ICollection<TOrder> TOrders { get; set; }
        public virtual ICollection<TPatientInfo> TPatientInfos { get; set; }
        public virtual ICollection<TShift> TShifts { get; set; }
        public virtual ICollection<TTake> TTakes { get; set; }
    }
}
