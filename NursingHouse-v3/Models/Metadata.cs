using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace NursingHouse_v3.Models
{
    public class TEmployeeMetadata
    {
        [Display(Name = "序號")]
        public int EId { get; set; }
        [Display(Name = "員工編號")]
        public string? E員工編號 { get; set; }
        [DisplayName("員工姓名")]
        [Required(ErrorMessage = "必填")]
        public string? E員工姓名 { get; set; }
        [DisplayName("電話")]
        [Required(ErrorMessage = "必填")]
        public string? E電話 { get; set; }
        [DisplayName("Email")]
        [Required(ErrorMessage = "必填")]
        public string? EEmail { get; set; }
        [DisplayName("地址")]
        [Required(ErrorMessage = "必填")]
        public string? E地址 { get; set; }
        [DisplayName("密碼")]
        [Required(ErrorMessage = "必填")]
        public string? E密碼 { get; set; }
        [DisplayName("性別")]
        public string? E性別 { get; set; }
        [DisplayName("身分證號")]
        //[Required(ErrorMessage = "必填")]
        [RegularExpression("[A-Z]{1}[1-2]{1}[0-9]{8}")]
        [Required(ErrorMessage = "必填 請輸入正確格式")]
        public string? E身分證號 { get; set; }
        [DisplayName("職稱")]
        public string? E職稱 { get; set; }
        [DisplayName("到職日期")]
        [DataType(DataType.Date)]
        public string? E到職日期 { get; set; }
        [DisplayName("離職日期")]
        [DataType(DataType.Date)]
        public string? E離職日期 { get; set; }
        [DisplayName("權限")]
        public int? E權限 { get; set; }
        [DisplayName("建立日期")]
        [DataType(DataType.Date)]
        public string? E建立日期 { get; set; }
        [DisplayName("建立者工號")]
        public string? E建立者工號 { get; set; }
        [DisplayName("修改日期")]
        [DataType(DataType.Date)]
        public string? E修改日期 { get; set; }
        [DisplayName("修改者工號")]
        public string? E修改者工號 { get; set; }
        [DisplayName("員工生日")]
        [DataType(DataType.Date)]
        public string? E員工生日 { get; set; }
        [DisplayName("照片")]
        public string? EImagePath { get; set; }
    }

    public partial class TBedMetadata
    {
        [DisplayName("序號")]
        public int BId { get; set; }
        [DisplayName("住民編號")]
        [Required(ErrorMessage = "必填")]
        public int? PId { get; set; }
        [DisplayName("床號")]
        public int? RbId { get; set; }
        [DisplayName("入住時間")]
        [DataType(DataType.Date)]
        public string? B入住時間 { get; set; }
        [DisplayName("預計退房時間")]
        [DataType(DataType.Date)]
        public string? B預計退房時間 { get; set; }
        [DisplayName("建立日期")]
        [DataType(DataType.Date)]
        public string? B建立日期 { get; set; }
        [DisplayName("建立者工號")]
        public string? B建立者工號 { get; set; }
        [DisplayName("修改日期")]
        [DataType(DataType.Date)]
        public string? B修改日期 { get; set; }
        [DisplayName("修改者工號")]
        public string? B修改者工號 { get; set; }
    }

    public partial class TRoombedMetadata
    {
        [DisplayName("序號")]
        public int RbId { get; set; }
        [DisplayName("房型")]
        [Required(ErrorMessage = "必填")]
        public string? Rb房型 { get; set; }
        [DisplayName("床號")]
        [Required(ErrorMessage = "必填")]
        public string? Rb床號 { get; set; }
        [DisplayName("空床")]
        public string? Rb空床 { get; set; }
        [DisplayName("建立日期")]
        [DataType(DataType.Date)]
        public string? Rb建立日期 { get; set; }
        [DisplayName("建立者工號")]
        public string? Rb建立者工號 { get; set; }
        [DisplayName("修改日期")]
        [DataType(DataType.Date)]
        public string? Rb修改日期 { get; set; }
        [DisplayName("修改者工號")]
        public string? Rb修改者工號 { get; set; }
    }


    public class EnrollmentMetadata
    {
        [Range(0, 4)]
        public Nullable<decimal> Grade;
    }


    public class TNursingRecordMetadata
    {

        public int NId { get; set; }
        public Nullable<int> EId { get; set; }
        public Nullable<int> PId { get; set; }
        public Nullable<int> OId { get; set; }
        [Display(Name = "舒張壓")]
        [Required(ErrorMessage = "必填")]
        public string? N舒張壓 { get; set; }
        [Display(Name = "收縮壓")]
        [Required(ErrorMessage = "必填")]
        public string? N收縮壓 { get; set; }
        [Display(Name = "體溫")]
        [Required(ErrorMessage = "必填")]
        public string? N體溫 { get; set; }
        [Display(Name = "脈搏")]
        [Required(ErrorMessage = "必填")]
        public string? N脈搏 { get; set; }
        [Display(Name = "呼吸速率")]
        [Required(ErrorMessage = "必填")]
        public string? N呼吸 { get; set; }
        [Display(Name = "傷口")]
        [Required(ErrorMessage = "必填")]
        public string? N傷口 { get; set; }
        [Display(Name = "管路液體量")]
        [Required(ErrorMessage = "必填")]
        public string? N三管 { get; set; }
        [Display(Name = "其他")]
        [Required(ErrorMessage = "必填")]
        public string? N其他 { get; set; }
        [Display(Name = "建立時間")]
        [Required(ErrorMessage = "必填")]
        public string? N紀錄時間 { get; set; }
        [Display(Name = "修改時間")]
        public string? N修改時間 { get; set; }
    }
    public class TOffServiceMetadata
    {
        public int OId { get; set; }
        public int? EId { get; set; }
        public int? PId { get; set; }
        [Display(Name = "就診日期")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "不可空白")]
        public string? O就診日期 { get; set; }
        [Display(Name = "回診日期")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "不可空白")]
        public string? O回診日期 { get; set; }
        [Display(Name = "醫師診斷")]
        [Required(ErrorMessage = "不可空白")]
        public string? O醫師診斷 { get; set; }
        [Display(Name = "指示與用藥")]
        [Required(ErrorMessage = "不可空白")]
        public string? O指示與用藥 { get; set; }
        [Display(Name = "建立")]
        public DateTime? O建立 { get; set; }
        [Display(Name = "更新")]
        public DateTime? O更新 { get; set; }
    }
    public class TPatientInfoMetadata
    {
        public int PId { get; set; }
        [Display(Name = "住民編號")]
        public string? P編號 { get; set; }
        public int? EId { get; set; }
        [Display(Name = "姓名")]
        [Required(ErrorMessage = "必填")]
        public string? P姓名 { get; set; }
        [Display(Name = "性別")]

        public string? P性別 { get; set; }
        [Display(Name = "身分證字號")]
        [RegularExpression("[A-Z]{1}[1-2]{1}[0-9]{8}")]
        [Required(ErrorMessage = "請輸入正確格式")]
        public string? P身分證字號 { get; set; }
        [Display(Name = "出生日期")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "請輸入生日")]
        public string? P出生日期 { get; set; }
        [Display(Name = "地址")]
        public string? P地址 { get; set; }
        [Display(Name = "住民電話")]
        //[Phone]
        [Required(ErrorMessage = "不可空白")]
        public string? P聯絡電話 { get; set; }
        [Display(Name = "聯絡人")]
        public string? P聯絡人 { get; set; }
        [Display(Name = "聯絡人電話")]
        //[Phone]
        public string? P電話2 { get; set; }
        [Display(Name = "餐點")]
        public string? P餐點 { get; set; }
        [Display(Name = "醫師診斷")]
        [Required(ErrorMessage = "不可空白")]
        public string? P醫師診斷 { get; set; }
        [Display(Name = "主訴")]
        [Required(ErrorMessage = "不可空白")]
        public string? P主訴 { get; set; }
        [Required(ErrorMessage = "不可空白")]
        public string? 現在病史 { get; set; }
        [Required(ErrorMessage = "不可空白")]
        public string? 過去病史 { get; set; }
        [Required(ErrorMessage = "不可空白")]
        public string? 家族病史 { get; set; }
        [Required(ErrorMessage = "不可空白")]
        public string? 檢查 { get; set; }
        [Required(ErrorMessage = "不可空白")]
        public string? 指示與用藥 { get; set; }
        [Display(Name = "建立")]
        //[DataType(DataType.DateTime)]
        // [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:ss}")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy/MM/dd HH:mm:ss}")]
        public DateTime? P建立 { get; set; }
        [Display(Name = "更新")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy/MM/dd HH:mm:ss}")]
        public DateTime? P更新 { get; set; }
        [Display(Name = "照片")]
        public string? P照片 { get; set; }

    }
    public partial class TOrderMetadata
    {
        [Display(Name = "進貨編號")]
        public int M進貨編號 { get; set; }

        [Display(Name = "進貨員工")]
        public int? EId { get; set; }
        [Display(Name = "衛材編號")]
        public int? M衛材編號 { get; set; }
        [Display(Name = "訂購數量")]
        public int? M訂購數量 { get; set; }
        [Display(Name = "單價")]
        public decimal? M價錢 { get; set; }
        [Display(Name = "小計")]
        public decimal? M小計 { get; set; }
        [Display(Name = "訂購日期")]
        public DateTime? M訂購日期 { get; set; }
        [Display(Name = "到貨日期")]
        public DateTime? M到貨日期 { get; set; }
        [Display(Name = "庫存數量")]
        public int? M庫存數量 { get; set; }
        [Display(Name = "訂購狀態")]
        public bool? M訂購狀態 { get; set; }



    }

    public class TProductMetadata
    {
        [Display(Name = "衛材編號")]
        public int M衛材編號 { get; set; }
        [Display(Name = "衛材名稱")]
        public string? M衛材名稱 { get; set; }
        [Display(Name = "單位")]
        public string? M單位 { get; set; }
        [Display(Name = "單價")]
        public decimal? M單價 { get; set; }
        [Display(Name = "庫存數量")]
        public int? M庫存數量 { get; set; }
        [Display(Name = "安全庫存數")]
        public int? M安全庫存數 { get; set; }
        [Display(Name = "訂購狀態")]
        public bool? M訂購狀態 { get; set; }



    }
    public class TTakeMetadata
    {
        [Display(Name = "領取編號")]
        public int M領取編號 { get; set; }
        [Display(Name = "領取員工")]

        public int? EId { get; set; }
        [Display(Name = "衛材編號")]
        public int? M衛材編號 { get; set; }
        [Display(Name = "領取數量")]
        public int? M領取數量 { get; set; }
        [Display(Name = "領取時間")]
        public DateTime? M領取時間 { get; set; }
        [Display(Name = "用途")]
        public string? M用途 { get; set; }
        [Display(Name = "庫存數量")]
        public int? M庫存數量 { get; set; }

    }

    public partial class TMemberMetadata
    {

        [Display(Name = "會員編號")]

        public int MId { get; set; }
        [Display(Name = "手機")]
        public string M手機 { get; set; } = null!;
        [Display(Name = "密碼")]
        public string M密碼 { get; set; } = null!;
        [Display(Name = "姓名")]
        public string M姓名 { get; set; } = null!;
        [Display(Name = "性別")]
        public bool? M性別 { get; set; }
        [Display(Name = "Email")]
        public string? MEmail { get; set; }
        [Display(Name = "照片")]
        public string? M照片 { get; set; }
        [Display(Name = "住址")]
        public string? M住址 { get; set; }
        [Display(Name = "加入時間")]
        public DateTime M加入時間 { get; set; }
        [Display(Name = "修改時間")]
        public DateTime? M修改時間 { get; set; }
        [Display(Name = "最後登入時間")]
        public DateTime? M最後登入時間 { get; set; }
        [Display(Name = "備註")]
        public string? M備註 { get; set; }
        [Display(Name = "刪除會員")]
        public bool? M刪除會員 { get; set; }
        [Display(Name = "權限")]
        public string? M權限 { get; set; }


    }
}
	


