using Microsoft.AspNetCore.Mvc;

namespace NursingHouse_v3.Controllers
{
    public class FrontendController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
