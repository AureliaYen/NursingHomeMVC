using Microsoft.AspNetCore.Mvc;
using preNursingHouse.Models;
using preNursingHouse.ViewModel;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Text.Json;
using NuGet.Protocol.Plugins;


namespace preNursingHouse.Controllers
{
	public class pNHMLockController : Controller
	{
		private readonly fpdb2Context _context;
		private readonly ILogger<pNHMLockController> _logger;

		public pNHMLockController(fpdb2Context context, ILogger<pNHMLockController> logger)
		{
			_logger = logger;
			_context = context;
		}

		public IActionResult CheckIn()
		{
			if (!HttpContext.Session.Keys.Contains(CDictionary.SK_LOGINED_PUSER))
			{
				return RedirectToAction("OMLogin");
			}
			return RedirectToAction("MealList", "pNHMeal");
		}

		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}

		public IActionResult OMLogin()
		{
			if (CpNHMLock.Login)
			{
				return RedirectToAction("MealList", "pNHMeal");
			}
			return View();
		}

		[HttpPost]
		public IActionResult OMLogin(CpNHMLoginViewModel vm)
		{
			TPatientInfo user = _context.TPatientInfo.FirstOrDefault(
			//t => t.P姓名.Equals(vm.txtAccount) && t.P聯絡電話.Equals(vm.txtMphone) && t.P身分證字號.Equals(vm.txtIdnum));
			t => t.P姓名.Equals(vm.txtAccount) && t.P聯絡電話.Equals(vm.txtMphone));

			if (user != null && user.P聯絡電話.Equals(vm.txtMphone))
			{
				string json = JsonSerializer.Serialize(user);
				HttpContext.Session.SetString(CDictionary.SK_LOGINED_PUSER, json);
				CpNHMLock.Login = true;
				CpNHMLock.LoginUserID = user.PId;
				CpNHMLock.LoginUserName = user.P姓名;
				CpNHMLock.LoginMphone = user.P聯絡電話;

				return RedirectToAction("CheckIn");
			}
			else
			{
				ViewBag.LoginErr = "帳戶密碼錯誤";
				return View("OMLogin", vm);
			}
		}

		//public IActionResult OMLogout()
		//{
		//    HttpContext.Session.Remove(CDictionary.SK_LOGINED_PUSER);
		//    CpNHMLock.Login = false;
		//    CpNHMLock.LoginUserID = 999;
		//    CpNHMLock.LoginUserName = "zero";
		//    CpNHMLock.LoginMphone = "zero";


		//    return RedirectToAction("CartView", "pNHMeal");
		//}
	}
}
