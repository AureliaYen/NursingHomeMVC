﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace NursingHouseService.Models
{
    public partial class TActivity
    {
        public TActivity()
        {
            TActivityCollect = new HashSet<TActivityCollect>();
            TActivityComment = new HashSet<TActivityComment>();
            TActivityOrder = new HashSet<TActivityOrder>();
        }

        public int ActId { get; set; }
        public int EId { get; set; }
        public string Act活動編號 { get; set; }
        public string Act活動名稱 { get; set; }
        public string Act活動說明 { get; set; }
        public string Act活動圖片 { get; set; }
        public DateTime Act活動日期 { get; set; }
        public string Act地點 { get; set; }
        public DateTime Act報名截止日 { get; set; }
        public int Act價格 { get; set; }
        public string Act主講人 { get; set; }
        public string Act主講人描述 { get; set; }
        public string Act注意事項 { get; set; }
        public int Act公開狀態 { get; set; }
        public int Act已報名人數 { get; set; }
        public int Act最大人數 { get; set; }
        public DateTime Act建立日期 { get; set; }
        public DateTime? Act修改日期 { get; set; }
        public string Act最後修改人 { get; set; }
        public int? Act結案 { get; set; }
        public string Act備註 { get; set; }

        public virtual TEmployee EIdNavigation { get; set; }
        public virtual ICollection<TActivityCollect> TActivityCollect { get; set; }
        public virtual ICollection<TActivityComment> TActivityComment { get; set; }
        public virtual ICollection<TActivityOrder> TActivityOrder { get; set; }
    }
}