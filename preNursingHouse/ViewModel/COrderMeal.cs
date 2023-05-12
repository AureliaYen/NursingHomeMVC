using preNursingHouse.Models;

namespace preNursingHouse.ViewModel
{
	public class COrderMeal
	{

		//public int OmId { get; set; }
		public int? txtMeId { get; set; }
		//public string 訂購人 { get; set; }
		//public string 訂購人電話 { get; set; }
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
