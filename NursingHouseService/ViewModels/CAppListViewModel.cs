using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace NursingHouseService.ViewModels
{
    public class CAppListViewModel
    {
        [DisplayName("外出單編號")]
        public int appId { get; set; }

        [DisplayName("住民編號")]
        public int paId { get; set; }

        [DisplayName("住民姓名")]
        public string? p姓名 { get; set; }

        [DisplayName("陪同人員")]
        [Required]
        public string? app陪同人員 { get; set; }

        [DisplayName("聯絡方式")]
        [Required]
        public string? app聯絡方式 { get; set; }

        [DisplayName("事由")]
        [Required]
        public string? app事由 { get; set; }

        [DisplayName("地點")]
        [Required]
        public string? app地點 { get; set; }

        [DisplayName("出發時間")]
        [Required]
        [DisplayFormat(DataFormatString = "{0:HH:mm}")]
        public Nullable<System.DateTime> app出發時間 { get; set; }

        [DisplayName("外出日期")]
        [DisplayFormat(DataFormatString = "{0:MM/dd}")]
        public System.DateTime app外出日期 { get; set; }

        [DisplayName("預計外出時間")]
        [Required]
        public int app預計外出時間 { get; set; }
    }
}
