using NursingHouse_v3.Models;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace NursingHouse_v3.ViewModel
{
	public class CBedViewModel
	{
		private TBed _bed;
		public TBed Bed
		{
			get { return _bed; }
			set { _bed = value; }
		}

		public CBedViewModel()
		{
			_bed = new TBed();
		}
		[Display(Name = "序號")]
		public int BId
		{
			get { return _bed.BId; }
			set { _bed.BId = value; }
		}
		[Display(Name = "住民序號")]
		public int? PId
		{
			get { return _bed.PId; }
			set { _bed.PId = value; }
		}
		//public string? P編號
		//{
		//    get { return _bed.PIdNavigation.P編號; }
		//    set { _bed.PIdNavigation.P編號 = value; }
		//}
		//public string? P姓名
		//{
		//    get { return _bed.PIdNavigation.P姓名; }
		//    set { _bed.PIdNavigation.P姓名 = value; }
		//}
		[Display(Name = "床位序號")]
		public int? RbId
		{
			get { return _bed.RbId; }
			set { _bed.RbId = value; }
		}
		[DisplayName("入住日期")]
		[DataType(DataType.Date)]
		public DateTime? B入住時間
		{
			get { return _bed.B入住時間; }
			set { _bed.B入住時間 = value; }
		}
		[DisplayName("預計退房日期")]
		[DataType(DataType.Date)]
		public DateTime? B預計退房時間
		{
			get { return _bed.B預計退房時間; }
			set { _bed.B預計退房時間 = value; }
		}
		[DisplayName("建立日期")]
		[DataType(DataType.Date)]
		public DateTime? B建立日期
		{
			get { return _bed.B建立日期; }
			set { _bed.B建立日期 = value; }
		}
		[DisplayName("建立者工號")]
		public string? B建立者工號
		{
			get { return _bed.B建立者工號; }
			set { _bed.B建立者工號 = value; }
		}
		[DisplayName("修改日期")]
		[DataType(DataType.Date)]
		public DateTime? B修改日期
		{
			get { return _bed.B修改日期; }
			set { _bed.B修改日期 = value; }
		}
		[DisplayName("修改者工號")]
		public string? B修改者工號
		{
			get { return _bed.B修改者工號; }
			set { _bed.B修改者工號 = value; }
		}

		public IEnumerable<TPatientInfo>? 住民表單 { get; set; }
		public IEnumerable<TRoombed>? 床位分配表單 { get; set; }
		public virtual TPatientInfo? PIdNavigation { get; set; }
		public virtual TRoombed? RbIdNavigation { get; set; }
	}
}
