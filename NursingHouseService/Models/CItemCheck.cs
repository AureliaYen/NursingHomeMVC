using NursingHouseService.ViewModels;

namespace NursingHouseService.Models
{
    public class CItemCheck
    {
        public bool checkApplicationForm(tApplicationFormMoidify ap)
        {
            int temp = 0;
            if (string.IsNullOrEmpty(ap.app申請日期.ToString()))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(ap.app申請人))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(ap.app陪同人員))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(ap.app聯絡方式))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(ap.app外出日期.ToString()))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(ap.app事由))
            {
                return false;
            }
            else if (string.IsNullOrEmpty(ap.app地點))
            {
                return false;
            }
            else if (!int.TryParse(ap.app預計外出時間.ToString(), out temp))
            {
                return false;
            }
            return true;
        }
    }
}
