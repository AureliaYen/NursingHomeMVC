using NursingHouse_v3.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace NursingHouse_v3.InputViewModel
{
	public class COffServiceInput
	{
		private TOffService _offservice;
		public TOffService OffService
		{
			get { return _offservice; }
			set { _offservice = value; }
		}
		public COffServiceInput()
		{
			_offservice = new TOffService();
		}

		public int OID
		{
			get { return _offservice.OId; }
			set { _offservice.OId = value; }
		}
		public int? EID
		{
			get { return _offservice.EId; }
			set { _offservice.EId = value; }
		}

		public int? PID
		{
			get { return _offservice.PId; }
			set { _offservice.PId = value; }
		}
		[Display(Name = "就診日期")]
		[DataType(DataType.Date)]
		[Required(ErrorMessage = "不可空白")]
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

		[Display(Name = "醫師診斷")]
		[Required(ErrorMessage = "不可空白")]
		public string? O醫師診斷
		{
			get { return _offservice.O醫師診斷; }
			set { _offservice.O醫師診斷 = value; }
		}
		[Display(Name = "指示與用藥")]
		[Required(ErrorMessage = "不可空白")]
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


		public IEnumerable<TPatientInfo>? 住民表單 { get; set; }
		public IEnumerable<TEmployee>? 員工表單 { get; set; }



	}
}
