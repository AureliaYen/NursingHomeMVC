using Microsoft.AspNetCore.Mvc;
using preNursingHouse.Models;
using preNursingHouse.ViewModel;
using Microsoft.EntityFrameworkCore;
using System;
using System.Data;
using NuGet.Configuration;
using System.Text.Json;


namespace preNursingHouse.Controllers
{
	public class pNHMealController : Controller
	{
		//public fpdb2Context db = new fpdb2Context(); //有注入不要再new會錯

		private readonly fpdb2Context _context;
		IWebHostEnvironment _environment;

		public pNHMealController(fpdb2Context context, IWebHostEnvironment p)
		{
			_environment = p;
			_context = context;
		}

		public IActionResult MenuMonth()
		{
			return View();
		}

		public IActionResult List(CKeywordViewModel vm)
		{
			if (HttpContext.Session.Keys.Contains(CDictionary.SK_LOGINED_PUSER))
			{
				return RedirectToAction("MealList", "pNHMeal");
			}
			IEnumerable<TMeal> datas = null;
			if (string.IsNullOrEmpty(vm.txtKeyword))

				//datas = from t in _context.TMeals
				//        select t;
				datas = _context.TMeal.Include(s => s.SuIdNavigation).Include(t => t.TImages).Include(u => u.TOrderMeal);

			else
				datas = _context.TMeal.Where(t => t.月.Contains(vm.txtKeyword) ||
				t.餐種.Contains(vm.txtKeyword));


			return View(datas);
		}

		public IActionResult MealList(CKeywordViewModel vm)
		{
			IEnumerable<TMeal> datas = null;
			if (string.IsNullOrEmpty(vm.txtKeyword))

				//datas = from t in _context.TMeals
				//        select t;
				datas = _context.TMeal.Include(s => s.SuIdNavigation).Include(t => t.TImages).Include(u => u.TOrderMeal);

			else
				datas = _context.TMeal.Where(t => t.月.Contains(vm.txtKeyword) ||
				t.餐種.Contains(vm.txtKeyword));


			return View(datas);
		}

		public IActionResult AddMeal(int? id)
		{

			TMeal x = _context.TMeal.Include(m => m.TImages).FirstOrDefault(t => t.MeId == id);

			if (id != null)
			{
				if (x != null)
					return View(x);
			}
			//return View(CartView);
			return RedirectToAction("MealList");
		}
		[HttpPost]
		public IActionResult AddMeal(TMeal m)
		{
			return RedirectToAction("AddToCart", new { id = m.MeId });
		}

		public ActionResult AddToCart(int? id)
		{
			ViewBag.MeId = id;
			return View();
		}
		[HttpPost]
		public ActionResult AddToCart(CAddToCartViewModel vm)
		{

			TMeal p = _context.TMeal.FirstOrDefault(t => t.MeId == vm.txtMeId);
			if (p == null)
				return RedirectToAction("CartView");

			List<CShoppingCartItem> cart = null;
			string json = "";
			if (HttpContext.Session.Keys.Contains(CDictionary.SK_PURCHASED_MEAL_LIST))
			{
				json = HttpContext.Session.GetString(CDictionary.SK_PURCHASED_MEAL_LIST);
				cart = JsonSerializer.Deserialize<List<CShoppingCartItem>>(json);

			}
			else
				cart = new List<CShoppingCartItem>();

			CShoppingCartItem item = new CShoppingCartItem();
			//item.price = p.價位;
			if (decimal.TryParse(p.價位, out decimal price))
			{
				item.price = price;
			}
			else
			{
				// 轉換失敗的處理方式
			}
			//item.訂餐起始日 = vm.txt訂餐起始日;
			//item.訂餐結束日 = vm.txt訂餐結束日;
			item.購買人 = CpNHMLock.LoginUserName;
			item.電話 = CpNHMLock.LoginMphone;
			item.訂餐起始日 = DateTime.Parse(Request.Form["txt訂餐起始日"]);
			item.訂餐結束日 = DateTime.Parse(Request.Form["txt訂餐結束日"]);
			item.meId = vm.txtMeId;
			item.count = vm.txtCount;
			item.meal = p;

			cart.Add(item);
			json = JsonSerializer.Serialize(cart);
			HttpContext.Session.SetString(CDictionary.SK_PURCHASED_MEAL_LIST, json);
			TOrderMeal orderMeal = new TOrderMeal();
			orderMeal.MeId = vm.txtMeId;
			orderMeal.訂購人 = CpNHMLock.LoginUserName;
			orderMeal.訂購人電話 = CpNHMLock.LoginMphone;
			orderMeal.訂餐起始日 = DateTime.Parse(Request.Form["txt訂餐起始日"]);
			orderMeal.訂餐結束日 = DateTime.Parse(Request.Form["txt訂餐結束日"]);
			TimeSpan days = orderMeal.訂餐結束日.Value - orderMeal.訂餐起始日.Value;
			int dayCount = days.Days;
			orderMeal.總價 = (dayCount * price).ToString(); ;
			orderMeal.建立時間 = DateTime.Now;
			orderMeal.結帳狀態 = "未結帳";
			// orderMeal.總價 = cart.Sum(item => item.price * item.count).ToString();

			//if(item.訂餐起始日 != null && item.訂餐結束日 != null)
			//{
			// 將TOrderMeal物件存入資料庫中
			_context.TOrderMeal.Add(orderMeal);
			_context.SaveChanges();
			//RedirectToAction("OMLogout", "pNHMeal");
			return RedirectToAction("CartView");
			//}
			//else
			//{
			//    ViewBag.LoginErr = "請輸入正確訂餐起始日與結帳日";
			//    return View("AddToCart", vm);
			//}



		}

		//[HttpPost]
		//public IActionResult RemoveFromCart(int itemId)
		//{
		//    // Get the cart from session
		//    string json = HttpContext.Session.GetString(CDictionary.SK_PURCHASED_MEAL_LIST);
		//    List<CShoppingCartItem> cart = JsonSerializer.Deserialize<List<CShoppingCartItem>>(json);

		//    // Find the item with the specified ID and remove it from the cart
		//    CShoppingCartItem itemToRemove = cart.FirstOrDefault(item => item.meId == itemId);
		//    if (itemToRemove != null)
		//    {
		//        cart.Remove(itemToRemove);

		//        // Save the updated cart back to session
		//        json = JsonSerializer.Serialize(cart);
		//        HttpContext.Session.SetString(CDictionary.SK_PURCHASED_MEAL_LIST, json);
		//    }

		//    return RedirectToAction("List");
		//}
		public IActionResult CartView()
		{
			if (!HttpContext.Session.Keys.Contains(CDictionary.SK_PURCHASED_MEAL_LIST))
				return RedirectToAction("List");
			//return View();

			string json = HttpContext.Session.GetString(CDictionary.SK_PURCHASED_MEAL_LIST);
			List<CShoppingCartItem> cart = JsonSerializer.Deserialize<List<CShoppingCartItem>>(json);
			if (cart == null)
				return RedirectToAction("List");
			//return View();

			return View(cart);
		}


	}
}
