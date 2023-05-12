using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
	public class BedController : SuperController
	{
		public fpdb2Context db = new fpdb2Context(); //共用
		public IActionResult List(CKeywordViewModel vm)
		{
			IEnumerable<TBed> datas = null;
			//fpdb2Context db = new fpdb2Context();
			if (string.IsNullOrEmpty(vm.txtKeyword))
				//datas = from t in db.TBeds
				//        select t;
				datas = db.TBeds.Include(s => s.PIdNavigation).Include(t => t.RbIdNavigation);
			else
			{
				//datas = db.TBeds.Where(t => t.B入住時間.Equals(vm.txtKeyword) ||               
				//t.B預計退房時間.Equals(vm.txtKeyword));
				datas = db.TBeds.Include(s => s.PIdNavigation).Where(
					s => s.PIdNavigation.P編號.Contains(vm.txtKeyword) ||
						s.PIdNavigation.P姓名.Contains(vm.txtKeyword));
			}
			return View(datas);
		}

		public IActionResult Delete(int? id)
		{
			if (id != null)
			{
				//fpdb2Context db = new fpdb2Context();
				TBed delBed = db.TBeds.FirstOrDefault(t => t.BId == id);
				if (delBed != null)
				{
					db.TBeds.Remove(delBed);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("List");
		}

		public IActionResult Create()
		{
			//fpdb2Context db = new fpdb2Context();
			CBedViewModel vm = new CBedViewModel();
			IEnumerable<TBed> e = db.TBeds;
			IEnumerable<TPatientInfo> tp = db.TPatientInfos.Where(x => !db.TBeds.Any(t => t.PId == x.PId));
			IEnumerable<TRoombed> trb = db.TRoombeds.Where(x => !db.TBeds.Any(t => t.RbId == x.RbId));

			vm.住民表單 = tp;
			vm.床位分配表單 = trb;

			return View(vm);
		}
		[HttpPost]

		public IActionResult Create(CBedViewModel vm)
		{
			//    //fpdb2Context db = new fpdb2Context();
			//    // TOffService p
			//    //COffServiceViewModel a
			//   // TPatientInfo z = db.TPatientInfos.FirstOrDefault(s => s.PId == a.PID);

			TBed tp = new TBed();
			//    if (!ModelState.IsValid)
			//    {
			//        return View(p);
			//    }

			tp.PId = vm.PId;
			tp.RbId = vm.RbId;
			tp.B建立日期 = DateTime.Now;
			tp.B建立者工號 = CLock.LoginState;
			tp.B入住時間 = vm.B入住時間;
			tp.B預計退房時間 = vm.B預計退房時間;
			db.TBeds.Add(tp);
			db.SaveChanges();
			return RedirectToAction("List");
		}
		public IActionResult Edit(int? id)
		{
			//fpdb2Context db = new fpdb2Context();

			IEnumerable<TRoombed> trb = db.TRoombeds.Where(q => !db.TBeds.Any(t => t.RbId == q.RbId));
			TBed x = db.TBeds.FirstOrDefault(t => t.BId == id);

			if (id != null)
			{
				if (x != null)
				{
					CBedViewModel vm = new CBedViewModel();
					vm.床位分配表單 = trb;
					vm.Bed = x;
					return View(vm);
				}

			}
			return RedirectToAction("List");
		}

		[HttpPost]
		public IActionResult Edit(CBedViewModel vm)
		{
			fpdb2Context db = new fpdb2Context();
			TBed x = db.TBeds.FirstOrDefault(t => t.BId == vm.BId);
			if (x != null)
			{
				//x.PId = p.PId;
				x.RbId = vm.RbId;
				x.B入住時間 = vm.B入住時間;
				x.B預計退房時間 = vm.B預計退房時間;
				//x.B建立日期 = vm.B建立日期;
				//x.B建立者工號 = vm.B建立者工號;
				x.B修改日期 = DateTime.Now;
				x.B修改者工號 = CLock.LoginState;
				db.SaveChangesAsync();
			}
			return RedirectToAction("List");
		}

		public ActionResult Details(int? id)
		{
			fpdb2Context db = new fpdb2Context();
			TBed x = db.TBeds.Include(t => t.PIdNavigation).Include(a => a.RbIdNavigation).FirstOrDefault(t => t.BId == id);

			if (id != null)
			{
				if (x != null)
					return View(x);
			}
			return RedirectToAction("List");
		}

	}
}
