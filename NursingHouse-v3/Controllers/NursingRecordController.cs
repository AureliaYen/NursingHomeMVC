using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
	public class NursingRecordController : SuperController
	{
		public fpdb2Context db = new fpdb2Context(); //共用

		public ActionResult List(CKeywordViewModel vm)
		{

			IEnumerable<TNursingRecord> datas = null;
			//Include抓主鍵的資料表
			if (string.IsNullOrEmpty(vm.txtKeyword))
			{
				datas = db.TNursingRecords.Include(t => t.OIdNavigation).ThenInclude(s => s.PIdNavigation).Include(a => a.EIdNavigation);
			}
			else
			{
				datas = db.TNursingRecords.Include(t => t.OIdNavigation).ThenInclude(s => s.PIdNavigation).Include(a => a.EIdNavigation).Where(t => t.OIdNavigation.PIdNavigation.P姓名.Contains(vm.txtKeyword) ||
				t.OIdNavigation.PIdNavigation.P身分證字號.Contains(vm.txtKeyword) ||
				t.OIdNavigation.PIdNavigation.P出生日期.Contains(vm.txtKeyword) ||
				t.OIdNavigation.PIdNavigation.P聯絡電話.Contains(vm.txtKeyword));
			}

			return View(datas);
		}

		public IActionResult NursingRecordCreate()
		{
			CNursingRecordViewModel vm = new CNursingRecordViewModel();

			IEnumerable<TPatientInfo> tp = db.TPatientInfos;
			IEnumerable<TEmployee> e = db.TEmployees;
			IEnumerable<TOffService> os = db.TOffServices;

			vm.住民表單 = tp;
			vm.就醫交班表 = os;
			vm.員工表單 = e;


			return View(vm);
		}
		[HttpPost]
		public IActionResult NursingRecordCreate(InputViewModel.CNursingRecordInput a)
		{

			// TOffService p
			//COffServiceViewModel a
			TOffService z = db.TOffServices.FirstOrDefault(s => s.PId == a.PID);

			TNursingRecord p = new TNursingRecord();
			//if (!ModelState.IsValid)
			//{
			//    return View(p);
			//}

			p.EId = a.EId;
			p.OId = z.OId;
			p.N舒張壓 = a.N舒張壓;
			p.N收縮壓 = a.N收縮壓;
			p.N體溫 = a.N體溫;
			p.N呼吸 = a.N呼吸;
			p.N傷口 = a.N傷口;
			p.N三管 = a.N三管;
			p.N其他 = a.N其他;


			//p.O指示與用藥 = a.O指示與用藥;
			//p.O醫師診斷 = a.O醫師診斷;

			p.N紀錄時間 = DateTime.Now.ToString("yyyy/mm/HH:ss");
			p.N修改時間 = DateTime.Now.ToString("yyyy/mm/HH:ss");
			db.TNursingRecords.Add(p);
			db.SaveChanges();
			return RedirectToAction("List");
		}
		public IActionResult NursingRecordEdit(int? id)
		{
			TNursingRecord x = db.TNursingRecords.Include(t => t.OIdNavigation).ThenInclude(s => s.PIdNavigation).Include(a => a.EIdNavigation).FirstOrDefault(t => t.NId == id);
			//ThenInclude(s => s.PIdNavigation)
			IEnumerable<TPatientInfo> tp = db.TPatientInfos;
			IEnumerable<TOffService> tos = db.TOffServices;
			IEnumerable<TEmployee> e = db.TEmployees;


			if (id != null)
			{
				if (x != null)
				{
					CNursingRecordViewModel vm = new CNursingRecordViewModel();
					vm.住民表單 = tp;
					vm.就醫交班表 = tos;
					vm.NursingRecord = x;
					vm.員工表單 = e;
					return View(vm);
				}
			}
			return RedirectToAction("List");
		}
		[HttpPost]
		//存入資料庫
		public IActionResult NursingRecordEdit(InputViewModel.CNursingRecordInput2 a)
		{
			TNursingRecord x = db.TNursingRecords.FirstOrDefault(t => t.NId == a.NId);
			if (x != null)
			{

				x.EId = a.EId;
				// x.OId = a.OId;
				x.N舒張壓 = a.N舒張壓;
				x.N收縮壓 = a.N收縮壓;
				x.N脈搏 = a.N脈搏;
				x.N體溫 = a.N體溫;
				x.N呼吸 = a.N呼吸;
				x.N傷口 = a.N傷口;
				x.N三管 = a.N三管;
				x.N其他 = a.N其他; ;
				x.N修改時間 = DateTime.Now.ToString("yyyy/mm/HH:ss");

				db.SaveChangesAsync();
			}
			return RedirectToAction("List");
		}
		public ActionResult Details(int? id)
		{
			TNursingRecord x = db.TNursingRecords.Include(t => t.OIdNavigation).ThenInclude(s => s.PIdNavigation).Include(a => a.EIdNavigation).FirstOrDefault(t => t.NId == id);

			//TNursingRecord v = from t in db.TNursingRecords where t.NId == id select t=new t;

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


				TNursingRecord delNursingRecord = db.TNursingRecords.FirstOrDefault(t => t.NId == id);
				//找出要刪除的欄位

				if (delNursingRecord != null)
				{
					db.TNursingRecords.Remove(delNursingRecord);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("List");
		}

	}
}
