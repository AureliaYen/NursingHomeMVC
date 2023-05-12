using NursingHouse_v3.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace NursingHouse_v3.ViewModel
{
    public class CTakeViewModel
    {
        public TTake _take;
        public TTake Take 
        {
            get { return _take; }
            set { _take = value; }
        }
        public CTakeViewModel() 
        {
            _take =  new TTake();
        }
        public int M領取編號
        {
            get { return _take.M領取編號; }
            set { _take.M領取編號 = value; }
        }
        public int? EId
        {
            get { return _take.EId; }
            set { _take.EId = value; }
        }
        public int? M衛材編號
        {
            get { return _take.M衛材編號; }
            set { _take.M衛材編號 = value; }
        }
		[Display(Name = "領取數量")]

		public int? M領取數量
        {
            get { return _take.M領取數量; }
            set { _take.M領取數量 = value; }
        }
        public DateTime? M領取時間
        {
            get { return _take.M領取時間; }
            set { _take.M領取時間 = value; }
        }
		[Display(Name = "用途")]

		public string? M用途
        {
            get { return _take.M用途; }
            set { _take.M用途 = value; }
        }
        public int? M庫存數量
        {
            get { return _take.M庫存數量; }
            set { _take.M庫存數量 = value; }
        }

        public IEnumerable<TEmployee>? EIdNavigation { get; set; }
        public IEnumerable<TProduct>? M衛材編號Navigation { get; set; }

    }
}
