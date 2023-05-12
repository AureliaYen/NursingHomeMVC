using NursingHouseService.Models;

namespace NursingHouseService.ViewModels
{
	public class tActivityOrderViewModel
	{
		public string? 訂單編號 { get; set; }
		public int AoId { get; set; }
		public int Ao會員Id { get; set; }
		public string? Ao參加人姓名 { get; set; }
		public string? Ao參加人電話 { get; set; }
		public string? Ao參加人Email { get; set; }
		public int Ao活動編號 { get; set; }
		public int Ao參與人數 { get; set; }
		public DateTime Ao訂單建立日期 { get; set; }
		public string? Ao訂單進度 { get; set; }
		public int Ao金額 { get; set; }
        public DateTime Act活動日期 { get; set; }
        public string? Act活動編號 { get; set; }
		public string? Act活動名稱 { get; set; }
		public string? Act活動說明 { get; set; }
		public string? Act地點 { get; set; }
		public int Act已報名人數 { get; set; }
		public int Act最大人數 { get; set; }

	}
}
