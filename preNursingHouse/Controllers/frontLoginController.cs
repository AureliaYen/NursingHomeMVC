using Microsoft.AspNetCore.Mvc;

namespace preNursingHouse.Controllers
{
	public class frontLoginController : Controller
	{
		public IActionResult FrontLoginForPatient()
		{
			return View();
		}
	}
}
