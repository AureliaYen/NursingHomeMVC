using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;
using System.Data;

namespace NursingHouse_v3.Controllers
{
    public class TakeController : SuperController
	{
        fpdb2Context db = new fpdb2Context();

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<TTake> datas = null;

            if (string.IsNullOrEmpty(vm.txtKeyword))
            {
                datas = db.TTakes.Include(s => s.EIdNavigation).Include(a => a.M衛材編號Navigation);
            }

            else
            {
                datas = db.TTakes.Where(t => t.M領取編號.ToString().Contains(vm.txtKeyword) || t.M衛材編號Navigation.M衛材名稱.Contains(vm.txtKeyword) || t.EIdNavigation.E員工姓名.Contains(vm.txtKeyword));
                datas = from t in db.TTakes select t;
            }
            return View(datas);
        }
        public IActionResult Create()
        {
            CTakeViewModel vm = new CTakeViewModel();
            IEnumerable<TEmployee> te = db.TEmployees;
            IEnumerable<TProduct> tp = db.TProducts;

            vm.EIdNavigation = te;
            vm.M衛材編號Navigation = tp;

            return View(vm);
        }
        [HttpPost]
        public IActionResult Create(CTakeViewModel vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }
            TTake p = new TTake();
            TProduct tp = db.TProducts.Where(w => w.M衛材編號 == vm.M衛材編號).First();
            if (vm.M領取時間 != null)
            {
                p.M庫存數量 = tp.M庫存數量 - vm.M領取數量;
                tp.M庫存數量 = p.M庫存數量;
            }
            p.M領取編號 = vm.M領取編號;
            p.EId = vm.EId;
            p.M衛材編號 = vm.M衛材編號;
            p.M領取數量 = vm.M領取數量;
            //p.M領取時間 = vm.M領取時間;
            p.M領取時間 = DateTime.Now;
            if (p.M領取時間 != null)
            {
                p.M庫存數量 = tp.M庫存數量 - vm.M領取數量;
                tp.M庫存數量 = p.M庫存數量;
            }
            p.M庫存數量 = tp.M庫存數量;
            p.M用途 = vm.M用途;

            db.TTakes.Add(p);
            db.SaveChanges();

            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                TTake delTake = db.TTakes.FirstOrDefault(t => t.M領取編號 == id);
                if (delTake != null)
                {
                    TProduct tp = db.TProducts.Where(t => t.M衛材編號 == delTake.M衛材編號)
                        .First();
                    tp.M庫存數量 += delTake.M領取數量;
                    db.Remove(delTake);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TTake p = db.TTakes.Include(x => x.EIdNavigation).Include(a => a.M衛材編號Navigation).FirstOrDefault(t => t.M領取編號 == id);

                if (p != null)
                {
                    CTakeViewModel vm = new CTakeViewModel();
                    IEnumerable<TEmployee> te = db.TEmployees;
                    IEnumerable<TProduct> tp = db.TProducts;

                    vm.EIdNavigation = te;
                    vm.M衛材編號Navigation = tp;
                    vm.Take = p;
                    return View(vm);
                }
            }

            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(CTakeViewModel vm)
        {
            if (vm.M領取編號 != null)
            {
                TTake p = db.TTakes.FirstOrDefault(t => t.M領取編號 == vm.M領取編號);

                TProduct tp = db.TProducts.FirstOrDefault(t => t.M衛材編號 == vm.M衛材編號);
                if (p != null)
                {
                    if (p.M領取數量 != vm.M領取數量)  //修改領用數量
                    {
                        tp.M庫存數量 = tp.M庫存數量 + p.M領取數量 - vm.M領取數量;
                        p.M庫存數量 = p.M庫存數量 + p.M領取數量 - vm.M領取數量;
                    }
                    p.M領取編號 = vm.M領取編號;
                    p.EId = vm.EId;
                    p.M衛材編號 = vm.M衛材編號;
                    p.M領取數量 = vm.M領取數量;
                    p.M領取時間 = vm.M領取時間;
                    p.M用途 = vm.M用途;

                    db.SaveChanges();
                }
            }
            return RedirectToAction("List");
        }
    }

}
