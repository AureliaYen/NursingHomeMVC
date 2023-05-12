using NursingHouse_v3.Models;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Xml.Linq;

namespace NursingHouse_v3.ViewModel
{
    public class COrderViewModel
    {
        private TOrder _order;

        public TOrder Order
        {
            get { return _order; }
            set { _order = value; }
        }
        public COrderViewModel ()
        {
            _order = new TOrder();
        }
        public int M進貨編號
        {
            get { return _order.M進貨編號; }
            set { _order.M進貨編號 = value; }
        }
        public int? EId
        {
            get { return _order.EId; }
            set { _order.EId = value; }
        }
        public int? M衛材編號
        {
            get { return _order.M衛材編號; }
            set { _order.M衛材編號 = value; }
        }
		[Display(Name = "訂購數量")]

		public int? M訂購數量
        {
            get { return _order.M訂購數量; }
            set { _order.M訂購數量 = value; }
        }
        public decimal? M價錢
        {
            get { return _order.M價錢; }
            set { _order.M價錢 = value; }
        }
        public decimal? M小計
        {
            get { return _order.M小計; }
            set { _order.M小計 = value; }
        }
		[Display(Name = "訂購日期")]

		public DateTime? M訂購日期
        {
            get { return _order.M訂購日期; }
            set { _order.M訂購日期 = value; }
        }

		[Display(Name = "到貨日期")]

		public DateTime? M到貨日期
        {
            get { return _order.M到貨日期; }
            set { _order.M到貨日期 = value; }
        }
        public int? M庫存數量
        {
            get { return _order.M庫存數量; }
            set { _order.M庫存數量 = value; }
        }
        public bool? M訂購狀態
        {
            get { return _order.M訂購狀態; }
            set { _order.M訂購狀態 = value; }
        }


        public IEnumerable<TEmployee>? EIdNavigation { get; set; }
        public IEnumerable<TProduct>? M衛材編號Navigation { get; set; }
    }
}
