using System.ComponentModel;

namespace NursingHouseService.ViewModels
{
    public class CStayViewModel
    {
        [DisplayName("住民編號")]
        public int pId { get; set; }

        [DisplayName("住民姓名")]
        public string? p姓名 { get; set; }

        [DisplayName("員工姓名")]
        public string? e員工姓名 { get; set; }

        [DisplayName("床號")]
        public string? b床號 { get; set; }
    }
}
