﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace NursingHouseService.Models
{
    public partial class TPatientInfo
    {
        public TPatientInfo()
        {
            TApplicationForm = new HashSet<TApplicationForm>();
            TBed = new HashSet<TBed>();
            TFamilyMembers = new HashSet<TFamilyMembers>();
            TNursingRecord = new HashSet<TNursingRecord>();
            TOffService = new HashSet<TOffService>();
        }

        public int PId { get; set; }
        public string P編號 { get; set; }
        public int? EId { get; set; }
        public string P姓名 { get; set; }
        public string P性別 { get; set; }
        public string P身分證字號 { get; set; }
        public string P出生日期 { get; set; }
        public string P地址 { get; set; }
        public string P聯絡電話 { get; set; }
        public string P聯絡人 { get; set; }
        public string P電話2 { get; set; }
        public string P餐點 { get; set; }
        public string P醫師診斷 { get; set; }
        public string P主訴 { get; set; }
        public string 現在病史 { get; set; }
        public string 過去病史 { get; set; }
        public string 家族病史 { get; set; }
        public string 檢查 { get; set; }
        public string 指示與用藥 { get; set; }
        public DateTime? P建立 { get; set; }
        public DateTime? P更新 { get; set; }
        public string P照片 { get; set; }

        public virtual TEmployee EIdNavigation { get; set; }
        public virtual ICollection<TApplicationForm> TApplicationForm { get; set; }
        public virtual ICollection<TBed> TBed { get; set; }
        public virtual ICollection<TFamilyMembers> TFamilyMembers { get; set; }
        public virtual ICollection<TNursingRecord> TNursingRecord { get; set; }
        public virtual ICollection<TOffService> TOffService { get; set; }
    }
}