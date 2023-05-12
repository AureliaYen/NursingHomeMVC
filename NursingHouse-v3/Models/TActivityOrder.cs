using System;
using System.Collections.Generic;

namespace NursingHouse_v3.Models
{
    public partial class TActivityOrder
    {
        public int AoId { get; set; }
        public int Ao會員Id { get; set; }
        public string? Ao參加人姓名 { get; set; }
        public string? Ao參加人電話 { get; set; }
        public string? Ao參加人Email { get; set; }
        public int Ao活動編號 { get; set; }
        public int? Ao參與人數 { get; set; }
        public DateTime Ao訂單建立日期 { get; set; }
        public DateTime? Ao修改日期 { get; set; }
        public int? Ao修改人 { get; set; }
        public string Ao訂單進度 { get; set; } = null!;
        public int Ao金額 { get; set; }
        public int? Ao結案 { get; set; }
        public string? Ao備註 { get; set; }

        public virtual TMember Ao會員 { get; set; } = null!;
        public virtual TActivity Ao活動編號Navigation { get; set; } = null!;
    }
}
