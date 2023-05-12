using NursingHouse_v3.Models;

namespace NursingHouse_v3.ViewModel
{
	public class CMemberViewModel
	{
		private TMember _member;
		public TMember member
		{
			get { return _member; }
			set { _member = value; }
		}
		public CMemberViewModel()
		{
			_member = new TMember();
		}
		public int MId
		{
			get { return _member.MId; }
			set { _member.MId = value; }
		}
		public string M手機
		{
			get { return _member.M手機; }
			set { _member.M手機 = value; }
		}
		public string M密碼
		{
			get { return _member.M密碼; }
			set { _member.M密碼 = value; }
		}
		public string M姓名
		{
			get { return _member.M姓名; }
			set { _member.M姓名 = value; }
		}
		public bool? M性別
		{
			get { return _member.M性別; }
			set { _member.M性別 = value; }
		}
		public string? MEmail
		{
			get { return _member.MEmail; }
			set { _member.MEmail = value; }
		}
		public string? M照片
		{
			get { return _member.M照片; }
			set { _member.M照片 = value; }
		}
		public string? M住址
		{
			get { return _member.M住址; }
			set { _member.M住址 = value; }
		}
		public DateTime M加入時間
		{
			get { return _member.M加入時間; }
			set { _member.M加入時間 = value; }
		}
		public DateTime? M修改時間
		{
			get { return _member.M修改時間; }
			set { _member.M修改時間 = value; }
		}
		public DateTime? M最後登入時間
		{
			get { return _member.M最後登入時間; }
			set { _member.M最後登入時間 = value; }
		}
		public string? M備註
		{
			get { return _member.M備註; }
			set { _member.M備註 = value; }
		}
		public bool? M刪除會員
		{
			get { return _member.M刪除會員; }
			set { _member.M刪除會員 = value; }
		}
		public string? M權限
		{
			get { return _member.M權限; }
			set { _member.M權限 = value; }
		}
		public IFormFile photo { get; set; }  //客戶端提交的檔案
	}
}
