namespace NursingHouseService.ViewModels
{
    public class CCalendarDataViewModel
    {
        public string? Name { get; set; }
        public int appId { get; set; }
        public int pid { get; set; }
        public int eid { get; set; }
		public DateTime? 外出日期 { get; set; }
        public string? reason { get; set; }

	}
}
