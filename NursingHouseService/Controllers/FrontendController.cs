using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NursingHouseService.ViewModels;
using NursingHouseService.Models;

namespace NursingHouseService.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class FrontendController : ControllerBase
	{
		private readonly fpdb2Context _context;

		public FrontendController(fpdb2Context fpdb2)
		{
			_context = fpdb2;
		}

		[HttpPut]
		[Route("[action]")]
		public async Task<IEnumerable<tDataFrontend>> GetDataTest()
		{
			string patientName = "1";
			tDataFrontend data = new tDataFrontend();
			var source = from tP in _context.TPatientInfo
						 join tB in _context.TBed
						 on tP.PId equals tB.PId
						 join tE in _context.TEmployee
						 on tP.EId equals tE.EId
						 join tO in _context.TOffService
						 on tP.PId equals tO.PId
						 where tP.P姓名 == patientName
						 select new tDataFrontend
						 {
							 da住民姓名 = tP.P姓名,
							 da住民照片 = tP.P照片,
							 da住民年齡 = tP.P主訴,
							 da住民現在病史 = tP.現在病史,
							 da住民過去病史 = tP.過去病史,
							 da住民家族病史 = tP.過去病史,
                             da更新 = tP.P更新,
							 da住民入住時間 = tB.B入住時間,
							 da住民預計退房時間 = tB.B預計退房時間,
							 da住民床號 = (
								  from tRB in _context.TRoombed
								  where tRB.RbId == tB.RbId
								  select tRB.Rb床號
								 ).FirstOrDefault().ToString(),
							 da住民回診日期 = tO.O回診日期,
							 da住民醫師診斷 = tO.O醫師診斷,
							 da住民指示與用藥 = tO.O指示與用藥
						 };
			return source;
		}

		[HttpGet]
		[Route("[action]/{patientName}")]
		public IEnumerable<tDataFrontend> GetData(string patientName)
		{
			DateTime dt = DateTime.Now;
			int year = dt.Year;

			tDataFrontend data = new tDataFrontend();
			var source = from tP in _context.TPatientInfo
						 join tB in _context.TBed
						 on tP.PId equals tB.PId
						 join tE in _context.TEmployee
						 on tP.EId equals tE.EId
						 join tO in _context.TOffService
						 on tP.PId equals tO.PId
						 where tP.P姓名 == patientName
						 select new tDataFrontend
						 {
							 da住民姓名 = tP.P姓名,
							 da住民照片 = tP.P照片,
							 da住民年齡 = (year - Convert.ToInt32(tP.P出生日期.Substring(0, 4))).ToString(),
							 da住民主訴 = tP.P主訴,
							 da住民現在病史 = tP.現在病史,
							 da住民過去病史 = tP.過去病史,
							 da住民家族病史 = tP.家族病史,
                             da更新 = tP.P更新,
                             da住民入住時間 = tB.B入住時間,
							 da住民預計退房時間 = tB.B預計退房時間,
							 da住民床號 = (
								  from tRB in _context.TRoombed
								  where tRB.RbId == tB.RbId
								  select tRB.Rb床號
								 ).FirstOrDefault().ToString(),
							 da住民回診日期 = tO.O回診日期,
							 da住民醫師診斷 = tO.O醫師診斷,
							 da住民指示與用藥 = tO.O指示與用藥,
							 da負責員工姓名 = tE.E員工姓名
						 };
			return source;
		}

		[HttpGet]
		[Route("[action]/{patientName}")]
		public IEnumerable<RecordData> GetRecord(string patientName)
		{
			var dataPId = _context.TPatientInfo.FirstOrDefault(p =>p.P姓名 ==  patientName);

            List<int> saveOid = new List<int>();
            List<RecordData> recordDatas = new List<RecordData>();
            if (dataPId != null)
			{
                var dataOid = _context.TOffService.Where(p => p.PId == dataPId.PId);
                foreach (var itemData in dataOid)
                {
                    saveOid.Add(itemData.OId);
                }

                for (int i = 0; i < saveOid.Count; i++)
                {
                    var data = _context.TNursingRecord.Where(p => p.OId == saveOid[i]);
                    foreach (var item in data)
                    {
                        RecordData re = new RecordData();
                        re.N舒張壓 = item.N舒張壓;
                        re.N收縮壓 = item.N收縮壓;
                        re.N體溫 = item.N體溫;
                        re.N脈搏 = item.N脈搏;
                        re.N呼吸 = item.N呼吸;
                        re.N其他 = item.N其他;
                        re.N紀錄時間 = item.N紀錄時間;
                        recordDatas.Add(re);
                    }
                }
            }
			return recordDatas;
		}
	}


}
