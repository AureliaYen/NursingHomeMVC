using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NursingHouseService.Models;
using NursingHouseService.ViewModels;

namespace NursingHouseService.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class frontLoginController : ControllerBase
	{
		private readonly fpdb2Context _context;

		public frontLoginController(fpdb2Context fpdb2)
		{
			_context = fpdb2;			
		}

		[HttpPost]
		[Route("[action]")]
		public string frontLoginCheck(CLoginForPatient lfp)
		{
			var data = _context.TPatientInfo.FirstOrDefault(p =>p.P姓名 == lfp.patientName && p.P聯絡電話 == lfp.patientPhone);
			if(data != null)
			{
				return "登入成功";
			}
			else
			{
				return "帳號或密碼錯誤";
			}			
		}
	}
}
