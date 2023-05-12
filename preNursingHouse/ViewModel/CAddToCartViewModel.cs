using System.ComponentModel.DataAnnotations;
using System.ComponentModel;


namespace preNursingHouse.ViewModel
{
	public class CAddToCartViewModel
	{
		public int txtMeId { get; set; }
		public int txtCount { get; set; }
		[DisplayName("購買人")]
		[Required(ErrorMessage = "請輸入購買人")]
		public string txt購買人 { get; set; }
		[DisplayName("電話")]
		[Required(ErrorMessage = "請輸入電話")]
		public string txt電話 { get; set; }
		[DisplayName("起始日期")]
		[DataType(DataType.Date)]
		public DateTime? txt訂餐起始日 { get; set; }
		[DisplayName("起始日期")]
		[DataType(DataType.Date)]
		public DateTime? txt訂餐結束日 { get; set; }

		public int? txtDays
		{
			get
			{
				if (txt訂餐起始日.HasValue && txt訂餐結束日.HasValue)
				{
					TimeSpan diff = txt訂餐結束日.Value - txt訂餐起始日.Value;
					return diff.Days;
				}
				return null;
			}
		}
	}


}
