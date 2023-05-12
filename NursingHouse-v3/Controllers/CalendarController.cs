using Microsoft.AspNetCore.Mvc;

namespace NursingHouse_v3.Controllers
{
    public class CalendarController : Controller
    {
        public IActionResult Calendar()
        {
            return View();
        }
    }
}
