using Microsoft.AspNetCore.Mvc;

namespace preNursingHouse.Controllers
{
	public class FrontendController : Controller
	{
		public IActionResult ShowAllData()
		{
			return View();
		}
	}
}
