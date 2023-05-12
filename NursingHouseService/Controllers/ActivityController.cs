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
    public class ActivityController : ControllerBase
    {

        private readonly fpdb2Context _context;
        private readonly IWebHostEnvironment _web;

        public ActivityController(fpdb2Context fpdb2, IWebHostEnvironment web)
        {
            _context = fpdb2;
            _web = web;
        }

        #region 新增活動    
        [HttpPost]
        [Route("[action]")]
        public async Task<string> CreateActivityItem(tActivityViewModel ac)
        {
            TActivity act = new TActivity();
            CActivityCheck chk = new CActivityCheck();
            var data = _context.TActivity.OrderByDescending(p => p.ActId).FirstOrDefault();
            int num = 0;
            if (data != null)
            {
                num = data.ActId + 1;
            }
            else
            {
                num = 10000;
            }
            if (chk.checkActivityItem(ac))
            {
                act.EId = ac.EId;
                act.Act活動編號 = (DateTime.Today.ToString("yyyyMMdd")) + ac.EId.ToString() + num.ToString();
                act.Act活動名稱 = ac.Act活動名稱;
                act.Act活動說明 = ac.Act活動說明;
                act.Act活動圖片 = ac.Act活動圖片;

                if (ac.Act活動日期 < ac.Act報名截止日)
                {
                    return "輸入資料錯誤1";
                }
                else
                {
                    act.Act活動日期 = ac.Act活動日期;
                }

                act.Act地點 = ac.Act地點;
                if (ac.Act報名截止日 < DateTime.Now)
                {
                    return "輸入資料錯誤2";
                }
                else
                {
                    act.Act報名截止日 = ac.Act報名截止日;
                }

                act.Act價格 = ac.Act價格;
                act.Act主講人 = ac.Act主講人;
                act.Act主講人描述 = ac.Act主講人描述;
                act.Act注意事項 = ac.Act注意事項;
                act.Act公開狀態 = ac.Act公開狀態;
                act.Act已報名人數 = 0;
                act.Act最大人數 = ac.Act最大人數;
                act.Act建立日期 = DateTime.Now;
                act.Act修改日期 = null;
                act.Act最後修改人 = null;
                act.Act結案 = 0;
                act.Act備註 = null;
                _context.TActivity.Add(act);
                await _context.SaveChangesAsync();
                return "新增成功";
            }
            else
            {
                return "資料有誤";
            }
        }

        [HttpPost]
        [Route("[action]")]
        public async Task<IActionResult> CreateActivityPicture(IFormFile files)
        {
            var rootPath = _web.ContentRootPath + "\\wwwroot\\images\\";

            if (files.Length > 0)
            {
                var filePath = files.FileName;
                using (var stream = System.IO.File.Create(rootPath + filePath))
                {
                    await files.CopyToAsync(stream);
                }
            }

            return Ok();
        }

        [HttpGet] 
        [Route("[action]/{actId}")]
        public async Task<tActivityDataViewModel> GetActivity(int actId)
        {
            tActivityDataViewModel actData = new tActivityDataViewModel();
            var act = _context.TActivity.FirstOrDefault(p => p.ActId == actId);

            if (act != null && act.Act已報名人數 == 0)
            {
                actData.ActId = act.ActId;
                actData.EId = act.EId;
                actData.Act活動編號 = act.Act活動編號;
                actData.Act活動名稱 = act.Act活動名稱;
                actData.Act活動日期 = act.Act活動日期;
                actData.Act活動圖片 = act.Act活動圖片;
                actData.Act活動說明 = act.Act活動說明;
                actData.Act地點 = act.Act地點;
                actData.Act報名截止日 = act.Act報名截止日;
                actData.Act價格 = act.Act價格;
                actData.Act主講人 = act.Act主講人;
                actData.Act主講人描述 = act.Act主講人描述;
                actData.Act注意事項 = act.Act注意事項;
                actData.Act已報名人數 = act.Act已報名人數;
                actData.Act最大人數 = act.Act最大人數;
                actData.Act建立日期 = act.Act建立日期;
                actData.Act公開狀態 = act.Act公開狀態;
                actData.Act最後修改人 = act.Act最後修改人;

                return actData;
            }
            else
            {
                return null;
            }
        }



        [HttpPut]   
        [Route("[action]")]
        public async Task<string> EditActivityItem([FromBody] tActivityViewModel ac)
        {
            CActivityCheck chk = new CActivityCheck();
            var act = _context.TActivity.FirstOrDefault(p => p.ActId == ac.ActId);
            var emp = _context.TEmployee.FirstOrDefault(p => p.EId == ac.EId);
            if (chk.checkActivityItem(ac))
            {
                act.Act活動名稱 = ac.Act活動名稱;
                act.Act活動說明 = ac.Act活動說明;
                act.Act活動圖片 = ac.Act活動圖片;
                act.Act活動日期 = ac.Act活動日期;
                act.Act地點 = ac.Act地點;
                act.Act報名截止日 = ac.Act報名截止日;
                if (ac.Act報名截止日 < DateTime.Today)
                {
                    return "輸入資料錯誤";
                }

                if (ac.Act已報名人數 > 0)
                {
                    act.Act價格 = act.Act價格;
                }
                else
                {
                    act.Act價格 = ac.Act價格;
                }

                act.Act主講人 = ac.Act主講人;
                act.Act主講人描述 = ac.Act主講人描述;
                act.Act注意事項 = ac.Act注意事項;
                act.Act公開狀態 = ac.Act公開狀態;
                act.Act已報名人數 = ac.Act已報名人數;
                if (ac.Act最大人數 < act.Act已報名人數)
                {
                    return "人數錯誤";
                }
                act.Act最大人數 = ac.Act最大人數;
                act.Act修改日期 = DateTime.Now;
                act.Act最後修改人 = emp.E員工姓名;
                act.Act備註 = ac.Act備註;

                await _context.SaveChangesAsync();
                return "修改成功";
            }
            else
            {
                return "資料有誤";
            }
        }

        [HttpGet]
        [Route("[action]")]
        public IEnumerable<TActivity> ActivityNotClose()
        {
            var data = _context.TActivity.Where(p => p.Act結案 == 0).ToList();

            return data;
        }

        [HttpGet]
        [Route("[action]")]
        public IEnumerable<TActivity> ActivityClose()
        {
            var data = _context.TActivity.Where(p => p.Act結案 != 0).ToList();

            return data;
        }

        [HttpPut]   
        [Route("[action]")]
        public async Task<string> ChangeActivityShow(ActivityStateChangeViewModel asc)
        {
            var data = _context.TActivity.FirstOrDefault(p => p.ActId == asc.ActId);
            if (data.Act公開狀態 == 0)
            {
                data.Act公開狀態 = 1;
            }
            else
            {
                data.Act公開狀態 = 0;
            }

            var name = _context.TEmployee.FirstOrDefault(p => p.EId == asc.EId);
            data.Act修改日期 = DateTime.Now;
            data.Act最後修改人 = name.E員工姓名;
            await _context.SaveChangesAsync();
            return "修改成功";
        }

        [HttpPut]  
        [Route("[action]")]
        public async Task<string> HideActivityItem(ActivityStateChangeViewModel asc)
        {
            //CActivityCheck chk = new CActivityCheck();
            var data = _context.TActivity.FirstOrDefault(p => p.ActId == asc.ActId);
            data.Act結案 = 1;
            data.Act修改日期 = DateTime.Now;
            var name = _context.TEmployee.FirstOrDefault(p => p.EId == asc.EId);
            data.Act最後修改人 = name.E員工姓名;
            await _context.SaveChangesAsync();
            return "修改成功";
        }

        #endregion

        [HttpGet]
        [Route("[action]")]
        public async Task<IEnumerable<showActivityViewModel>> GetActivitList()
        {
            var data = _context.TActivity.Where(p => p.Act公開狀態 == 1 && p.Act結案 == 0 && (p.Act最大人數 - p.Act已報名人數) > 0 && p.Act報名截止日 >= DateTime.Today);

            List<showActivityViewModel> listVm = new List<showActivityViewModel>();

            foreach (var tA in data)
            {
                showActivityViewModel vm = new showActivityViewModel();
                vm.ActId = tA.ActId;
                vm.Act活動編號 = tA.Act活動編號;
                vm.Act活動名稱 = tA.Act活動名稱;
                vm.Act活動說明 = tA.Act活動說明;
                vm.Act活動圖片 = tA.Act活動圖片;
                vm.Act活動日期 = tA.Act活動日期;
                vm.Act地點 = tA.Act地點;
                vm.Act報名截止日 = tA.Act報名截止日;
                vm.Act價格 = tA.Act價格;
                vm.Act主講人 = tA.Act主講人;
                vm.Act公開狀態 = tA.Act公開狀態;
                vm.Act結案 = tA.Act結案;
                //vm.Aco收藏 = 0;
                listVm.Add(vm);
            };

            return listVm;
        }

        #region 訂單       
        [HttpGet]
        [Route("[action]/{activityNumber}")]
        public async Task<int?> GetActivityPersons(int activityNumber)   
        {
            CActivityFactory acf = new CActivityFactory(_context);
            return acf.checkPeopleToActivity(activityNumber);
        }

        [HttpGet]
        [Route("[action]/{activityNumber}")]
        public async Task<IEnumerable<ActivityDetail>> GetActivityData(int activityNumber)   
        {

            var data = _context.TActivity
                        .Join(_context.TEmployee,
                        a => a.EId,
                        e => e.EId,
                        (a, e) => new ActivityDetail
                        {
                            ActId = a.ActId,
                            Act活動編號 = a.Act活動編號,
                            Act活動名稱 = a.Act活動名稱,
                            Act活動圖片 = a.Act活動圖片,
                            Act活動日期 = a.Act活動日期,
                            Act活動說明 = a.Act活動說明,
                            Act地點 = a.Act地點,
                            Act報名截止日 = a.Act報名截止日,
                            Act價格 = a.Act價格,
                            Act主講人 = a.Act主講人,
                            Act主講人描述 = a.Act主講人描述,
                            Act注意事項 = a.Act注意事項,
                            Act已報名人數 = a.Act已報名人數,
                            Act最大人數 = a.Act最大人數,
                            E員工姓名 = e.E員工姓名,
                            E電話 = e.E電話,
                            EEmail = e.EEmail,
                            E性別 = e.E性別
                        }).Where(p => p.ActId == activityNumber);

            return data;
        }

        [HttpGet]
        [Route("[action]/{memberId}/{activityNumber}")]
        public async Task<BuyInformation> GetMemberData(int memberId, int activityNumber)
        {
            BuyInformation bu = new BuyInformation();
            var data = _context.TActivity.FirstOrDefault(p => p.ActId == activityNumber);
            var data2 = _context.TMember.FirstOrDefault(p => p.MId == memberId);

            bu.ActId = data.ActId;
            bu.Act活動編號 = data.Act活動編號;
            bu.Act活動名稱 = data.Act活動名稱;
            bu.Act活動說明 = data.Act活動說明;
            bu.Act活動日期 = data.Act活動日期;
            bu.Act地點 = data.Act地點;
            bu.Act報名截止日 = data.Act報名截止日;
            bu.Act價格 = data.Act價格;
            bu.Act注意事項 = data.Act注意事項;
            bu.Act已報名人數 = data.Act已報名人數;
            bu.Act最大人數 = data.Act最大人數;
            bu.MId = data2.MId;
            bu.M手機 = data2.M手機;
            bu.M姓名 = data2.M姓名;
            bu.MEmail = data2.MEmail;
            return bu;
        }

        [HttpPost]
        [Route("[action]")]
        public string CreateActivityOrder(tActivityOrderViewModel actOrder)
        {
            TActivityOrder order = new TActivityOrder();
            order.Ao會員Id = actOrder.Ao會員Id;
            order.Ao參加人姓名 = actOrder.Ao參加人姓名;
            order.Ao參加人電話 = actOrder.Ao參加人電話;
            order.Ao參加人Email = actOrder.Ao參加人Email;
            order.Ao活動編號 = actOrder.Ao活動編號;
            order.Ao參與人數 = actOrder.Ao參與人數;

            var dataPeople = _context.TActivity.FirstOrDefault(p => p.ActId == actOrder.Ao活動編號);
            if (dataPeople != null && (dataPeople.Act最大人數 - dataPeople.Act已報名人數) < (int)actOrder.Ao參與人數)
            {
                return "人數超過";
            }

            if(dataPeople != null)
            {
                dataPeople.Act已報名人數 += actOrder.Ao參與人數;
            }
            order.Ao訂單建立日期 = DateTime.Now;
            order.Ao修改日期 = null;
            order.Ao訂單進度 = "已發送繳費通知";
            order.Ao金額 = actOrder.Ao金額;
            order.Ao結案 = 0;
            order.Ao備註 = null;

            _context.TActivityOrder.Add(order);
            _context.SaveChanges();

            CSqlFactory cs = new CSqlFactory(_context);
            EmailUse eu = new EmailUse();
            eu.memberId = order.Ao會員Id.ToString();
            cs.SendEmail(eu);



            return $"下訂成功,{actOrder.Ao會員Id}";
        }

        [HttpGet]
        [Route("[action]/{memberId}/{state}")]
        public async Task<IEnumerable<tActivityOrderViewModel>> GetActivityOrderClient(int memberId, int state)
        {
            List<tActivityOrderViewModel> activityOrder = new List<tActivityOrderViewModel>();
            var data = _context.TActivity.Join(_context.TActivityOrder,
                    act => act.ActId,
                    ao => ao.Ao活動編號,
                    (act, ao) => new
                    {
                        aoId = ao.AoId,
                        活動編號 = act.Act活動編號,
                        活動名稱 = act.Act活動名稱,
                        活動說明 = act.Act活動說明,
                        活動日期 = act.Act活動日期,
                        已報名人數 = act.Act已報名人數,
                        最大人數 = act.Act最大人數,
                        金額 = ao.Ao金額,
                        參加人姓名 = ao.Ao參加人姓名,
                        參加人電話 = ao.Ao參加人電話,
                        參加人Email = ao.Ao參加人Email,
                        建立日期 = ao.Ao訂單建立日期,
                        進度 = ao.Ao訂單進度,
                        會員Id = ao.Ao會員Id,
                        結案 = ao.Ao結案
                    }
                ).Where(p => p.會員Id == memberId && p.結案 == state);

            foreach (var item in data)
            {
                tActivityOrderViewModel ord = new tActivityOrderViewModel();
                ord.AoId = item.aoId;
                ord.訂單編號 = item.建立日期.ToString("yyyyMMdd") + (item.aoId % 100 + 1).ToString();
                ord.Act活動編號 = item.活動編號;
                ord.Act活動名稱 = item.活動名稱;
                ord.Act活動說明 = item.活動說明;
                ord.Ao參加人姓名 = item.參加人姓名;
                ord.Ao參加人電話 = item.參加人電話;
                ord.Ao參加人Email = item.參加人Email;
                ord.Ao訂單進度 = item.進度;
                ord.Ao訂單建立日期 = item.建立日期;
                ord.Ao金額 = item.金額;
                ord.Act已報名人數 = item.已報名人數;
                ord.Act最大人數 = item.最大人數;
                activityOrder.Add(ord);
            }
            return activityOrder;
        }



        [HttpGet]
        [Route("[action]/{state}")]
        public async Task<IEnumerable<tActivityOrderViewModel>> GetActivityOrderServer(int state)
        {
            List<tActivityOrderViewModel> activityOrder = new List<tActivityOrderViewModel>();

            var data = _context.TActivity.Join(_context.TActivityOrder,
                    act => act.ActId,
                    ao => ao.Ao活動編號,
                    (act, ao) => new
                    {
                        aoId = ao.AoId,
                        活動編號 = act.Act活動編號,
                        活動名稱 = act.Act活動名稱,
                        活動說明 = act.Act活動說明,
                        活動日期 = act.Act活動日期,
                        已報名人數 = act.Act已報名人數,
                        最大人數 = act.Act最大人數,
                        金額 = ao.Ao金額,
                        參加人姓名 = ao.Ao參加人姓名,
                        參加人電話 = ao.Ao參加人電話,
                        參加人Email = ao.Ao參加人Email,
                        建立日期 = ao.Ao訂單建立日期,
                        進度 = ao.Ao訂單進度,
                        會員Id = ao.Ao會員Id,
                        結案 = ao.Ao結案
                    }
                ).Where(p => p.結案 == state);

            foreach (var item in data)
            {
                tActivityOrderViewModel ord = new tActivityOrderViewModel();
                ord.訂單編號 = item.建立日期.ToString().Substring(0, 4);
                ord.訂單編號 += item.建立日期.ToString().Substring(5, 1);
                ord.訂單編號 += item.建立日期.ToString().Substring(7, 1);
                ord.訂單編號 += item.aoId;
                ord.AoId = item.aoId;
                ord.Act活動編號 = item.活動編號;
                ord.Act活動名稱 = item.活動名稱;
                ord.Act活動說明 = item.活動說明;
                ord.Ao參加人姓名 = item.參加人姓名;
                ord.Ao參加人電話 = item.參加人電話;
                ord.Ao參加人Email = item.參加人Email;
                ord.Ao訂單進度 = item.進度;
                ord.Ao訂單建立日期 = item.建立日期;
                ord.Ao金額 = item.金額;
                ord.Act已報名人數 = item.已報名人數;
                ord.Act最大人數 = item.最大人數;
                activityOrder.Add(ord);
            }

            return activityOrder;
        }

        [HttpGet]
        [Route("[action]/{aoId}")]
        public async Task<tActivityOrderViewModel> GetActivityOrder(int aoId)
        {
            var data = _context.TActivityOrder.FirstOrDefault(p => p.AoId == aoId);            
            var data2 = _context.TActivity.Join(_context.TActivityOrder,
                    act => act.ActId,
                    ao => ao.Ao活動編號,
                    (act, ao) => new tActivityOrderViewModel
                    {
                        AoId = ao.AoId,
                        Ao活動編號 = ao.Ao活動編號,
                        Act活動編號 = act.Act活動編號,
                        Act活動名稱 = act.Act活動名稱,
                        Act活動說明 = act.Act活動說明,
                        Act活動日期 = act.Act活動日期,
                        Act地點 =act.Act地點,
                        Act已報名人數 = act.Act已報名人數 - (int)data.Ao參與人數,
                        Act最大人數 = act.Act最大人數,
                        Ao金額 = ao.Ao金額,
                        Ao參加人姓名 = ao.Ao參加人姓名,
                        Ao參加人電話 = ao.Ao參加人電話,
                        Ao參加人Email = ao.Ao參加人Email,
                        Ao參與人數 = (int)ao.Ao參與人數,
                        Ao訂單建立日期 = ao.Ao訂單建立日期,
                        Ao訂單進度 = ao.Ao訂單進度,
                        Ao會員Id = ao.Ao會員Id,
                    }
                ).FirstOrDefault(p => p.AoId == aoId);

            if (data != null)
            {
                data2.Act已報名人數 -= (int)data.Ao參與人數;
            }
            await _context.SaveChangesAsync();
            return data2;
        }

        [HttpPut]
        [Route("[action]/{aoId}")]
        public async Task<string> DeleteActivityOrderPeople(int aoId)
        {
            var data = _context.TActivityOrder.FirstOrDefault(p => p.AoId == aoId);
            var data2 = _context.TActivity.FirstOrDefault(p => p.ActId == data.Ao活動編號);

            if(data2 != null && data != null)
            {
				data2.Act已報名人數 -= (int)data.Ao參與人數;
			}

            await _context.SaveChangesAsync();
            return "修改成功";
        }

		[HttpPut]
		[Route("[action]/{aoId}/{people}")]
		public async Task<string> UpdateActivityOrderPeople(int aoId, int people)
		{
			var data = _context.TActivityOrder.FirstOrDefault(p => p.AoId == aoId);
			var data2 = _context.TActivity.FirstOrDefault(p => p.ActId == data.Ao活動編號);

			if (data2 != null && data != null)
			{
				data2.Act已報名人數 += people;
			}

			await _context.SaveChangesAsync();
			return "修改成功";
		}

		[HttpPut]
        [Route("[action]")]
        public async Task<string> UpdateActivityOrder(tActivityOrderViewModel actOrder)
        {
            var data = _context.TActivityOrder.FirstOrDefault(p => p.AoId == actOrder.AoId);        
            data.Ao參加人姓名 = actOrder.Ao參加人姓名;
            data.Ao參加人電話 = actOrder.Ao參加人電話;
            data.Ao參加人Email = actOrder.Ao參加人Email;
            data.Ao參與人數 = actOrder.Ao參與人數;
            data.Ao金額 = actOrder.Ao金額;
            data.Ao修改日期 = DateTime.Now;
            data.Ao修改人 = actOrder.Ao會員Id;

            await _context.SaveChangesAsync();
            return "修改成功";
        }

        [HttpPut]
        [Route("[action]")] 
        public async Task<string> DeleteActivityOrder(DeleteUpdateViewModel de)
        {
            var data = _context.TActivityOrder.FirstOrDefault(p => p.AoId == de.tableId);
            if (data != null && data.Ao結案 == 0)
            {
                data.Ao結案 = 1;
                data.Ao訂單進度 = "結案";
                data.Ao修改日期 = DateTime.Now;
                data.Ao修改人 = de.EId;
                await _context.SaveChangesAsync();
                return "更新成功";
            }
            else
            {
                return "資料有誤";
            }

        }

        #endregion

        [HttpPost]
        [Route("[action]")]
        public async Task<string> CreateCommentValue(CommentViewModel commentviewmodel)
        {
            TActivityComment comm = new TActivityComment();
            comm.Ac活動編號 = commentviewmodel.ActivityNumber;
            comm.Ac會員Id = commentviewmodel.MemberId;
            comm.Ac評價 = commentviewmodel.StartValue;
            comm.Ac備註 = null;

            _context.TActivityComment.Add(comm);
            await _context.SaveChangesAsync();
            return "新增成功";
        }

        [HttpGet]
        [Route("[action]/{memberId}")]
        public async Task<IEnumerable<CCollectViewModel>> SearchCollect(int memberId)
        {
            var data = _context.TActivityCollect.Where(p => p.Aco會員Id == memberId);
            List<CCollectViewModel> lcol = new List<CCollectViewModel>();

            foreach (var item in data)
            {
                CCollectViewModel col = new CCollectViewModel();
                col.Aco活動Id = item.Aco活動Id;
                col.Aco收藏 = item.Aco收藏;
                lcol.Add(col);
            }

            return lcol;
        }

        [HttpPost]
        [Route("[action]")]
        public async Task<string> CreateCollectValue(CollectViewModel collectviewmodel)
        {
            TActivityCollect col = new TActivityCollect();
            col.Aco活動Id = collectviewmodel.ActivityNumber;
            col.Aco會員Id = collectviewmodel.MemberId;
            col.Aco收藏 = 1;
            _context.TActivityCollect.Add(col);
            await _context.SaveChangesAsync();
            return "新增成功";
        }

        [HttpPut]
        [Route("[action]")]
        public async Task<string> UpdateCollectValue([FromBody] CollectViewModel collectviewmodel)
        {
            var data = _context.TActivityCollect.Where
                (p => p.Aco會員Id == collectviewmodel.ActivityNumber && p.Aco活動Id == collectviewmodel.ActivityNumber);

            foreach (var item in data)
            {
                item.Aco收藏 = 1;
            }

            await _context.SaveChangesAsync();
            return "修改成功";
        }

		[HttpGet]
		[Route("[action]/{orderId}")]
		public string SendBill(int orderId)
		{
            CSqlFactory cs = new CSqlFactory(_context);			
			cs.OrderIdUseSendEmail(orderId);


			return "OK";
		}


	}


}
