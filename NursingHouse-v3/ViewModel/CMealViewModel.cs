using NursingHouse_v3.Models;

namespace NursingHouse_v3.ViewModel
{
	public class CMealViewModel
	{
		private TMeal _meal;
		public TMeal Meal
		{
			get { return _meal; }
			set { _meal = value; }
		}
		public CMealViewModel()
		{
			_meal = new TMeal();
		}
		public int MeId
		{
			get { return _meal.MeId; }
			set { _meal.MeId = value; }
		}
		public int? SuId
		{
			get { return _meal.SuId; }
			set { _meal.SuId = value; }
		}
		public string? 月
		{
			get { return _meal.月; }
			set { _meal.月 = value; }
		}
		public string? 餐種
		{
			get { return _meal.餐種; }
			set { _meal.餐種 = value; }
		}
		public string? 餐別
		{
			get { return _meal.餐別; }
			set { _meal.餐別 = value; }
		}
		public string? 價位
		{
			get { return _meal.價位; }
			set { _meal.價位 = value; }
		}
		public DateTime? 建立時間
		{
			get { return _meal.建立時間; }
			set { _meal.建立時間 = value; }
		}
		public DateTime? 修改時間
		{
			get { return _meal.修改時間; }
			set { _meal.修改時間 = value; }
		}
		public string? 建立人
		{
			get { return _meal.建立人; }
			set { _meal.建立人 = value; }
		}
		public string? 備註
		{
			get { return _meal.備註; }
			set { _meal.備註 = value; }
		}
		public IEnumerable<TSupplier>? 廠商表單 { get; set; }
	}
}
