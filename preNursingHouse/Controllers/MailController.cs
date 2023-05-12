using Microsoft.AspNetCore.Mvc;

namespace preNursingHouse.Controllers
{
	public class MailController : Controller
	{
		public IActionResult SendEmail()
		{
			return View();
		}
	}
}
