using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
	public class RoombedController : SuperController
	{
		public IActionResult List(CKeywordViewModel vm)
		{
			IEnumerable<TRoombed> datas = null;
			fpdb2Context db = new fpdb2Context();
			if (string.IsNullOrEmpty(vm.txtKeyword))
				datas = from t in db.TRoombeds
						select t;
			else
				datas = db.TRoombeds.Where(t => t.Rb房型.Contains(vm.txtKeyword) ||
				t.Rb房型.Contains(vm.txtKeyword) ||
				t.Rb床號.Contains(vm.txtKeyword) ||
				t.Rb空床.Contains(vm.txtKeyword));
			return View(datas);
		}

		public IActionResult Delete(int? id)
		{
			if (id != null)
			{
				fpdb2Context db = new fpdb2Context();
				TRoombed delRoombed = db.TRoombeds.FirstOrDefault(t => t.RbId == id);
				if (delRoombed != null)
				{
					db.TRoombeds.Remove(delRoombed);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("List");
		}

		public IActionResult Create()
		{
			return View();
		}
		[HttpPost]
		public IActionResult Create(TRoombed p)
		{
			fpdb2Context db = new fpdb2Context();
			p.Rb空床 = "空床";
			p.Rb建立日期 = DateTime.Now;
			p.Rb建立者工號 = CLock.LoginState;
			db.TRoombeds.Add(p);
			db.SaveChanges();
			return RedirectToAction("List");
		}

		public IActionResult Edit(int? id)
		{
			if (id != null)
			{
				fpdb2Context db = new fpdb2Context();
				TRoombed x = db.TRoombeds.FirstOrDefault(t => t.RbId == id);
				if (x != null)
					return View(x);
			}
			return RedirectToAction("List");
		}
		[HttpPost]
		public IActionResult Edit(TRoombed p)
		{
			fpdb2Context db = new fpdb2Context();
			TRoombed x = db.TRoombeds.FirstOrDefault(t => t.RbId == p.RbId);
			if (x != null)
			{
				x.Rb房型 = p.Rb房型;
				x.Rb床號 = p.Rb床號;
				x.Rb空床 = p.Rb空床;
				//x.Rb建立日期 = p.Rb建立日期;
				//x.Rb建立者工號 = p.Rb建立者工號;
				x.Rb修改日期 = DateTime.Now;
				x.Rb修改者工號 = CLock.LoginState;
				db.SaveChangesAsync();
			}
			return RedirectToAction("List");
		}

		public ActionResult Details(int? id)
		{
			fpdb2Context db = new fpdb2Context();
			TRoombed x = db.TRoombeds.FirstOrDefault(t => t.RbId == id);

			if (id != null)
			{
				if (x != null)
					return View(x);
			}
			return RedirectToAction("List");
		}

	}
}
