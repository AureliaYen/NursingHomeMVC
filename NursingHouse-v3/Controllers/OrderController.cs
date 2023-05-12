using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NursingHouse_v3.Models;
using NursingHouse_v3.ViewModel;

namespace NursingHouse_v3.Controllers
{
    public class OrderController : SuperController
	{
        fpdb2Context db = new fpdb2Context();

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<TOrder> datas = null;

            if (string.IsNullOrEmpty(vm.txtKeyword))
            {
                datas = db.TOrders.Include(s => s.EIdNavigation).Include(a => a.M衛材編號Navigation);
            }

            else
            {
                datas = db.TOrders.Where(t => t.M進貨編號.ToString().Contains(vm.txtKeyword) || t.M衛材編號Navigation.M衛材名稱.Contains(vm.txtKeyword) || t.EIdNavigation.E員工姓名.Contains(vm.txtKeyword));
                datas = from t in db.TOrders select t;
            }
            return View(datas);

        }
        public IActionResult Create()
        {
            COrderViewModel vm = new COrderViewModel();
            IEnumerable<TEmployee> te = db.TEmployees;
            IEnumerable<TProduct> tp = db.TProducts;

            vm.EIdNavigation = te;
            vm.M衛材編號Navigation = tp;

            return View(vm);
        }
        [HttpPost]
        public IActionResult Create(COrderViewModel vm)  //如果設定之後的日期會無法更新
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }
            // p 要存入  tp TProduct 資料表


            TOrder p = new TOrder();
            p.M訂購狀態 = vm.M訂購狀態;

            TProduct tP = db.TProducts.Where(w => w.M衛材編號 == vm.M衛材編號).First();
            if (vm.M到貨日期 != null)
            {
                int result = DateTime.Compare((DateTime)vm.M到貨日期, DateTime.Now);
                if (result <= 0)
                {
                    p.M庫存數量 = tP.M庫存數量 + vm.M訂購數量;
                    tP.M庫存數量 = vm.M訂購數量 + tP.M庫存數量;
                    p.M訂購狀態 = false;
                    tP.M訂購狀態 = false;

                }

            }
            else
            {
                p.M訂購狀態 = true;
                tP.M訂購狀態 = true;
            }
            p.M進貨編號 = vm.M進貨編號;
            p.EId = vm.EId;
            p.M衛材編號 = vm.M衛材編號;
            p.M訂購數量 = vm.M訂購數量;
            p.M價錢 = tP.M單價;
            p.M小計 = tP.M單價 * vm.M訂購數量;
            p.M訂購日期 = vm.M訂購日期;
            p.M到貨日期 = vm.M到貨日期;
            p.M庫存數量 = tP.M庫存數量;

            db.TOrders.Add(p);
            db.SaveChanges();

            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                TOrder delOrder = db.TOrders.FirstOrDefault(t => t.M進貨編號 == id);

                if (delOrder != null)
                {
                    TProduct tP = db.TProducts.Where(w => w.M衛材編號 == delOrder.M衛材編號).First();

                    if (delOrder.M到貨日期 != null)
                    {
                        tP.M庫存數量 = tP.M庫存數量 - delOrder.M訂購數量;
                    }
                    db.TOrders.Remove(delOrder);

                    db.SaveChanges();
                }
            }
            return RedirectToAction("List");

        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TOrder x = db.TOrders.Include(x => x.EIdNavigation).Include(a => a.M衛材編號Navigation).FirstOrDefault(t => t.M進貨編號 == id);
                if (x != null)
                {
                    COrderViewModel vm = new COrderViewModel();
                    IEnumerable<TEmployee> te = db.TEmployees;
                    IEnumerable<TProduct> tp = db.TProducts;

                    vm.EIdNavigation = te;
                    vm.M衛材編號Navigation = tp;
                    vm.Order = x;
                    return View(vm);  //return找到的資料
                }
            }
            return RedirectToAction("List");
        }
        [HttpPost]
        public IActionResult Edit(COrderViewModel vm) //如果設定之後的日期會無法更新
        {
            if (vm.M進貨編號 != null)
            {
                if (!ModelState.IsValid)
                {
                    return View(vm);
                }
                TOrder x = db.TOrders.FirstOrDefault(t => t.M進貨編號 == vm.M進貨編號);
                TProduct tP = db.TProducts.FirstOrDefault(w => w.M衛材編號 == vm.M衛材編號);
                if (x != null)
                {
                    x.M進貨編號 = vm.M進貨編號;
                    //p.M庫存數量 = tP.M庫存數量;
                    x.M庫存數量 = tP.M庫存數量;  //產品庫存數
                    x.EId = vm.EId;
                    x.M衛材編號 = vm.M衛材編號;
                    //x.M訂購數量 = p.M訂購數量;  //現在=不能分辨訂購數量是否有更改
                    x.M價錢 = vm.M價錢;
                    x.M小計 = vm.M小計;
                    x.M訂購日期 = vm.M訂購日期;

                    //x.M到貨日期 = vm.M到貨日期;   //現在=不能分辨訂購數量是否有更改
                    x.M訂購狀態 = vm.M訂購狀態;

                    // x 原本/存入  p 新的參數  tp TProduct 資料表
                    if (vm.M到貨日期 != null)
                    {
                        int result = DateTime.Compare((DateTime)vm.M到貨日期, DateTime.Now);
                        int Xresult = 1;  //沒改
                        if (x.M到貨日期 != null)
                        {
                            Xresult = DateTime.Compare((DateTime)x.M到貨日期, DateTime.Now);  //新的到貨日期
                        }
                        if (result <= 0)
                        {
                            x.M訂購狀態 = false;
                        }


                        if (vm.M訂購數量 != x.M訂購數量 && result <= 0)  //修改數量&&到貨日期超過現在
                        {
                            x.M庫存數量 = x.M庫存數量 - x.M訂購數量 + vm.M訂購數量;
                            tP.M庫存數量 = tP.M庫存數量 - x.M訂購數量 + vm.M訂購數量;
                            x.M訂購數量 = vm.M訂購數量;
                            x.M到貨日期 = vm.M到貨日期;
                        }
                        else if (vm.M到貨日期 != x.M到貨日期 && result <= 0 && Xresult <= 0)  //已到貨日又期修改
                        {
                            x.M訂購數量 = vm.M訂購數量;
                            x.M到貨日期 = vm.M到貨日期;

                        }

                        else if (vm.M訂購數量 == x.M訂購數量 && result <= 0 && Xresult == 1)  //沒修改數量&&到貨日期超過現在&&到貨日期沒改  //&& vm.M到貨日期 == x.M到貨日期
                        {
                            x.M庫存數量 = x.M庫存數量 + vm.M訂購數量;
                            tP.M庫存數量 = tP.M庫存數量 + vm.M訂購數量;
                            x.M訂購數量 = vm.M訂購數量;
                            x.M到貨日期 = vm.M到貨日期;
                            tP.M訂購狀態 = false;

                        }

                        else
                        {
                            x.M訂購數量 = vm.M訂購數量;
                            x.M到貨日期 = vm.M到貨日期;
                        }
                        db.SaveChanges();
                    }
                }
            }
            return RedirectToAction("List");
        }
    }
}
