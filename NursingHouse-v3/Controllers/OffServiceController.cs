using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;
using System.Reflection;

namespace NursingHouse_v3.Controllers
{
	public class OffServiceController : SuperController
	{
		public fpdb2Context db = new fpdb2Context(); //共用

		public ActionResult List(CKeywordViewModel vm)
		{

			IEnumerable<TOffService> datas = null;
			//Include抓主鍵的資料表
			if (string.IsNullOrEmpty(vm.txtKeyword))
			{
				datas = db.TOffServices.Include(t => t.PIdNavigation).Include(a => a.EIdNavigation);
			}
			//datas = from t in db.TOffServices
			//        select t;
			else
			{
				datas = db.TOffServices.Include(t => t.PIdNavigation).Where(t => t.PIdNavigation.P姓名.Contains(vm.txtKeyword) ||
				t.PIdNavigation.P身分證字號.Contains(vm.txtKeyword) ||
				t.PIdNavigation.P出生日期.Contains(vm.txtKeyword) ||
				t.PIdNavigation.P聯絡電話.Contains(vm.txtKeyword));
			}


			//datas = db.TOffServices.Where(t => t.PIdNavigation.P姓名.Contains(vm.txtKeyword) ||
			//    t.PIdNavigation.P身分證字號.Contains(vm.txtKeyword) ||
			//    t.PIdNavigation.P出生日期.Contains(vm.txtKeyword) ||
			//    t.PIdNavigation.P聯絡電話.Contains(vm.txtKeyword));


			return View(datas);

		}
		public IActionResult COffServiceCreate()
		{
			COffServiceViewModel vm = new COffServiceViewModel();

			IEnumerable<TPatientInfo> tp = db.TPatientInfos;
			IEnumerable<TEmployee> e = db.TEmployees;

			vm.住民表單 = tp;
			vm.員工表單 = e;


			return View(vm);
		}
		[HttpPost]
		public IActionResult COffServiceCreate(InputViewModel.COffServiceInput a)
		{

			// TOffService p
			//COffServiceViewModel a
			TOffService p = new TOffService();
			if (!ModelState.IsValid)
			{
				return View(p);
			}

			p.EId = a.EID;
			p.PId = a.PID;
			p.O就診日期 = a.O就診日期;
			p.O回診日期 = a.O回診日期;
			p.O指示與用藥 = a.O指示與用藥;
			p.O醫師診斷 = a.O醫師診斷;

			p.O建立 = DateTime.Now;
			p.O更新 = DateTime.Now;
			db.TOffServices.Add(p);
			db.SaveChanges();
			return RedirectToAction("List");
		}
		public IActionResult OffServiceEdit(int? id)
		{
			TOffService x = db.TOffServices.Include(t => t.PIdNavigation).Include(a => a.EIdNavigation).FirstOrDefault(t => t.OId == id);
			IEnumerable<TPatientInfo> tp = db.TPatientInfos;
			IEnumerable<TEmployee> e = db.TEmployees;


			if (id != null)
			{
				if (x != null)
				{
					COffServiceViewModel vm = new COffServiceViewModel();
					vm.住民表單 = tp;
					vm.OffService = x;
					vm.員工表單 = e;
					return View(vm);
				}
			}
			return RedirectToAction("List");
		}
		[HttpPost]
		//存入資料庫
		public IActionResult OffServiceEdit(InputViewModel.COffServiceInput p)
		{
			TOffService x = db.TOffServices.FirstOrDefault(t => t.OId == p.OID);
			if (x != null)
			{

				x.EId = p.EID;
				x.PId = p.PID;
				x.O就診日期 = p.O就診日期;
				x.O回診日期 = p.O回診日期;
				x.O指示與用藥 = p.O指示與用藥;
				x.O醫師診斷 = p.O醫師診斷;
				x.O更新 = DateTime.Now;

				db.SaveChangesAsync();
			}
			return RedirectToAction("List");
		}


		public ActionResult Details(int? id)
		{
			TOffService x = db.TOffServices.Include(t => t.PIdNavigation).Include(a => a.EIdNavigation).FirstOrDefault(t => t.OId == id);

			if (id != null)
			{

				if (x != null)
					return View(x);
			}
			return RedirectToAction("List");
		}

		public ActionResult Delete(int? id)
		{
			if (id != null)
			{


				TOffService delOffService = db.TOffServices.FirstOrDefault(t => t.OId == id);
				//找出要刪除的欄位

				if (delOffService != null)
				{
					db.TOffServices.Remove(delOffService);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("List");
		}
	}

}
