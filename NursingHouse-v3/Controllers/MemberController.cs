using Microsoft.AspNetCore.Mvc;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
    public class MemberController : SuperController
	{
        IWebHostEnvironment _enviroment;  //為了得知網路位置
        fpdb2Context _fpdb2Context = new fpdb2Context();

        public MemberController (IWebHostEnvironment environment)
        {
            _enviroment = environment;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {
            IEnumerable<TMember> datas = _fpdb2Context.TMembers.Where(t => t.M刪除會員 != true);
            return View(datas);

        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(CMemberViewModel p)
        {
            if (!ModelState.IsValid)
            {
                return View(p);
            }
            
            if (p.photo != null)
            {
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _enviroment.WebRootPath + "/images/MemberImages/" + photoName;
                p.M照片 = photoName;  //照片只紀錄檔案名稱
                p.photo.CopyTo(new FileStream(path, FileMode.Create));  //photo是在ViewModel裡面建置的IFormFile
            }

            p.M加入時間 = DateTime.Now;
            p.M修改時間 = null;  //todo改成會員的，測試null
            p.M最後登入時間 = null;
            p.M刪除會員 = false;
            TMember x = new TMember
            {
                MId = p.MId,
                M手機 = p.M手機,
                M密碼 = p.M密碼,
                M姓名 = p.M姓名,
                M性別 = p.M性別,
                MEmail = p.MEmail,
                M照片 = p.M照片,
                M住址 = p.M住址,
                M加入時間 = p.M加入時間,
                M修改時間 = p.M修改時間,
                M最後登入時間 = p.M最後登入時間,
                M刪除會員 = p.M刪除會員,
                M權限 = p.M權限,
            };

            _fpdb2Context.TMembers.Add(x);
            _fpdb2Context.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TMember x = _fpdb2Context.TMembers.FirstOrDefault(t => t.MId == id);
                if (x != null)
                {
                    return View(x);
                }
            }
            return RedirectToAction("List");

        }
        [HttpPost]

        public IActionResult Edit(CMemberViewModel p)
        {
            TMember x = _fpdb2Context.TMembers.FirstOrDefault(t => t.MId == p.MId);
            if (x != null)
            {
                if (p.photo!= null)
                {
                    string photoName=Guid.NewGuid().ToString()+".jpg";
                    string path = _enviroment.WebRootPath + "/images/MemberImages/" + photoName;
                    if (x.M照片 != null)
                    {
                        string oldPath = _enviroment.WebRootPath + "/images/MemberImages/" + x.M照片;
                        if (System.IO.File.Exists(oldPath))
                        {
                            System.IO.File.Delete(oldPath);
                        }
                    }
                    x.M照片= photoName;  //照片只紀錄檔案名稱
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
                x.M修改時間 = x.M修改時間;  //現在時間時間
                x.M最後登入時間 = x.M最後登入時間;  //登入時間

                x.M備註 = p.M備註;
                x.M刪除會員 = false;
                x.M權限 = p.M權限;
                _fpdb2Context.SaveChangesAsync();

            }
            return RedirectToAction("List");

        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                TMember delMember = _fpdb2Context.TMembers.FirstOrDefault(t => t.MId == id);
                if (delMember != null)
                {
                    delMember.M刪除會員 = true;
                    _fpdb2Context.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }

    }
}
