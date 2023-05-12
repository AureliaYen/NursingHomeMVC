using Microsoft.AspNetCore.Mvc;

namespace preNursingHouse.Controllers
{
	public class ActivityController : Controller
	{
		public IActionResult ShowActivity()
		{
			return View();
		}

		public IActionResult CreateActivityOrder()
		{
			return View();
		}
		public IActionResult FillData()
		{
			return View();
		}

		public IActionResult EditFillData()
		{
			return View();
		}

		public IActionResult OrderListForClient()
		{
			return View();
		}

	}
}
