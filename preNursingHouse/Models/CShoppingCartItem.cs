using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace preNursingHouse.Models
{
	public class CShoppingCartItem
	{
		public int meId { get; set; }

		public string 購買人 { get; set; }
		public string 電話 { get; set; }
		public int count { get; set; }
		[DisplayName("起始日期")]
		[DataType(DataType.Date)]
		public DateTime? 訂餐起始日 { get; set; }

		[DisplayName("訂餐結束日")]
		[DataType(DataType.Date)]
		public DateTime? 訂餐結束日 { get; set; }

		public int? Days
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
		public decimal price { get; set; }

		public string 總額
		{
			get
			{
				if (Days.HasValue)
				{
					return (Days.Value * price).ToString();
				}
				return null;
			}
		}

		public TMeal meal { get; set; }
	}
}
