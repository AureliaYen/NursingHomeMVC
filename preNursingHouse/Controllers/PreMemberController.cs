using Microsoft.AspNetCore.Mvc;
using preNursingHouse.Models;
using preNursingHouse.ViewModel;
using System;
using System.Text.Json;

namespace preNursingHouse.Controllers
{
    public class PreMemberController : Controller
    {
        private readonly fpdb2Context _fpdb2Context;
        IWebHostEnvironment _enviroment;  //為了得知網路位置

        public PreMemberController(fpdb2Context fpdb2Context, IWebHostEnvironment enviroment)
        {
            _fpdb2Context = fpdb2Context;
            _enviroment = enviroment;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Detail()
        {
            if (HttpContext.Session.TryGetValue(CDictionary.SK_LOINGED_USER, out byte[] value))
            //確認session中是否有值 out byte[] value成功會被賦予值
            {
                string json = HttpContext.Session.GetString(CDictionary.SK_LOINGED_USER);
                CLoginViewModel login = JsonSerializer.Deserialize<CLoginViewModel>(json);
                int MId = login.MId;
                TMember x = _fpdb2Context.TMember.FirstOrDefault(t => t.MId == MId);
                if (x != null)
                {
                    return View(x);
                }
            }
            return RedirectToAction("Login","Home");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TMember x = _fpdb2Context.TMember.Where(t => t.M刪除會員 != true).FirstOrDefault(t => t.MId == id);
                if (x != null)
                {
                    return View(x);
                }
            }
            return RedirectToAction("Login", "Home");

        }
        [HttpPost]

        public IActionResult Edit(CPreMemberViewModel p)
        {
            TMember x = _fpdb2Context.TMember.FirstOrDefault(t => t.MId == p.MId);
            if (x != null)
            {
                if (p.photo != null)
                {
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _enviroment.WebRootPath + "/../../NursingHouse-v3/wwwroot/images/MemberImages/" + photoName;
                    if (x.M照片 != null)
                    {
                        string oldPath = _enviroment.WebRootPath + "/../../NursingHouse-v3/wwwroot/images/MemberImages/" + x.M照片;
                        if (System.IO.File.Exists(oldPath))
                        {
                            System.IO.File.Delete(oldPath);
                        }
                    }
                    x.M照片 = photoName;  //照片只紀錄檔案名稱
                    p.photo.CopyTo(new FileStream(path, FileMode.Create));  //photo是在ViewModel裡面建置的IFormFile
                }
                x.MId = p.MId;
                x.M手機 = p.M手機;
                x.M密碼 = p.M密碼;
                x.M姓名 = p.M姓名;
                x.M性別 = p.M性別;
                x.MEmail = p.MEmail;
                x.M住址 = p.M住址;

                x.M加入時間 = x.M加入時間;  //當初時間
                x.M修改時間 = DateTime.Now;  //現在時間時間
                x.M最後登入時間 = x.M最後登入時間;  //登入時間

                x.M備註 = x.M備註;
                x.M刪除會員 = false;
                x.M權限 = x.M權限;
                _fpdb2Context.SaveChangesAsync();

            }
            return RedirectToAction("Detail");

        }
      
    }
}
