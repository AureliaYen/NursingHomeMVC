using NursingHouse_v3.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace NursingHouse_v3.ViewModel
{
	public class COffServiceViewModel
	{
		private TOffService _offservice;
		public TOffService OffService
		{
			get { return _offservice; }
			set { _offservice = value; }
		}
		public COffServiceViewModel()
		{
			_offservice = new TOffService();
		}

		public int OId
		{
			get { return _offservice.OId; }
			set { _offservice.OId = value; }
		}
		public int? EId
		{
			get { return _offservice.EId; }
			set { _offservice.EId = value; }
		}

		public int? PId
		{
			get { return _offservice.PId; }
			set { _offservice.PId = value; }
		}
		[Display(Name = "就診日期")]
		[DataType(DataType.Date)]
		// [Required(ErrorMessage = "不可空白")]
		public string? O就診日期
		{
			get { return _offservice.O就診日期; }
			set { _offservice.O就診日期 = value; }
		}
		[Display(Name = "回診日期")]
		[DataType(DataType.Date)]
		public string? O回診日期
		{
			get { return _offservice.O回診日期; }
			set { _offservice.O回診日期 = value; }
		}
		public string? 姓名
		{
			get { return _offservice.PIdNavigation.P姓名; }
			set { _offservice.PIdNavigation.P姓名 = value; }
		}
		//public string? 身分證字號
		//{
		//    get { return _offservice.PIdNavigation.P身分證字號; }
		//    set { _offservice.PIdNavigation.P身分證字號 = value; }
		//}
		public string? 性別
		{
			get { return _offservice.PIdNavigation.P性別; }
			set { _offservice.PIdNavigation.P性別 = value; }
		}
		public string? 出生年月日
		{
			get { return _offservice.PIdNavigation.P出生日期; }
			set { _offservice.PIdNavigation.P出生日期 = value; }
		}
		[Display(Name = "醫師診斷")]
		//[Required(ErrorMessage = "不可空白")]
		public string? O醫師診斷
		{
			get { return _offservice.O醫師診斷; }
			set { _offservice.O醫師診斷 = value; }
		}
		[Display(Name = "指示與用藥")]
		//[Required(ErrorMessage = "不可空白")]
		public string? O指示與用藥
		{
			get { return _offservice.O指示與用藥; }
			set { _offservice.O指示與用藥 = value; }
		}
		[Display(Name = "建立")]
		public DateTime? O建立
		{
			get { return _offservice.O建立; }
			set { _offservice.O建立 = value; }
		}
		[Display(Name = "更新")]
		public DateTime? O更新
		{
			get { return _offservice.O更新; }
			set { _offservice.O更新 = value; }
		}
		public string? 紀錄人員
		{
			get { return _offservice.EIdNavigation.E員工姓名; }
			set { _offservice.EIdNavigation.E員工姓名 = value; }
		}

		public IEnumerable<TPatientInfo>? 住民表單 { get; set; }
		public IEnumerable<TEmployee>? 員工表單 { get; set; }


		//  public virtual TEmployee? EIdNavigation { get; set; }
		public virtual TPatientInfo? PIdNavigation { get; set; }
		public virtual ICollection<TNursingRecord> TNursingRecords { get; set; }

	}
}
