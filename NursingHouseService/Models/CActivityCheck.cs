using NursingHouseService.ViewModels;


namespace NursingHouseService.Models
{
    public class CActivityCheck
    {
        public bool checkActivityItem(tActivityViewModel act)
        {
            bool check = true;
            int temp = 0;
            if (string.IsNullOrEmpty(act.Act活動名稱))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act活動說明))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act活動圖片))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act活動日期.ToString()))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act地點))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act報名截止日.ToString()))
            {
                return false;
            }
            else if (!int.TryParse(act.Act價格.ToString(), out temp))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act主講人))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act主講人描述))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(act.Act注意事項))
            {
                return false;
            }
            else if (!int.TryParse(act.Act公開狀態.ToString(), out temp))
            {
                return false;
            }
            else if (!int.TryParse(act.Act最大人數.ToString(), out temp))
            {
                return false;
            }

            return check;
        }


    }
}
