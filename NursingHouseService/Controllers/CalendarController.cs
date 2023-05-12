using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NursingHouseService.Models;
using NursingHouseService.ViewModels;

namespace NursingHouseService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class CalendarController : ControllerBase
    {
        private readonly fpdb2Context _context;

        public CalendarController(fpdb2Context fpdb2)
        {
            _context = fpdb2;
        }

        [HttpGet]
        [Route("[action]")]
        public async Task<string> ShowAll()
        {
            List<CCalendarViewModel> cal = new List<CCalendarViewModel>();
            string date = "";
            int year = Convert.ToInt32(DateTime.Now.Year);
            int month = Convert.ToInt32(DateTime.Now.Month);
            int day = DateTime.DaysInMonth(year, month);
            CSqlFactory cs = new CSqlFactory(_context);
            string[] tempdata = new string[day];

            for (int i = 0; i < day; i++)
            {
                date = year + "/" + month + "/" + (i + 1);
                cal.Add(cs.searchCalendarAll(date));
                date = "";
            }

            return JsonConvert.SerializeObject(cal);
        }
    }

}
