﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace NursingHouseService.Models
{
    public partial class TFamilyMembers
    {
        public TFamilyMembers()
        {
            TApplicationForm = new HashSet<TApplicationForm>();
        }

        public int FamId { get; set; }
        public int PId { get; set; }
        public string Fam姓名 { get; set; }
        public string Fam聯絡方式 { get; set; }
        public string Fam住址 { get; set; }
        public string Fam備註 { get; set; }

        public virtual TPatientInfo PIdNavigation { get; set; }
        public virtual ICollection<TApplicationForm> TApplicationForm { get; set; }
    }
}