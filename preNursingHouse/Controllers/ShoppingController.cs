using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

using preNursingHouse.Models;
using preNursingHouse.ViewModel;
using System;
using System.Text.Json;

namespace preNursingHouse.Controllers
{
	public class ShoppingController : Controller
	{

		private readonly fpdb2Context _fpdb2Context;
		private readonly IWebHostEnvironment _env;
		private readonly ILogger<ShoppingController> _logger;

		public ShoppingController(fpdb2Context fpdb2Context, IWebHostEnvironment env, ILogger<ShoppingController> logger)
		{
			_fpdb2Context = fpdb2Context;
			_env = env;
			_logger = logger;
		}

		//public IActionResult Index()
		//{
		//    if (!HttpContext.Session.Keys.Contains(CDictionary.SK_LOINGED_PATIENT))
		//        return RedirectToAction("Login");
		//    return View();

		//}
		public IActionResult PatientLogin()
		{
			return View();
		}
		[HttpPost]
		public IActionResult PatientLogin(CPatientLoginViewModel vm)
		{
			TPatientInfo user = _fpdb2Context.TPatientInfo.FirstOrDefault(
				t => t.P姓名.Equals(vm.txtAccount) && t.P聯絡電話.Equals(vm.txtPassword));

			if (user != null && user.P聯絡電話.Equals(vm.txtPassword))
			{
				string json = JsonSerializer.Serialize(user);
				HttpContext.Session.SetString(CDictionary.SK_LOINGED_PATIENT, json);
				return RedirectToAction("List");
			}
			else
			{
				ModelState.AddModelError("txtPassword", "用户名或密码不正确！");
				return View();
			}
		}


		public async Task<IActionResult> List()
		{
			//if (!HttpContext.Session.Keys.Contains(CDictionary.SK_LOINGED_PATIENT))
			//    return RedirectToAction("Login");
			//从会话中获取当前登录的用户信息
			string json = HttpContext.Session.GetString(CDictionary.SK_LOINGED_PATIENT);
			TPatientInfo user = JsonSerializer.Deserialize<TPatientInfo>(json);

			// 在视图中显示用户信息
			ViewBag.Username = user.P姓名;

			//// 返回视图
			//return View();
			var datas = await _fpdb2Context.TMeal.Include(m => m.TImages).ToListAsync(); ;
			return View(datas);
		}
		public IActionResult Detail(int? id)
		{

			TMeal x = _fpdb2Context.TMeal.Include(m => m.TImages).FirstOrDefault(t => t.MeId == id);

			if (id != null)
			{


				if (x != null)
					return View(x);
			}
			//return View(CartView);
			return RedirectToAction("List");
		}

		public ActionResult AddToCart(int? id)
		{

			ViewBag.MeId = id;
			return View();
		}
		[HttpPost]
		public ActionResult AddToCart(CAddToCartViewModel vm)
		{

			TMeal p = _fpdb2Context.TMeal.FirstOrDefault(t => t.MeId == vm.txtMeId);
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
			item.購買人 = vm.txt購買人;
			item.電話 = vm.txt電話;
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
			orderMeal.訂購人 = vm.txt購買人;
			orderMeal.訂購人電話 = vm.txt電話;
			orderMeal.訂餐起始日 = DateTime.Parse(Request.Form["txt訂餐起始日"]);
			orderMeal.訂餐結束日 = DateTime.Parse(Request.Form["txt訂餐結束日"]);
			TimeSpan days = orderMeal.訂餐結束日.Value - orderMeal.訂餐起始日.Value;
			int dayCount = days.Days;
			orderMeal.總價 = (dayCount * price).ToString(); ;
			orderMeal.建立時間 = DateTime.Now;
			orderMeal.結帳狀態 = "已結帳";
			// orderMeal.總價 = cart.Sum(item => item.price * item.count).ToString();




			// 將TOrderMeal物件存入資料庫中
			_fpdb2Context.TOrderMeal.Add(orderMeal);
			_fpdb2Context.SaveChanges();
			return RedirectToAction("CartView");
		}

		[HttpPost]
		public IActionResult RemoveFromCart(int itemId)
		{
			// Get the cart from session
			string json = HttpContext.Session.GetString(CDictionary.SK_PURCHASED_MEAL_LIST);
			List<CShoppingCartItem> cart = JsonSerializer.Deserialize<List<CShoppingCartItem>>(json);

			// Find the item with the specified ID and remove it from the cart
			CShoppingCartItem itemToRemove = cart.FirstOrDefault(item => item.meId == itemId);
			if (itemToRemove != null)
			{
				cart.Remove(itemToRemove);

				// Save the updated cart back to session
				json = JsonSerializer.Serialize(cart);
				HttpContext.Session.SetString(CDictionary.SK_PURCHASED_MEAL_LIST, json);
			}

			return RedirectToAction("List");
		}
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
		//public IActionResult OrderMealList(CKeywordViewModel vm)
		//{
		//    IEnumerable<TOrderMeal> datas = null;
		//    if (string.IsNullOrEmpty(vm.txtKeyword))
		//       datas = from t in _fpdb2Context.TOrderMeal
		//            select t;
		//    else
		//        datas = _fpdb2Context.TOrderMeal.Where(t => t.訂購人.Contains(vm.txtKeyword) && t.訂購人電話.Contains(vm.txtKeyword));
		//    TOrderMeal orderMeal = new TOrderMeal();
		//    TimeSpan days = orderMeal.訂餐結束日.Value - orderMeal.訂餐起始日.Value;
		//    int dayCount = days.Days;                      
		//    ViewBag.DayCount = dayCount;


		//    return View(datas);
		//}

