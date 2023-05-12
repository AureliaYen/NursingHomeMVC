using NursingHouse_v3.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace NursingHouse_v3.InputViewModel
{
	public class CPatientInfoInput
	{
		private TPatientInfo _patient;
		public TPatientInfo patient
		{
			get { return _patient; }
			set { _patient = value; }
		}
		public CPatientInfoInput()
		{
			_patient = new TPatientInfo();
		}
		public int PId
		{
			get { return _patient.PId; }
			set { _patient.PId = value; }
		}
		[Display(Name = "住民編號")]
		public string? P編號
		{
			get { return _patient.P編號; }
			set { _patient.P編號 = value; }
		}
		public int? EId
		{
			get { return _patient.EId; }
			set { _patient.EId = value; }
		}
		[Display(Name = "姓名")]
		[Required(ErrorMessage = "必填")]
		public string? P姓名
		{
			get { return _patient.P姓名; }
			set { _patient.P姓名 = value; }
		}
		[Display(Name = "性別")]
		public string? P性別
		{
			get { return _patient.P性別; }
			set { _patient.P性別 = value; }
		}
		[Display(Name = "身分證字號")]
		[RegularExpression("[A-Z]{1}[1-2]{1}[0-9]{8}")]
		[Required(ErrorMessage = "請輸入正確格式")]
		public string? P身分證字號
		{
			get { return _patient.P身分證字號; }
			set { _patient.P身分證字號 = value; }
		}
		[Display(Name = "出生日期")]
		[DataType(DataType.Date)]
		[Required(ErrorMessage = "請輸入生日")]
		public string? P出生日期
		{
			get { return _patient.P出生日期; }
			set { _patient.P出生日期 = value; }
		}
		[Display(Name = "地址")]
		public string? P地址
		{
			get { return _patient.P地址; }
			set { _patient.P地址 = value; }
		}
		[Display(Name = "住民電話")]
		// [Phone]
		[Required(ErrorMessage = "不可空白")]
		public string? P聯絡電話
		{
			get { return _patient.P聯絡電話; }
			set { _patient.P聯絡電話 = value; }
		}
		[Display(Name = "聯絡人")]
		public string? P聯絡人
		{
			get { return _patient.P聯絡人; }
			set { _patient.P聯絡人 = value; }
		}
		[Display(Name = "聯絡人電話")]
		// [Phone]
		public string? P電話2
		{
			get { return _patient.P電話2; }
			set { _patient.P電話2 = value; }
		}
		[Display(Name = "餐點")]
		public string? P餐點
		{
			get { return _patient.P餐點; }
			set { _patient.P餐點 = value; }
		}
		[Display(Name = "醫師診斷")]
		[Required(ErrorMessage = "不可空白")]
		public string? P醫師診斷
		{
			get { return _patient.P醫師診斷; }
			set { _patient.P醫師診斷 = value; }
		}
		[Display(Name = "主訴")]
		[Required(ErrorMessage = "不可空白")]
		public string? P主訴
		{
			get { return _patient.P主訴; }
			set { _patient.P主訴 = value; }
		}
		[Required(ErrorMessage = "不可空白")]
		public string? 現在病史
		{
			get { return _patient.現在病史; }
			set { _patient.現在病史 = value; }
		}
		[Required(ErrorMessage = "不可空白")]
		public string? 過去病史
		{
			get { return _patient.過去病史; }
			set { _patient.過去病史 = value; }
		}
		[Required(ErrorMessage = "不可空白")]
		public string? 家族病史
		{
			get { return _patient.家族病史; }
			set { _patient.家族病史 = value; }
		}
		[Required(ErrorMessage = "不可空白")]
		public string? 檢查
		{
			get { return _patient.檢查; }
			set { _patient.檢查 = value; }
		}
		[Required(ErrorMessage = "不可空白")]
		public string? 指示與用藥
		{
			get { return _patient.指示與用藥; }
			set { _patient.指示與用藥 = value; }
		}
		//[Required(ErrorMessage = "不可空白")]
		public DateTime? P建立
		{
			get { return _patient.P建立; }
			set { _patient.P建立 = value; }
		}
		//[Display(Name = "建立")]
		//[DataType(DataType.DateTime)]
		// [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:ss}")]
		//[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy/MM/dd HH:mm:ss}")]
		//public DateTime? P更新
		//{
		//    get { return _patient.P更新; }
		//    set { _patient.P更新 = value; }
		//}
		//[Display(Name = "更新")]
		public string? P照片
		{
			get { return _patient.P照片; }
			set { _patient.P照片 = value; }
		}

		public IFormFile photo { get; set; } //要上傳照片，要用IFormFile屬性。

		public IEnumerable<TEmployee>? 員工表單 { get; set; }

	}
}
