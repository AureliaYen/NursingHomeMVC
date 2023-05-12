using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
	public class EmployeeController : SuperController
	{
		//要抓路徑不能new它，把IWebHostEnvironment物件變成全域變數_evironment
		IWebHostEnvironment _evironment;
		//不能new只好用注入的方式寫一個建構子，把要被注入的物件變成參數，
		//把參數記錄到全域變數上。
		public EmployeeController(IWebHostEnvironment p)
		{
			_evironment = p;
		}

		public IActionResult List(CKeywordViewModel vm)
		{
			IEnumerable<TEmployee> datas = null;
			fpdb2Context db = new fpdb2Context();
			if (string.IsNullOrEmpty(vm.txtKeyword))
				datas = from t in db.TEmployees
						select t;
			else
				datas = db.TEmployees.Where(t => t.E員工姓名.Contains(vm.txtKeyword) ||
				t.E員工編號.Contains(vm.txtKeyword) ||
				t.E電話.Contains(vm.txtKeyword) ||
				t.EEmail.Contains(vm.txtKeyword) ||
				t.E職稱.Contains(vm.txtKeyword) ||
				t.E身分證號.Contains(vm.txtKeyword));
			return View(datas);
		}
		public IActionResult Create()
		{
			return View();
		}
		[HttpPost]
		public IActionResult Create(TEmployee p, IFormFile photo)
		{
			fpdb2Context db = new fpdb2Context();
			DateTime dt = DateTime.Now;
			Random myRand = new Random();
			string strdt = dt.ToString("yyMMddHHmm");
			p.E員工編號 = "E" + strdt + myRand.Next(10, 100).ToString();
			p.E建立日期 = DateTime.Now;
			p.E建立者工號 = CLock.LoginState;

			if (photo != null)
			{
				//先取檔名photoName
				//再取路徑path
				//存到資料庫 P照片
				//CopyTo，上傳檔案。
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _evironment.WebRootPath + "/images/" + photoName;
				p.EImagePath = photoName;
				photo.CopyTo(new FileStream(path, FileMode.Create));
				//動態取得資料夾的實體路徑。
			}
			else
			{ p.EImagePath = null; }

			db.TEmployees.Add(p);
			db.SaveChanges();
			return RedirectToAction("List");
		}
		//不是真的刪除 改為權限0
		//public IActionResult Delete(int? id)
		//{
		//    //輸入檢查  目前沒有
		//    if (id != null)
		//    {
		//        fpdb2Context db = new fpdb2Context();
		//        TEmployee hideEmployee = db.TEmployees.FirstOrDefault(t => t.EId == id);
		//        if (hideEmployee != null)
		//        {
		//            hideEmployee.E權限 = 0;
		//            db.SaveChangesAsync();
		//        }
		//    }
		//    return RedirectToAction("List");
		//}
		//測試用 真的刪除
		public IActionResult Delete(int? id)
		{
			if (id != null)
			{
				fpdb2Context db = new fpdb2Context();
				TEmployee delEmployee = db.TEmployees.FirstOrDefault(t => t.EId == id);
				if (delEmployee != null)
				{
					db.TEmployees.Remove(delEmployee);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("List");
		}
		public IActionResult Edit(int? id)
		{
			if (id != null)
			{
				fpdb2Context db = new fpdb2Context();
				TEmployee x = db.TEmployees.FirstOrDefault(t => t.EId == id);
				if (x != null)
					return View(x);
			}
			return RedirectToAction("List");
		}
		[HttpPost]
		public IActionResult Edit(CEmployeeViewModel p)
		{
			fpdb2Context db = new fpdb2Context();
			TEmployee x = db.TEmployees.FirstOrDefault(t => t.EId == p.EId);
			if (x != null)
			{
				if (p.photo != null) //VM有傳照片上來
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _evironment.WebRootPath + "/images/" + photoName;
					x.EImagePath = photoName;
					p.photo.CopyTo(new FileStream(path, FileMode.Create));
				}

				x.E員工編號 = p.E員工編號;
				x.E員工姓名 = p.E員工姓名;
				x.E電話 = p.E電話;
				x.EEmail = p.EEmail;
				x.E地址 = p.E地址;
				x.E密碼 = p.E密碼;
				x.E性別 = p.E性別;
				x.E身分證號 = p.E身分證號;
				x.E職稱 = p.E職稱;
				x.E到職日期 = p.E到職日期;
				x.E離職日期 = p.E離職日期;
				x.E權限 = p.E權限;
				//建立日期及建立者工號不能改
				x.E修改日期 = DateTime.Now;
				x.E修改者工號 = CLock.LoginState;
				x.E員工生日 = p.E員工生日;
				db.SaveChangesAsync();
			}
			return RedirectToAction("List");
		}

		public ActionResult Details(int? id)
		{
			fpdb2Context db = new fpdb2Context();
			TEmployee x = db.TEmployees.FirstOrDefault(t => t.EId == id);

			if (id != null)
			{
				if (x != null)
					return View(x);
			}
			return RedirectToAction("List");
		}

	}
}
