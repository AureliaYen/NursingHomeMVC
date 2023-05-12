using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
	public class MealController : SuperController
	{
		public fpdb2Context db = new fpdb2Context();
		public IActionResult SupplierList(CKeywordViewModel vm)
		{
			IEnumerable<TSupplier> datas = null;
			if (string.IsNullOrEmpty(vm.txtKeyword))

				datas = from t in db.TSuppliers
						select t;
			else
				datas = db.TSuppliers.Where(t => t.廠商名稱.Contains(vm.txtKeyword) ||
				t.廠商地址.Contains(vm.txtKeyword) ||
				t.廠商電話.Contains(vm.txtKeyword) ||
				t.廠商聯絡人.Contains(vm.txtKeyword));
			return View(datas);
		}

		public IActionResult SupplierCreate()
		{
			return View();
		}

		[HttpPost]
		public IActionResult SupplierCreate(TSupplier p)
		{
			if (!ModelState.IsValid)
			{
				return View(p);
			}
			p.建立時間 = DateTime.Now;
			p.修改時間 = DateTime.Now;
			db.TSuppliers.Add(p);
			db.SaveChanges();
			return RedirectToAction("SupplierList");
		}

		public ActionResult SupplierEdit(int? id)
		{
			if (id != null)
			{

				TSupplier x = db.TSuppliers.FirstOrDefault(t => t.SuId == id);
				//FirstOrDefault 方法: 傳回序列的第一個項目；如果找不到任何項目，則傳回預設值。

				if (x != null)
					return View(x);


			}
			return RedirectToAction("SupplierList");
		}
		[HttpPost]
		//限制某個action只接受HttpPost的請求
		//存入資料庫
		public ActionResult SupplierEdit(TSupplier p)
		{

			TSupplier x = db.TSuppliers.FirstOrDefault(t => t.SuId == p.SuId);
			if (x != null)
			{

				x.廠商名稱 = p.廠商名稱;
				x.廠商地址 = p.廠商地址;
				x.廠商email = p.廠商email;
				x.廠商電話 = p.廠商電話;
				x.廠商聯絡人 = p.廠商聯絡人;
				x.聯絡人email = p.聯絡人email;
				x.建立時間 = DateTime.Now;
				x.修改時間 = DateTime.Now;
				x.建立人 = p.建立人;
				x.備註 = p.備註;

				db.SaveChangesAsync();



			}
			return RedirectToAction("SupplierList");

		}

		public ActionResult SupplierDelete(int? id)
		{
			if (id != null)
			{
				TSupplier delSupplier = db.TSuppliers.FirstOrDefault(t => t.SuId == id);
				//找出要刪除的欄位

				if (delSupplier != null)
				{
					db.TSuppliers.Remove(delSupplier);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("SupplierList");
		}
		//----------------------------------------------------------------------------------廠商細項       

		public IActionResult MealList()
		{
			IEnumerable<TMeal> datas = null;
			//if (string.IsNullOrEmpty(vm.txtKeyword))

			datas = from t in db.TMeals
					select t;
			//else
			//    datas = db.TMeal.Where(t => t.廠商名稱.Contains(vm.txtKeyword) ||
			//    t.廠商地址.Contains(vm.txtKeyword) ||
			//    t.廠商電話.Contains(vm.txtKeyword) ||
			//    t.廠商聯絡人.Contains(vm.txtKeyword));
			return View(datas);
		}

		public IActionResult MealCreate()
		{
			CMealViewModel vm = new CMealViewModel();
			IEnumerable<TSupplier> ts = db.TSuppliers;

			vm.廠商表單 = ts;
			return View(vm);
		}

		[HttpPost]
		public IActionResult MealCreate(CMealViewModel a)
		{
			TMeal p = new TMeal();
			if (!ModelState.IsValid)
			{
				return View(p);
			}
			p.SuId = a.SuId;
			p.月 = a.月;
			p.餐種 = a.餐種;
			p.餐別 = a.餐別;
			p.價位 = a.價位;
			p.建立時間 = DateTime.Now;
			p.修改時間 = DateTime.Now;
			p.建立人 = a.建立人;
			p.備註 = a.備註;
			db.TMeals.Add(p);
			db.SaveChanges();
			return RedirectToAction("MealList");
		}
		public ActionResult MealEdit(int? id)
		{
			TMeal x = db.TMeals.Include(t => t.SuIdNavigation).FirstOrDefault(t => t.MeId == id);
			IEnumerable<TSupplier> ts = db.TSuppliers;
			if (id != null)
			{
				if (x != null)
				{
					CMealViewModel vm = new CMealViewModel();
					vm.廠商表單 = ts;
					vm.Meal = x;
					return View(vm);
				}
			}
			return RedirectToAction("MealList");
		}
		[HttpPost]
		//限制某個action只接受HttpPost的請求
		//存入資料庫
		public ActionResult MealEdit(CMealViewModel p)
		{

			TMeal x = db.TMeals.FirstOrDefault(t => t.MeId == p.MeId);
			if (x != null)
			{

				x.月 = p.月;
				x.餐種 = p.餐種;
				x.餐別 = p.餐別;
				x.價位 = p.價位;
				x.建立時間 = DateTime.Now;
				x.修改時間 = DateTime.Now;
				x.建立人 = p.建立人;
				x.備註 = p.備註;

				db.SaveChangesAsync();



			}
			return RedirectToAction("MealList");

		}
		public ActionResult MealDelete(int? id)
		{
			if (id != null)
			{


				TMeal delMeal = db.TMeals.FirstOrDefault(t => t.MeId == id);
				//找出要刪除的欄位

				if (delMeal != null)
				{
					db.TMeals.Remove(delMeal);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("MealList");
		}
		//----------------------------------------------------------------------------------餐點細項  
		IWebHostEnvironment _environment;     //1.把IWebHostEnvironment此物件建成一個全域變數   
		public MealController(IWebHostEnvironment environment)     //2.不能new所以使用注入(Dependency Injectiom)的方式寫一個建構子，把要被注入的物件變成參數 
		{
			_environment = environment;    //3.把參數記錄到全域變數上
		}
		public IActionResult ImagesList()
		{
			IEnumerable<TImage> datas = null;


			datas = from t in db.TImages.Include(a => a.Me)
					select t;

			return View(datas);
		}
		public IActionResult ImageCreate()
		{
			ClmagesViewModel vm = new ClmagesViewModel();
			IEnumerable<TMeal> e = db.TMeals;
			vm.餐點表單 = e;
			return View(vm);
		}

		[HttpPost]
		public IActionResult ImageCreate(ClmagesViewModel a, IFormFile photo, IFormFile photo2, IFormFile photo3, IFormFile photo4, IFormFile photo5, IFormFile photo6, IFormFile photo7)
		{
			TImage p = new TImage();
			if (!ModelState.IsValid)
			{
				return View(p);
			}
			p.MeId = a.MeId;


			if (photo != null)
			{
				//先取檔名photoName
				//再取路徑path
				//存到資料庫 P照片
				//CopyTo，上傳檔案。
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;
				p.月圖 = photoName;

				photo.CopyTo(new FileStream(path, FileMode.Create));

			}
			if (photo2 != null)
			{
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;

				p.早圖 = photoName;
				photo2.CopyTo(new FileStream(path, FileMode.Create));

			}
			if (photo3 != null)
			{
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;

				p.午圖 = photoName;
				photo3.CopyTo(new FileStream(path, FileMode.Create));

			}
			if (photo4 != null)
			{
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;

				p.晚圖 = photoName;
				photo4.CopyTo(new FileStream(path, FileMode.Create));

			}
			if (photo5 != null)
			{
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;

				p.圖一 = photoName;
				photo5.CopyTo(new FileStream(path, FileMode.Create));

			}
			if (photo6 != null)
			{
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;

				p.圖二 = photoName;
				photo6.CopyTo(new FileStream(path, FileMode.Create));

			}
			if (photo7 != null)
			{
				string photoName = Guid.NewGuid().ToString() + ".jpg";
				string path = _environment.WebRootPath + "/images/MealImages/" + photoName;

				p.圖三 = photoName;
				photo7.CopyTo(new FileStream(path, FileMode.Create));

			}
			else
			{ p.月圖 = null; p.早圖 = null; p.午圖 = null; p.晚圖 = null; p.圖一 = null; p.圖二 = null; p.圖三 = null; }
			db.TImages.Add(p);
			db.SaveChanges();
			return RedirectToAction("ImagesList");
		}

		public ActionResult ImageEdit(int? id)
		{
			TImage x = db.TImages.Include(t => t.Me).FirstOrDefault(t => t.MaId == id);
			//FirstOrDefault 方法: 傳回序列的第一個項目；如果找不到任何項目，則傳回預設值。
			IEnumerable<TMeal>? tm = db.TMeals;
			if (id != null)
			{

				if (x != null)
				{
					ClmagesViewModel vm = new ClmagesViewModel();
					vm.餐點表單 = tm;
					vm.Image = x;
					return View(vm);

				}

			}
			return RedirectToAction("ImagesList");
		}

		[HttpPost]
		//限制某個action只接受HttpPost的請求
		//存入資料庫
		public ActionResult ImageEdit(ClmagesViewModel p)
		{

			TImage x = db.TImages.FirstOrDefault(t => t.MaId == p.MaId);
			x.MeId = p.MeId;

			if (x != null)
			{
				if (p.photo != null)
				{
					//先取檔名photoName
					//再取路徑path
					//存到資料庫 P照片
					//CopyTo，上傳檔案。
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;
					p.月圖 = photoName;

					p.photo.CopyTo(new FileStream(path, FileMode.Create));

				}
				if (p.photo2 != null)
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;

					p.早圖 = photoName;
					p.photo2.CopyTo(new FileStream(path, FileMode.Create));

				}
				if (p.photo3 != null)
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;

					p.午圖 = photoName;
					p.photo3.CopyTo(new FileStream(path, FileMode.Create));

				}
				if (p.photo4 != null)
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;

					p.晚圖 = photoName;
					p.photo4.CopyTo(new FileStream(path, FileMode.Create));

				}
				if (p.photo5 != null)
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;

					p.圖一 = photoName;
					p.photo5.CopyTo(new FileStream(path, FileMode.Create));

				}
				if (p.photo6 != null)
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;

					p.圖二 = photoName;
					p.photo6.CopyTo(new FileStream(path, FileMode.Create));

				}
				if (p.photo7 != null)
				{
					string photoName = Guid.NewGuid().ToString() + ".jpg";
					string path = _environment.WebRootPath + "/images/" + photoName;

					p.圖三 = photoName;
					p.photo7.CopyTo(new FileStream(path, FileMode.Create));

				}








				//存入資料庫

			}
			return RedirectToAction("ImagesList");

		}



		public ActionResult ImageDelete(int? id)
		{
			if (id != null)
			{


				TImage delImage = db.TImages.FirstOrDefault(t => t.MaId == id);
				//找出要刪除的欄位

				if (delImage != null)
				{
					db.TImages.Remove(delImage);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("ImagesList");
		}
		//----------------------------------------------------------------------------------餐點圖片

		public IActionResult OrderMealList()
		{
			IEnumerable<TOrderMeal> datas = null;
			//if (string.IsNullOrEmpty(vm.txtKeyword))

			datas = from t in db.TOrderMeals
					select t;
			//else
			//    datas = db.TMeal.Where(t => t.廠商名稱.Contains(vm.txtKeyword) ||
			//    t.廠商地址.Contains(vm.txtKeyword) ||
			//    t.廠商電話.Contains(vm.txtKeyword) ||
			//    t.廠商聯絡人.Contains(vm.txtKeyword));
			return View(datas);
		}

		public ActionResult OrderMealEdit(int? id)
		{

			if (id != null)
			{


				TOrderMeal x = db.TOrderMeals.FirstOrDefault(t => t.OmId == id);
				//FirstOrDefault 方法: 傳回序列的第一個項目；如果找不到任何項目，則傳回預設值。

				if (x != null)
					return View(x);


			}


			return RedirectToAction("OrderMealList");

		}
		[HttpPost]
		//限制某個action只接受HttpPost的請求
		//存入資料庫
		public ActionResult OrderMealEdit(TOrderMeal p)
		{

			TOrderMeal x = db.TOrderMeals.FirstOrDefault(t => t.OmId == p.OmId);

			if (x != null)
			{


				// x.MeId = p.MeId;
				x.訂購人 = p.訂購人;
				x.訂購人電話 = p.訂購人電話;
				x.訂餐起始日 = p.訂餐起始日;
				x.訂餐結束日 = p.訂餐結束日;
				x.總價 = p.總價;
				x.結帳狀態 = p.結帳狀態;
				x.修改人員 = p.修改人員;
				x.備註 = p.備註;
				x.修改時間 = DateTime.Now;

				//存入資料庫
				db.SaveChangesAsync();

			}
			return RedirectToAction("OrderMealList");

		}
		public ActionResult OrderMealDelete(int? id)
		{
			if (id != null)
			{
				TOrderMeal delOrderMeal = db.TOrderMeals.FirstOrDefault(t => t.OmId == id);
				//找出要刪除的欄位

				if (delOrderMeal != null)
				{
					db.TOrderMeals.Remove(delOrderMeal);
					db.SaveChangesAsync();
				}
			}
			return RedirectToAction("OrderMealList");
		}
	}
}
