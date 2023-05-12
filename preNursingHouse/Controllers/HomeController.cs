using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.VisualBasic.Syntax;
using preNursingHouse.Models;
using preNursingHouse.ViewModel;
using System;
using System.Diagnostics;
using System.Diagnostics.Metrics;
using System.Text.Json;
using static System.Collections.Specialized.BitVector32;


namespace preNursingHouse.Controllers
{
    
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly fpdb2Context _fpdb2Context;
        IWebHostEnvironment _enviroment;  //為了得知網路位置


        public HomeController(ILogger<HomeController> logger, fpdb2Context fpdb2Context, IWebHostEnvironment enviroment)
        {
            _logger = logger;
            _fpdb2Context = fpdb2Context;
            _enviroment = enviroment;
        }
        public IActionResult VUESPA()
        {
            return View();
        }


        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(CLoginViewModel login)
        {
            TMember member = _fpdb2Context.TMember.FirstOrDefault(t => t.M手機.Equals(login.txtAccount) && t.M密碼.Equals(login.txtPassword));

            if (member != null && member.M密碼.Equals(login.txtPassword))
            {
                HttpContext.Session.SetString("UserName", member.M姓名);
                HttpContext.Session.SetInt32("USERID", member.MId);

                login.MId = member.MId;  //todo確認
                member.M最後登入時間=DateTime.Now;
                string json = JsonSerializer.Serialize(login);  //將login json化
                HttpContext.Session.SetString(CDictionary.SK_LOINGED_USER, json);  //將轉呈json的login存入session
                ViewBag.LoginErr = "";
                _fpdb2Context.SaveChangesAsync();
                return RedirectToAction ("Index");

            }
            else
            {
                ViewBag.LoginErr = "帳戶密碼錯誤";
                return View ("Login",login);
            }

        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Register(CPreMemberViewModel p)
        {
            if (!ModelState.IsValid)
            {
                return View(p);
            }
            if (p.photo != null)
            {
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _enviroment.WebRootPath + "/../../NursingHouse-v3/wwwroot/images/MemberImages/" + photoName; 
                p.M照片 = photoName;  //照片只紀錄檔案名稱
                p.photo.CopyTo(new FileStream(path, FileMode.Create));  //photo是在ViewModel裡面建置的IFormFile
            }
            p.M加入時間 = DateTime.Now;
            p.M修改時間 = null;  //todo改成會員的，測試null
            p.M最後登入時間 = null;
            p.M刪除會員 = false;
            p.M權限 = "一般會員";
            //p.M備註 = null;
            TMember x = new TMember {
                MId = p.MId,
                M手機 = p.M手機,
                M密碼 = p.M密碼,
                M姓名 = p.M姓名,
                M性別 = p.M性別,
                MEmail = p.MEmail,
                M照片 = p.M照片,
                M加入時間 = p.M加入時間,
                M修改時間 = p.M修改時間,
                M最後登入時間 = p.M最後登入時間,
                M刪除會員 = p.M刪除會員,
                M權限 = p.M權限,
            };

            _fpdb2Context.TMember.Add(x);
            _fpdb2Context.SaveChanges();
            return RedirectToAction("Login");

        }

        public IActionResult Logout()
        {
			HttpContext.Session.Remove("UserName");
			HttpContext.Session.Remove("USERID");


            HttpContext.Session.Remove(CDictionary.SK_LOINGED_USER);
            return RedirectToAction("Login");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}