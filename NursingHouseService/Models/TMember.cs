﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace NursingHouseService.Models
{
    public partial class TMember
    {
        public TMember()
        {
            TActivityCollect = new HashSet<TActivityCollect>();
            TActivityComment = new HashSet<TActivityComment>();
            TActivityMessage = new HashSet<TActivityMessage>();
            TActivityOrder = new HashSet<TActivityOrder>();
        }

        public int MId { get; set; }
        public string M手機 { get; set; }
        public string M密碼 { get; set; }
        public string M姓名 { get; set; }
        public bool? M性別 { get; set; }
        public string MEmail { get; set; }
        public string M照片 { get; set; }
        public string M住址 { get; set; }
        public DateTime M加入時間 { get; set; }
        public DateTime? M修改時間 { get; set; }
        public DateTime? M最後登入時間 { get; set; }
        public string M備註 { get; set; }
        public bool? M刪除會員 { get; set; }
        public string M權限 { get; set; }

        public virtual ICollection<TActivityCollect> TActivityCollect { get; set; }
        public virtual ICollection<TActivityComment> TActivityComment { get; set; }
        public virtual ICollection<TActivityMessage> TActivityMessage { get; set; }
        public virtual ICollection<TActivityOrder> TActivityOrder { get; set; }
    }
}