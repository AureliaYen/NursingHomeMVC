﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace NursingHouseService.Models
{
    public partial class TOrderMeal
    {
        public int OmId { get; set; }
        public int? MeId { get; set; }
        public string 訂購人 { get; set; }
        public string 訂購人電話 { get; set; }
        public DateTime? 訂餐起始日 { get; set; }
        public DateTime? 訂餐結束日 { get; set; }
        public string 總價 { get; set; }
        public string 結帳狀態 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public DateTime? 修改時間 { get; set; }
        public string 修改人員 { get; set; }
        public string 備註 { get; set; }

        public virtual TMeal Me { get; set; }
    }
}