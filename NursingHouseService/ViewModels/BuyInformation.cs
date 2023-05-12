namespace NursingHouseService.ViewModels
{
    public class BuyInformation
    {
        public int ActId { get; set; }  
        public string? Act活動編號 { get; set; }
        public string? Act活動名稱 { get; set; }
        public string? Act活動說明 { get; set; }
        public DateTime Act活動日期 { get; set; }
        public string? Act地點 { get; set; }
        public DateTime Act報名截止日 { get; set; }
        public int Act價格 { get; set; }
        public string? Act注意事項 { get; set; }
        public int Act已報名人數 { get; set; }
        public int Act最大人數 { get; set; }
        public int MId { get; set; }
        public string? M手機 { get; set; }
        public string? M姓名 { get; set; }
        public string? MEmail { get; set; }      
    }
}