		//[HttpPost]
		//public IActionResult CartView(CShoppingCartItem p)
		//{
		//    if (!HttpContext.Session.Keys.Contains(CDictionary.SK_PURCHASED_MEAL_LIST))
		//    {
		//        return RedirectToAction("List");
		//    }

		//    string json = HttpContext.Session.GetString(CDictionary.SK_PURCHASED_MEAL_LIST);
		//    List<CShoppingCartItem> cart = JsonSerializer.Deserialize<List<CShoppingCartItem>>(json);

		//    if (cart == null)
		//    {
		//        return RedirectToAction("List");
		//    }

		//    // 建立新的 TOrderMeal 資料列
		//    TOrderMeal orderMeal = new TOrderMeal
		//    {
		//        訂購人 = cart[0].購買人, // 假設所有的購物車項目都是同一位訂購人
		//        訂購人電話 = cart[0].電話, // 假設所有的購物車項目都是同一位訂購人
		//        訂餐起始日 = cart[0].訂餐起始日, // 假設所有的購物車項目都是同一個訂餐起始日
		//        訂餐結束日 = cart[0].訂餐結束日, // 假設所有的購物車項目都是同一個訂餐結束日
		//        結帳狀態 = "已結帳", // 設定結帳狀態為已結帳
		//        建立時間 = DateTime.Now, // 設定建立時間為現在
		//        總價 = cart[0].總額,
		//    };

		//    // 計算總價
		//    //decimal total = 0;
		//    //foreach (var item in cart)
		//    //{
		//    //    total += item.count * item.price;
		//    //}
		//    //orderMeal.總價 = total.ToString();

		//    // 將新的 TOrderMeal 資料列存入資料庫
		//    _fpdb2Context.TOrderMeal.Add(orderMeal);
		//    _fpdb2Context.SaveChanges();

		//    // 將購物車項目存入 TOrderMealDetail 資料表
		//    foreach (var item in cart)
		//    {
		//        TOrderMeal orderMealDetail = new TOrderMeal
		//        {
		//            OmId = orderMeal.OmId,
		//            MeId = item.meId,

		//            建立時間 = DateTime.Now,
		//        };
		//        _fpdb2Context.TOrderMeal.Add(orderMealDetail);
		//    }
		//    _fpdb2Context.SaveChanges();

		//    // 清空購物車
		//    HttpContext.Session.Remove(CDictionary.SK_PURCHASED_MEAL_LIST);

		//    // 返回訂單列表
		//    return RedirectToAction("OrderList");
		//}
		//[HttpPost]
		//public IActionResult CartView(CShoppingCartItem p)
		//{
		//    if (!HttpContext.Session.Keys.Contains(CDictionary.SK_PURCHASED_MEAL_LIST))
		//    {
		//        return RedirectToAction("List");
		//    }

		//    string json = HttpContext.Session.GetString(CDictionary.SK_PURCHASED_MEAL_LIST);
		//    List<CShoppingCartItem> cart = JsonSerializer.Deserialize<List<CShoppingCartItem>>(json);

		//    if (cart == null)
		//    {
		//        return RedirectToAction("List");
		//    }

		//    // 建立新的 TOrderMeal 資料列
		//    TOrderMeal orderMeal = new TOrderMeal
		//    {
		//        訂購人 = cart[0].購買人, // 假設所有的購物車項目都是同一位訂購人
		//        訂購人電話 = cart[0].電話, // 假設所有的購物車項目都是同一位訂購人
		//        訂餐起始日 = cart[0].訂餐起始日, // 假設所有的購物車項目都是同一個訂餐起始日
		//        訂餐結束日 = cart[0].訂餐結束日, // 假設所有的購物車項目都是同一個訂餐結束日
		//        結帳狀態 = "已結帳", // 設定結帳狀態為已結帳
		//        建立時間 = DateTime.Now, // 設定建立時間為現在
		//        總價 = cart[0].總額,
		//    };



		//    // 將新的 TOrderMeal 資料列存入資料庫
		//    _fpdb2Context.TOrderMeal.Add(orderMeal);
		//    _fpdb2Context.SaveChanges();

		//    // 將購物車項目存入 TOrderMealDetail 資料表
		//    foreach (var item in cart)
		//    {
		//        TOrderMeal orderMealDetail = new TOrderMeal
		//        {
		//            OmId = orderMeal.OmId,
		//            MeId = item.meId,
		//            總價 = item.總額,
		//            訂餐起始日 = item.訂餐起始日,
		//            訂餐結束日 = item.訂餐結束日,
		//            訂購人 = item.購買人,
		//            訂購人電話 = item.電話,
		//            修改時間 = DateTime.Now,
		//            建立時間 = DateTime.Now,
		//        };
		//        _fpdb2Context.TOrderMeal.Add(orderMealDetail);
		//    }
		//    _fpdb2Context.SaveChanges();

		//    // 清空購物車
		//    HttpContext.Session.Remove(CDictionary.SK_PURCHASED_MEAL_LIST);

		//    // 返回訂單列表
		//    return RedirectToAction("OrderList");
		//}

	}
}


//        public IActionResult Create()
//        {
//            return View();
//        }
//        [HttpPost]
//        public IActionResult Create(TOrderMeal p)
//        {
//            //if (!ModelState.IsValid)
//            //{
//            //    return View(p);
//            //}
//            if (p.訂餐起始日.HasValue && p.訂餐結束日.HasValue)
//            {
//                TimeSpan diff = p.訂餐起始日.Value - p.訂餐結束日.Value;
//                int days = diff.Days;
//                decimal totalPrice = Decimal.Parse(p.總價) * days;
//                p.總價 = totalPrice.ToString();
//                // 使用 days 變數來處理計算結果
//            }
//            _fpdb2Context.TOrderMeal.Add(p);
//            _fpdb2Context.SaveChanges();
//            return RedirectToAction("List");
//        }
//    }
//}





