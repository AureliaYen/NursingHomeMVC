using preNursingHouse.Models;
using preNursingHouse.ViewModel;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace preNursingHouse.ViewModel
{
	public class COMealViewModel
	{
		private TOrderMeal _omeal;
		public TOrderMeal OrderMeal
		{
			get { return _omeal; }
			set { _omeal = value; }
		}

		public COMealViewModel()
		{
			_omeal = new TOrderMeal();
		}
		[Display(Name = "序號")]
		public int OmId
		{
			get { return _omeal.OmId; }
			set { _omeal.OmId = value; }
		}
		[Display(Name = "餐點序號")]
		public int? MeId
		{
			get { return _omeal.MeId; }
			set { _omeal.MeId = value; }
		}
		[DisplayName("訂購人")]
		public string? 訂購人
		{
			get { return _omeal.訂購人; }
			set { _omeal.訂購人 = value; }
		}
		[DisplayName("訂購人電話")]
		public string? 訂購人電話
		{
			get { return _omeal.訂購人電話; }
			set { _omeal.訂購人電話 = value; }
		}
		[DisplayName("訂餐起始日")]
		[DataType(DataType.Date)]
		public DateTime? 訂餐起始日
		{
			get { return _omeal.訂餐起始日; }
			set { _omeal.訂餐起始日 = value; }
		}
		[DisplayName("訂餐結束日")]
		[DataType(DataType.Date)]
		public DateTime? 訂餐結束日
		{
			get { return _omeal.訂餐結束日; }
			set { _omeal.訂餐結束日 = value; }
		}
		[DisplayName("總價")]
		public string? 總價
		{
			get { return _omeal.總價; }
			set { _omeal.總價 = value; }
		}
		[DisplayName("結帳狀態")]
		public string? 結帳狀態
		{
			get { return _omeal.結帳狀態; }
			set { _omeal.結帳狀態 = value; }
		}
		[DisplayName("建立時間")]
		[DataType(DataType.Date)]
		public DateTime? 建立時間
		{
			get { return _omeal.建立時間; }
			set { _omeal.建立時間 = value; }
		}
		[DisplayName("修改時間")]
		[DataType(DataType.Date)]
		public DateTime? 修改時間
		{
			get { return _omeal.修改時間; }
			set { _omeal.修改時間 = value; }
		}
		[DisplayName("修改人員")]
		public string? 修改人員
		{
			get { return _omeal.修改人員; }
			set { _omeal.修改人員 = value; }
		}
		[DisplayName("備註")]
		public string? 備註
		{
			get { return _omeal.備註; }
			set { _omeal.備註 = value; }
		}


		//public string? P編號
		//{
		//    get { return _bed.PIdNavigation.P編號; }
		//    set { _bed.PIdNavigation.P編號 = value; }
		//}
		//public string? P姓名
		//{
		//    get { return _bed.PIdNavigation.P姓名; }
		//    set { _bed.PIdNavigation.P姓名 = value; }
		//}

		public IEnumerable<TMeal>? 餐點表單 { get; set; }
		public IEnumerable<TPatientInfo>? 住民資料表單 { get; set; }
		public virtual TPatientInfo? PIdNavigation { get; set; }
		public virtual TMeal? MeIdNavigation { get; set; }
	}
}
