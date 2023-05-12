namespace NursingHouseService.ViewModels
{
    // 時間轉換
    public class CDayTimeToDayViewModel
    {
        public string Today()
        {
            int d = Convert.ToInt32(System.DateTime.Now.ToString("dd"));
            int mm = Convert.ToInt32(System.DateTime.Now.ToString("MM"));
            int yy = Convert.ToInt32(System.DateTime.Now.ToString("yyyy"));
            string tempstr = yy.ToString() + "-" + mm + "-" + d;

            return tempstr;
        }
    }
}
