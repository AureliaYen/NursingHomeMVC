using NursingHouse_v3.Models;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using Newtonsoft.Json.Linq;

namespace NursingHouse_v3.ViewModel
{
	public class CRoombedModelViewModel
	{
		private TRoombed _roombed;
		public TRoombed roombed
		{
			get { return _roombed; }
			set { _roombed = value; }
		}

		public CRoombedModelViewModel()
		{
			_roombed = new TRoombed();
		}

		public int RbId
		{
			get { return _roombed.RbId; }
			set { _roombed.RbId = value; }
		}

		public string? Rb房型
		{
			get { return _roombed.Rb房型; }
			set { _roombed.Rb房型 = value; }
		}
		public string? Rb床號
		{
			get { return _roombed.Rb床號; }
			set { _roombed.Rb床號 = value; }
		}
		public string? Rb空床
		{
			get { return _roombed.Rb空床; }
			set { _roombed.Rb空床 = value; }
		}
		public DateTime? Rb建立日期
		{
			get { return _roombed.Rb建立日期; }
			set { _roombed.Rb建立日期 = value; }
		}
		public string? Rb建立者工號
		{
			get { return _roombed.Rb建立者工號; }
			set { _roombed.Rb建立者工號 = value; }
		}
		public DateTime? Rb修改日期
		{
			get { return _roombed.Rb修改日期; }
			set { _roombed.Rb修改日期 = value; }
		}
		public string? Rb修改者工號
		{
			get { return _roombed.Rb修改者工號; }
			set { _roombed.Rb修改者工號 = value; }
		}


	}
}