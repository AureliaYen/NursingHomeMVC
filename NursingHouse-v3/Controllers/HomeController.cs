using Microsoft.AspNetCore.Mvc;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Text.Json;
using NuGet.Protocol.Plugins;

namespace NursingHouse_v3.Controllers
{
	public class HomeController : Controller
	{
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public IActionResult Index()
		{
			if (!HttpContext.Session.Keys.Contains(CDictionary.SK_LOGINED_USER))
			{
				return RedirectToAction("Login");
			}
			return View();
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

		public IActionResult Login()
		{
			if (CLock.Login)
			{
				return RedirectToAction("Index");
			}
			return View();
		}

		[HttpPost]
		public IActionResult Login(CLoginViewModel vm)
		{
			TEmployee user = (new fpdb2Context()).TEmployees.FirstOrDefault(
				t => t.E員工編號.Equals(vm.txtAccount) && t.E密碼.Equals(vm.txtPassword));

			if (user != null && user.E密碼.Equals(vm.txtPassword))
			{
				string json = JsonSerializer.Serialize(user);
				HttpContext.Session.SetString(CDictionary.SK_LOGINED_USER, json);
				CLock.Login = true;
				CLock.LoginUserID = user.EId;
				CLock.LoginState = user.E員工編號;
				return RedirectToAction("Index");
			}
			else
			{
				ViewBag.LoginErr = "帳戶密碼錯誤";
				return View("Login");
			}
			return View();
		}

		public IActionResult Logout()
		{
			HttpContext.Session.Remove(CDictionary.SK_LOGINED_USER);
			CLock.Login = false;
			CLock.LoginUserID = 999;
			CLock.LoginState = "free";
			return RedirectToAction("Login");
		}
	}
}