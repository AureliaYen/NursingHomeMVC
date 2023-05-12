using Microsoft.AspNetCore.Mvc;

namespace NursingHouse_v3.Controllers
{
    public class ActivityController : Controller
    {
        public IActionResult CreateActivity()
        {
            return View();
        }
        public IActionResult EditActivity()
        {
            return View();
        }

        public IActionResult OrderListForEmployee()
        {
            return View();
        }

        public IActionResult ActivityItemList()
        {
            return View();
        }
    }
}
