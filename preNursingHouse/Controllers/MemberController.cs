using Microsoft.AspNetCore.Mvc;
using preNursingHouse.Models;

namespace preNursingHouse.Controllers
{
    public class MemberController : Controller
    {
        private readonly fpdb2Context _fpdb2Context;
        public MemberController (fpdb2Context fpdb2Context)
        {
            _fpdb2Context = fpdb2Context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {
            IEnumerable<TMember> datas = _fpdb2Context.TMember.Where(t => t.M刪除會員 != true);
            return View(datas);

        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(TMember p)
        {
            if (!ModelState.IsValid)
            {
                return View(p);
            }
            p.M加入時間=DateTime.Now;
            p.M修改時間=null;  //todo改成會員的，測試null
            p.M最後登入時間 = null;
            p.M刪除會員 = false;

            _fpdb2Context.TMember.Add(p);
            _fpdb2Context.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TMember x = _fpdb2Context.TMember.FirstOrDefault(t => t.MId == id);
                if (x != null)
                {
                    return View(x);
                }
            }
            return RedirectToAction("List");

        }
        [HttpPost]

        public IActionResult Edit(TMember p)
        {
            TMember x = _fpdb2Context.TMember.FirstOrDefault(t => t.MId == p.MId);
            if (x != null)
            {
                x.MId = p.MId;
                x.M手機 = p.M手機;
                x.M密碼 = p.M密碼;
                x.M姓名 = p.M姓名;
                x.M性別 = p.M性別;
                x.MEmail = p.MEmail;
                x.M照片 = p.M照片;
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
                TMember delMember = _fpdb2Context.TMember.FirstOrDefault(t => t.MId == id);
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
