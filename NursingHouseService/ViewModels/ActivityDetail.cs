namespace NursingHouseService.ViewModels
{
    public class ActivityDetail
    {
        public string? E員工姓名 { get; set; }
        public string? E電話 { get; set; }
        public string? EEmail { get; set; }      
        public string? E性別 { get; set; }   
        public int ActId { get; set; }
        public string? Act活動編號 { get; set; }
        public string? Act活動名稱 { get; set; }
        public string? Act活動說明 { get; set; }
        public string? Act活動圖片 { get; set; }
        public DateTime Act活動日期 { get; set; }
        public string? Act地點 { get; set; }
        public DateTime Act報名截止日 { get; set; }
        public int Act價格 { get; set; }
        public string? Act主講人 { get; set; }
        public string? Act主講人描述 { get; set; }
        public string? Act注意事項 { get; set; }
        public int Act已報名人數 { get; set; }
        public int Act最大人數 { get; set; }      
    }
}
