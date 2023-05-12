using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace NursingHouseService.ViewModels
{
	public class tApplicationFormMoidify
	{
		[DisplayName("申請表編號")]
		public int appId { get; set; }

		[DisplayName("住民編號")]
		public int paId { get; set; }

		[DisplayName("員工編號")]
		public int emId { get; set; }

		[DisplayName("家屬編號")]
		public int famId { get; set; }

		public int oId { get; set; }

		[DisplayName("住民姓名")]
		public string? p姓名 { get; set; }

		[DisplayName("申請人")]
		[RegularExpression(@"^[\u4e00-\u9fa5]{0,}$", ErrorMessage = "只能輸入中文")]
		[Required]
		public string? app申請人 { get; set; }

		[DisplayName("陪同人員")]
		[RegularExpression(@"^[\u4e00-\u9fa5]{0,}$", ErrorMessage = "只能輸入中文")]
		[Required]
		public string? app陪同人員 { get; set; }

		[DisplayName("聯絡方式")]
		[RegularExpression(@"^09[0-9]{8}$", ErrorMessage = "只能手機號碼")]
		[Required]
		public string? app聯絡方式 { get; set; }

		[DisplayFormat(DataFormatString = "{0:MM/dd}")]
		[DisplayName("申請日期")]
		public System.DateTime app申請日期 { get; set; }

		[DisplayFormat(DataFormatString = "{0:MM/dd}", ApplyFormatInEditMode = true)]
		[DisplayName("外出日期")]
		[Required]
		public System.DateTime app外出日期 { get; set; }

		[DisplayName("事由")]
		[RegularExpression(@"^[\u4e00-\u9fa5]{0,}$", ErrorMessage = "只能輸入中文")]
		[Required]
		public string? app事由 { get; set; }

		[DisplayName("地點")]
		[RegularExpression(@"^[\u4e00-\u9fa5]{0,}$", ErrorMessage = "只能輸入中文")]
		[Required]
		public string? app地點 { get; set; }		

		[DisplayName("預計外出時間")]
		[Required]
		public int app預計外出時間 { get; set; }

		[DisplayName("備註")]
		public string? app備註 { get; set; }


	}
}
