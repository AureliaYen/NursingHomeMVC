using Microsoft.AspNetCore.Mvc;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
    public class ProductController : SuperController
	{
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Edit(TProduct p)
        {
            fpdb2Context db = new fpdb2Context();
            TProduct x = db.TProducts.FirstOrDefault(t => t.M衛材編號 == p.M衛材編號);
            if (x != null)
            {
                x.M衛材編號 = p.M衛材編號;
                x.M衛材名稱 = p.M衛材名稱;
                x.M單價 = p.M單價;
                x.M單位 = p.M單位;
                x.M庫存數量 = p.M庫存數量;
                x.M安全庫存數 = p.M安全庫存數;
                x.M訂購狀態 = p.M訂購狀態;
                db.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                fpdb2Context db = new fpdb2Context();
                TProduct x = db.TProducts.FirstOrDefault(t => t.M衛材編號 == id);
                if (x != null)
                    return View(x);
            }
            return RedirectToAction("List");
        }

        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                fpdb2Context db = new fpdb2Context();
                TProduct delProduct = db.TProducts.FirstOrDefault(t => t.M衛材編號 == id);
                if (delProduct != null)
                {
                    db.TProducts.Remove(delProduct);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }

        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<TProduct> datas = null;
            fpdb2Context db = new fpdb2Context();
            if (vm.txtKeyword == null)
                datas = from t in db.TProducts
                        select t;
            else
                datas = db.TProducts.Where(t => t.M衛材名稱.Contains(vm.txtKeyword) || t.M衛材編號.ToString().Contains(vm.txtKeyword));

            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(TProduct p)
        {
            fpdb2Context db = new fpdb2Context();
            if (!ModelState.IsValid)
            {
                return View(p);
            }
            db.TProducts.Add(p);
            db.SaveChanges();
            return RedirectToAction("List");
        }
    }
}
