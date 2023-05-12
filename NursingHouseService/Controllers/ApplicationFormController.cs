using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using NursingHouseService.Models;
using NursingHouseService.ViewModels;

namespace NursingHouseService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class ApplicationFormController : ControllerBase
    {
        private readonly fpdb2Context _context;
        public ApplicationFormController(fpdb2Context fpdb2)
        {
            _context = fpdb2;
        }
     
        [HttpGet]
        [Route("[action]")]
        public async Task<IEnumerable<CAppListViewModel>> OutSide()
        {
            CDayTimeToDayViewModel day = new CDayTimeToDayViewModel();
            string tempday = day.Today();
            CSqlFactory sq = new CSqlFactory(_context);
            List<CAppListViewModel> temp = new List<CAppListViewModel>();
            temp = sq.searchGoOutForDay(tempday);
            return temp;
        }
      
        [HttpGet]
        [Route("[action]")]
        public async Task<IEnumerable<CStayViewModel>> InSide()
        {
            CDayTimeToDayViewModel day = new CDayTimeToDayViewModel();
            string tempday = day.Today();
            CSqlFactory sq = new CSqlFactory(_context);
            List<CStayViewModel> temp = new List<CStayViewModel>();

            DateTime dt = DateTime.Today;
            DateTime dn = DateTime.Now;
            var data = await _context.Procedures.checkPatientAsync(dt);
            foreach (var item in data)
            {
                CStayViewModel cStay = new CStayViewModel();
                cStay.pId = item.pId;
                cStay.p姓名 = item.p姓名;
                cStay.e員工姓名 = item.e員工姓名;
                cStay.b床號 = item.rb床號;
                temp.Add(cStay);
            }

            return temp;
        }

        [HttpGet]
        [Route("[action]/{patientName}")]
        public async Task<IEnumerable<CAppListViewModel>> OutSideForSearch(string patientName)
        {
            CDayTimeToDayViewModel day = new CDayTimeToDayViewModel();
            string tempday = day.Today();
            CSqlFactory sq = new CSqlFactory(_context);
            List<CAppListViewModel> temp = new List<CAppListViewModel>();
            temp = sq.searchGoOutForName(patientName, tempday);
            return temp;
        }

        [HttpGet]
        [Route("[action]/{patientName}")]
        public async Task<IEnumerable<CStayViewModel>> InSideForSearch(string patientName)
        {
            CDayTimeToDayViewModel day = new CDayTimeToDayViewModel();
            string tempday = day.Today();
            CSqlFactory sq = new CSqlFactory(_context);
            List<CStayViewModel> temp = new List<CStayViewModel>();
            temp = sq.searchInsideForName(patientName, tempday);
            return temp;
        }

        //完全沒用到??
        [HttpGet]
        [Route("[action]/{patientName}")]
        public async Task<IEnumerable<CStayViewModel>> List(string patientName)
        {
            CDayTimeToDayViewModel day = new CDayTimeToDayViewModel();
            string tempday = day.Today();
            CSqlFactory sql = new CSqlFactory(_context);

            List<CAppListViewModel> tempApplist = new List<CAppListViewModel>();
            tempApplist = sql.searchGoOutForName(patientName, tempday);

            List<CStayViewModel> tempStay = new List<CStayViewModel>();
            tempStay = sql.searchInsideForName(patientName, tempday);

            if (tempApplist.Count > 0)
            {
                //回傳一個記號過去畫面做觸發
            }
            else
            {

            }

            return null;
        }

        [HttpGet]
        [Route("[action]/{patientName}")]
        public async Task<string> CheckDay(string patientName)
        {
            var pId = _context.TPatientInfo.FirstOrDefault(p => p.P姓名 == patientName);
            if (pId == null)
            {
                return "查無此人";
            }
            var data = _context.TApplicationForm.FirstOrDefault(p => p.PId == pId.PId && p.App事由 == "回診");
            if (data != null)
            {
               
                var date = _context.TOffService.Where(p => p.PId == pId.PId).OrderByDescending(p => p.O回診日期).FirstOrDefault();
                if (date != null)
                {
                    return date.O回診日期;
                }
                else
                {
                    return "資料有誤";
                }
            }

            return "無就診紀錄";
        }

        [HttpPost]
        [Route("[action]")]
        public string CreateApplicationForm(tApplicationFormMoidify tA)
        {
            CItemCheck ch = new CItemCheck();
            bool check = ch.checkApplicationForm(tA);   
            TApplicationForm app = new TApplicationForm();
            DateTime dt = DateTime.Today;

            if (tA.app申請日期 > tA.app外出日期 && tA.app申請日期 <= dt)
            {
                return "輸入有誤";
            }

            var count = _context.TPatientInfo.FirstOrDefault(p => p.P姓名 == tA.p姓名);
            if (count == null)
            {
                return "查無此人";
            }

            if (check)
            {
              
                CSqlFactory sql = new CSqlFactory(_context);
                tA.paId = sql.searchPId(tA.p姓名);
                tA.emId = sql.searchEId(tA.p姓名);
                tA.famId = sql.searchFamId(tA.paId);
                app.PId = tA.paId;
                app.EId = tA.emId;
                app.OId = null;
                app.FamId = tA.famId;
                app.App申請人 = tA.app申請人;
                app.App陪同人員 = tA.app陪同人員;
                app.App聯絡方式 = tA.app聯絡方式;
                app.App申請日期 = tA.app申請日期;
                app.App外出日期 = tA.app外出日期;
                app.App事由 = tA.app事由;
                app.App地點 = tA.app地點;
                app.App出發時間 = null;
                app.App預計外出時間 = tA.app預計外出時間;
                app.App修改時間 = DateTime.Now;
                app.App修改人員 = null;
                app.App審核 = "0";
                app.App現況 = 0;
                app.App結案 = "0";
                app.App備註 = tA.app備註;
                _context.TApplicationForm.Add(app);
             
                _context.SaveChanges();
            }
            return "新增成功";
        }

        [HttpGet]
        [Route("[action]/{appId}")]
        public tApplicationFormMoidify GetApplicationForm(int appId)
        {
            int data = _context.TApplicationForm.FirstOrDefault(p => p.AppId == appId).PId;
            string pName = _context.TPatientInfo.FirstOrDefault(p => p.PId == data).P姓名;

            var appData = _context.TApplicationForm.Where(p => p.AppId == appId);

            tApplicationFormMoidify app = new tApplicationFormMoidify();
            foreach(var item in appData)
            {
                app.appId = item.AppId;
                app.paId = item.PId;
                app.emId = item.EId;
                app.oId = 0;
                app.famId = item.FamId;
                app.app申請人 = item.App申請人;
                app.p姓名 = pName;
                app.app陪同人員 = item.App陪同人員;
                app.app聯絡方式 = item.App聯絡方式;
                app.app申請日期 = item.App申請日期;
                app.app外出日期 = (DateTime)item.App外出日期;
                app.app事由 = item.App事由;
                app.app地點 = item.App地點;
                app.app預計外出時間 = item.App預計外出時間;
                app.app備註 = null;
            }

            return app;
        }


        [HttpGet]
        [Route("[action]/{pId}")]
        public int SearchApplicationForm(int pId)
        {
            DateTime dt = DateTime.Today;
            TApplicationForm data = new TApplicationForm();
            data = _context.TApplicationForm.FirstOrDefault(p => p.PId == pId && p.App外出日期 == dt);

            if (data != null)
            {
                return data.AppId;

            }
            else
            {
                return 0;
            }
        }

        [HttpGet]
        [Route("[action]/{pId}")]
        public int SearchEidInApplicationForm(int pId)
        {
            DateTime dt = DateTime.Today;
            TApplicationForm data = new TApplicationForm();
            data = _context.TApplicationForm.FirstOrDefault(p => p.PId == pId && p.App外出日期 == dt);

            if (data != null)
            {
                return data.EId;
            }
            else
            {
                return 0;
            }

        }

        [HttpPut]
        [Route("[action]")]
        public async Task<string> EditApplicationForm(tApplicationFormMoidify tA)
        {
            TApplicationForm? app = await _context.TApplicationForm.FindAsync(tA.appId);
            _context.Entry(app).State = EntityState.Modified;      
            app.App申請人 = tA.app申請人;
            app.App陪同人員 = tA.app陪同人員;
            app.App聯絡方式 = tA.app聯絡方式;
            app.App申請日期 = tA.app申請日期;
            app.App外出日期 = tA.app外出日期;
            app.App事由 = tA.app事由;
            app.App地點 = tA.app地點;
            app.App預計外出時間 = tA.app預計外出時間;
            app.App備註 = tA.app備註;
            app.App修改時間 = DateTime.Now;
            app.App修改人員 = tA.emId;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TApplicationFormExists(tA.appId))
                {
                    return "記錄錯誤";
                }
                else
                {
                    throw;
                }

            }
            return "修改成功";
        }

        [HttpPut]
        [Route("[action]")]
        public async Task<string> DeleteApplicationForm(DeleteUpdateViewModel de)
        {            
            var data = await _context.TApplicationForm.FindAsync(de.tableId);
            if (data == null && data.App結案 == "1")
            {
                return "修改失敗";
            }
            else
            {
                data.App結案 = "1";
                data.App修改時間 = DateTime.Now;
                data.App修改人員 = de.EId;
                await _context.SaveChangesAsync();
                return "修改成功";
            }
        }

        [HttpGet]
        [Route("[action]/{id}")]
        public async Task<IEnumerable<tApplicationFormViewModel>> ListCheck(int id)
        {
            List<tApplicationFormViewModel> tA = new List<tApplicationFormViewModel>();
            var data = from tAp in _context.TApplicationForm
                       join tP in _context.TPatientInfo
                       on tAp.PId equals tP.PId
                       where (tAp.App結案 == "0" && tP.EId == id)
                       select new
                       {
                           AppId = tAp.AppId,
                           emId = tAp.EId,
                           pId = tAp.PId,
                           famId = tAp.FamId,
                           姓名 = tP.P姓名,
                           申請人 = tAp.App申請人,
                           陪同人員 = tAp.App陪同人員,
                           聯絡方式 = tAp.App聯絡方式,
                           申請日期 = tAp.App申請日期,
                           外出日期 = tAp.App外出日期,
                           事由 = tAp.App事由,
                           地點 = tAp.App地點,
                           預計外出時間 = tAp.App預計外出時間,
                           修改時間 = tAp.App修改時間,
                           修改人員 = tAp.App修改人員,
                           審核 = tAp.App審核,
                           結案 = tAp.App結案
                       };
            foreach (var item in data)
            {
                tApplicationFormViewModel app = new tApplicationFormViewModel();
                app.appId = item.AppId;
                app.paId = item.pId;
                app.p姓名 = item.姓名;
                app.emId = item.emId;
                app.famId = item.famId;
                app.app申請人 = item.申請人;
                app.app陪同人員 = item.陪同人員;
                app.app聯絡方式 = item.聯絡方式;
                app.app申請日期 = item.申請日期;
                app.app外出日期 = (DateTime)item.外出日期;
                app.app事由 = item.事由;
                app.app地點 = item.地點;
                app.app預計外出時間 = item.預計外出時間;
                app.app修改時間 = item.修改時間;
                app.app修改人員 = item.修改人員;
                app.app審核 = item.審核;
                app.app結案 = item.結案;
                tA.Add(app);
            }
            return tA;
        }

        [HttpPut]
        [Route("[action]")]
        public async Task<string> UpdateListCheck(DeleteUpdateViewModel du)
        {
            TApplicationForm? tA = await _context.TApplicationForm.FindAsync(du.tableId);
            _context.Entry(tA).State = EntityState.Modified;
            tA.App審核 = "1";
            tA.App修改人員 = du.EId;
            tA.App修改時間 = DateTime.Now;
            await _context.SaveChangesAsync();
            return "更新成功";
        }

        [HttpGet]
        [Route("[action]/{eId}")]
        public async Task<IEnumerable<tApplicationFormViewModel>> ListOK(int eId)
        {
            List<tApplicationFormViewModel> tA = new List<tApplicationFormViewModel>();
            DateTime dt = DateTime.Now;
            var data = from tAp in _context.TApplicationForm
                       join tP in _context.TPatientInfo
                       on tAp.PId equals tP.PId
                       where (tAp.App結案 == "1" && tP.EId == eId)
                       select new
                       {
                           AppId = tAp.AppId,
                           emId = tAp.EId,
                           pId = tAp.PId,
                           famId = tAp.FamId,
                           姓名 = tP.P姓名,
                           申請人 = tAp.App申請人,
                           陪同人員 = tAp.App陪同人員,
                           聯絡方式 = tAp.App聯絡方式,
                           申請日期 = tAp.App申請日期,
                           外出日期 = tAp.App外出日期,
                           事由 = tAp.App事由,
                           地點 = tAp.App地點,
                           預計外出時間 = tAp.App預計外出時間,
                           修改時間 = tAp.App修改時間,
                           修改人員 = tAp.App修改人員,
                           審核 = tAp.App審核,
                           結案 = tAp.App結案
                       };
            foreach (var item in data)
            {
                tApplicationFormViewModel app = new tApplicationFormViewModel();
                app.appId = item.AppId;
                app.paId = item.pId;
                app.p姓名 = item.姓名;
                app.emId = item.emId;
                app.famId = item.famId;
                app.app申請人 = item.申請人;
                app.app陪同人員 = item.陪同人員;
                app.app聯絡方式 = item.聯絡方式;
                app.app申請日期 = item.申請日期;
                app.app外出日期 = (DateTime)item.外出日期;
                app.app事由 = item.事由;
                app.app地點 = item.地點;
                app.app預計外出時間 = item.預計外出時間;
                app.app修改時間 = item.修改時間;
                app.app修改人員 = item.修改人員;
                app.app審核 = item.審核;
                app.app結案 = item.結案;
                tA.Add(app);
            }

            return tA;
        }

        [HttpPut]
        [Route("[action]")]
        public async Task<string> UpdateStartTime(DeleteUpdateViewModel du)
        {
            var appId = _context.TApplicationForm.FirstOrDefault(p => p.AppId == du.tableId);
            if (appId != null && appId.App返回時間 == null)
            {
                appId.App出發時間 = DateTime.Now;
                appId.App修改時間 = DateTime.Now;
                appId.App修改人員 = du.EId;
                appId.App審核 = "1";
                appId.App現況 = 1;
                await _context.SaveChangesAsync();
                return "更新成功";
            }
            else
            {
                return "資料有誤";
            }

        }

        [HttpPut]
        [Route("[action]")]
        public async Task<string> UpdateReturnTime(DeleteUpdateViewModel du)
        {
            var appId = _context.TApplicationForm.FirstOrDefault(p => p.AppId == du.tableId);
            if (appId != null && appId.App出發時間 != null)
            {
                appId.App返回時間 = DateTime.Now;
                appId.App修改時間 = DateTime.Now;
                appId.App修改人員 = du.EId;
                appId.App現況 = 0;
                appId.App結案 = "1";

                await _context.SaveChangesAsync();
                return "更新成功";
            }
            else
            {
                return "資料有誤";
            }

        }

        [HttpGet]
        [Route("[action]")]
        public string SearchTodayApplicationForm()
        {
            DateTime dt = DateTime.Today;
            var data = _context.TApplicationForm.Where(p => p.App外出日期 == dt && p.App現況 == 0 && p.App結案 == "0").Select(t => t.PId);
            if (data == null)
            {
                return "無資料";
            }
            else
            {
                return JsonConvert.SerializeObject(data);
            }
        }

        [HttpGet]
        [Route("[action]/{patientName}")]
        public string apiSearchPatientData(string patientName)
        {
            int dataId = _context.TPatientInfo.FirstOrDefault(p => p.P姓名 == patientName)?.PId ?? 0;
            if (dataId == 0) 
            {
                return "NotFoundPeople";
            }
            DateTime dt = DateTime.Today;
            var data = _context.TApplicationForm.FirstOrDefault(p => p.PId == dataId && p.App外出日期 == dt && p.App現況 == 1);

            if (data == null)
            {
                return "NotFound";
            }
            else
            {
                return "Found";
            }            
        }

       [HttpGet]
        [Route("[action]/{EmployeeNumber}")]
        public string apiSearchEmployeeId(string EmployeeNumber)
        {
            int empId = _context.TEmployee.FirstOrDefault(p => p.E員工編號 ==  EmployeeNumber)?.EId ?? 0;
            if (empId == 0)
            {
                return "查無此人";
            }
            else
            {
                string temp = empId.ToString();
                return temp;
            }         
        }

        private bool TApplicationFormExists(int appId)
        {
            return _context.TApplicationForm.Any(e => e.AppId == appId);
        }

    }

}
