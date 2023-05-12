using NursingHouse_v3.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace NursingHouse_v3.ViewModel
{
	public class CNursingRecordViewModel
	{
		private TNursingRecord _nursingrecord;
		public TNursingRecord NursingRecord
		{
			get { return _nursingrecord; }
			set { _nursingrecord = value; }
		}
		public CNursingRecordViewModel()
		{
			_nursingrecord = new TNursingRecord();
		}
		public int NId
		{
			get { return _nursingrecord.NId; }
			set { _nursingrecord.NId = value; }
		}
		public int? EId
		{
			get { return _nursingrecord.EId; }
			set { _nursingrecord.EId = value; }
		}
		public int? PId
		{
			get { return _nursingrecord.PId; }
			set { _nursingrecord.PId = value; }
		}
		public int? OId
		{
			get { return _nursingrecord.OId; }
			set { _nursingrecord.OId = value; }
		}
		public string? P姓名
		{
			get { return _nursingrecord.OIdNavigation.PIdNavigation.P姓名; }
			set { _nursingrecord.OIdNavigation.PIdNavigation.P姓名 = value; }
		}

		//public string? 住民編號
		//{
		//    get { return _nursingrecord.OIdNavigation.PIdNavigation.P編號; }
		//    set { _nursingrecord.OIdNavigation.PIdNavigation.P編號 = value; }
		//}
		//public string? 姓名
		//{
		//    get { return _nursingrecord.OIdNavigation.PIdNavigation.P姓名; }
		//    set { _nursingrecord.OIdNavigation.PIdNavigation.P姓名 = value; }
		//}
		public string? 身分證字號
		{
			get { return _nursingrecord.OIdNavigation.PIdNavigation.P身分證字號; }
			set { _nursingrecord.OIdNavigation.PIdNavigation.P身分證字號 = value; }
		}
		//public string? 性別
		//{
		//    get { return _nursingrecord.OIdNavigation.PIdNavigation.P性別; }
		//    set { _nursingrecord.OIdNavigation.PIdNavigation.P性別 = value; }
		//}
		public string? 醫師診斷
		{
			get { return _nursingrecord.OIdNavigation.O醫師診斷; }
			set { _nursingrecord.OIdNavigation.O醫師診斷 = value; }
		}

		public string? 指示與用藥
		{
			get { return _nursingrecord.OIdNavigation.O指示與用藥; }
			set { _nursingrecord.OIdNavigation.O指示與用藥 = value; }
		}
		[Display(Name = "舒張壓")]
		//[Required(ErrorMessage = "必填")]
		public string? N舒張壓
		{
			get { return _nursingrecord.N舒張壓; }
			set { _nursingrecord.N舒張壓 = value; }
		}
		[Display(Name = "收縮壓")]
		//[Required(ErrorMessage = "必填")]
		public string? N收縮壓
		{
			get { return _nursingrecord.N收縮壓; }
			set { _nursingrecord.N收縮壓 = value; }
		}
		[Display(Name = "體溫")]
		//[Required(ErrorMessage = "必填")]
		public string? N體溫
		{
			get { return _nursingrecord.N體溫; }
			set { _nursingrecord.N體溫 = value; }
		}
		[Display(Name = "脈搏")]
		//[Required(ErrorMessage = "必填")]
		public string? N脈搏
		{
			get { return _nursingrecord.N脈搏; }
			set { _nursingrecord.N脈搏 = value; }
		}
		[Display(Name = "呼吸速率")]
		//[Required(ErrorMessage = "必填")]
		public string? N呼吸
		{
			get { return _nursingrecord.N呼吸; }
			set { _nursingrecord.N呼吸 = value; }
		}
		[Display(Name = "傷口")]
		//[Required(ErrorMessage = "必填")]
		public string? N傷口
		{
			get { return _nursingrecord.N傷口; }
			set { _nursingrecord.N傷口 = value; }
		}
		[Display(Name = "管路液體量")]
		//[Required(ErrorMessage = "必填")]
		public string? N三管
		{
			get { return _nursingrecord.N三管; }
			set { _nursingrecord.N三管 = value; }
		}
		[Display(Name = "其他")]
		//[Required(ErrorMessage = "必填")]
		public string? N其他
		{
			get { return _nursingrecord.N其他; }
			set { _nursingrecord.N其他 = value; }
		}
		[Display(Name = "建立時間")]
		//[Required(ErrorMessage = "必填")]
		public string? N紀錄時間
		{
			get { return _nursingrecord.N紀錄時間; }
			set { _nursingrecord.N紀錄時間 = value; }
		}
		[Display(Name = "修改時間")]
		//[Required(ErrorMessage = "必填")]
		public string? N修改時間
		{
			get { return _nursingrecord.N修改時間; }
			set { _nursingrecord.N修改時間 = value; }
		}
		public string? 記錄人員
		{
			get { return _nursingrecord.EIdNavigation.E員工姓名; }
			set { _nursingrecord.EIdNavigation.E員工姓名 = value; }
		}
		public IEnumerable<TPatientInfo> 住民表單 { get; set; }
		public IEnumerable<TEmployee> 員工表單 { get; set; }

		public IEnumerable<TOffService> 就醫交班表 { get; set; }


		public virtual TEmployee? EIdNavigation { get; set; }
		public virtual TOffService? OIdNavigation { get; set; }
		public virtual TPatientInfo? PIdNavigation { get; set; }
	}
}
