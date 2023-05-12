using Microsoft.AspNetCore.Mvc;

namespace preNursingHouse.Controllers
{
    public class TestController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
