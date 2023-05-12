using NursingHouse_v3.Models;

namespace NursingHouse_v3.ViewModel
{
	public class ClmagesViewModel
	{
		private TImage _image;
		public TImage Image
		{
			get { return _image; }
			set { _image = value; }
		}
		public ClmagesViewModel()
		{
			_image = new TImage();
		}
		public int MaId
		{
			get { return _image.MaId; }
			set { _image.MaId = value; }
		}
		public int? MeId
		{
			get { return _image.MeId; }
			set { _image.MeId = value; }
		}
		public string? 月圖
		{
			get { return _image.月圖; }
			set { _image.月圖 = value; }
		}
		public string? 早圖
		{
			get { return _image.早圖; }
			set { _image.早圖 = value; }
		}
		public string? 午圖
		{
			get { return _image.午圖; }
			set { _image.午圖 = value; }
		}
		public string? 晚圖
		{
			get { return _image.晚圖; }
			set { _image.晚圖 = value; }
		}
		public string? 圖一
		{
			get { return _image.圖一; }
			set { _image.圖一 = value; }
		}
		public string? 圖二
		{
			get { return _image.圖二; }
			set { _image.圖二 = value; }
		}
		public string? 圖三
		{
			get { return _image.圖三; }
			set { _image.圖三 = value; }
		}
		public IFormFile photo { get; set; } //要上傳照片，要用IFormFile屬性。
		public IFormFile photo2 { get; set; }
		public IFormFile photo3 { get; set; }
		public IFormFile photo4 { get; set; }
		public IFormFile photo5 { get; set; }
		public IFormFile photo6 { get; set; }
		public IFormFile photo7 { get; set; }
		public IEnumerable<TMeal>? 餐點表單 { get; set; }

	}
}
