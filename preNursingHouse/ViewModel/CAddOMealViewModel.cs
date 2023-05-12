using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Xml.Linq;
using preNursingHouse.Models;
using preNursingHouse.ViewModel;

namespace preNursingHouse.ViewModel
{
	public class CAddOMealViewModel
	{
		//private TOrderMeal _ordermeal;
		//public TOrderMeal OrderMeal
		//{
		//    get { return _ordermeal; }
		//    set { _ordermeal = value; }
		//}

		//public CAddOMealViewModel()
		//{
		//    _ordermeal = new TOrderMeal();
		//}
		//[Display(Name = "序號")]
		//public int OmId
		//{
		//    get { return _ordermeal.OmId; }
		//    set { _ordermeal.OmId = value; }
		//}
		//[Display(Name = "餐點序號")]
		public int txtMeId { get; set; }
		public int txtCount { get; set; }

		//    [DisplayName("訂購人")]
		//    public string? 訂購人
		//    {
		//        get { return _ordermeal.訂購人; }
		//        set { _ordermeal.訂購人 = value; }
		//    }
		//    [DisplayName("訂購人電話")]
		//    public string? 訂購人電話
		//    {
		//        get { return _ordermeal.訂購人電話; }
		//        set { _ordermeal.訂購人電話 = value; }
		//    }
		public DateTime? 訂餐起始日 { get; set; }
		public DateTime? 訂餐結束日 { get; set; }
		public int? txtDays
		{
			get
			{
				if (訂餐起始日.HasValue && 訂餐結束日.HasValue)
				{
					TimeSpan diff = 訂餐結束日.Value - 訂餐起始日.Value;
					return diff.Days;
				}
				return null;
			}
		}
		public string 總價 { get; set; }
		public string 結帳狀態 { get; set; }


		public string 備註 { get; set; }

		public virtual TMeal? MeIdNavigation { get; set; }
	}
}
