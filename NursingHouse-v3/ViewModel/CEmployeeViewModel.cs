using NursingHouse_v3.Models;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace NursingHouse_v3.ViewModel
{
	public class CEmployeeViewModel
	{
		private TEmployee _employee;
		public TEmployee employee
		{
			get { return _employee; }
			set { _employee = value; }
		}

		public CEmployeeViewModel()
		{
			_employee = new TEmployee();
		}

		public int EId
		{
			get { return _employee.EId; }
			set { _employee.EId = value; }
		}

		public string? E員工編號
		{
			get { return _employee.E員工編號; }
			set { _employee.E員工編號 = value; }
		}

		public string? E員工姓名
		{
			get { return _employee.E員工姓名; }
			set { _employee.E員工姓名 = value; }
		}

		public string? E電話
		{
			get { return _employee.E電話; }
			set { _employee.E電話 = value; }
		}

		public string? EEmail
		{
			get { return _employee.EEmail; }
			set { _employee.EEmail = value; }
		}

		public string? E地址
		{
			get { return _employee.E地址; }
			set { _employee.E地址 = value; }
		}

		public string? E密碼
		{
			get { return _employee.E密碼; }
			set { _employee.E密碼 = value; }
		}

		public string? E性別
		{
			get { return _employee.E性別; }
			set { _employee.E性別 = value; }
		}

		public string? E身分證號
		{
			get { return _employee.E身分證號; }
			set { _employee.E身分證號 = value; }
		}

		public string? E職稱
		{
			get { return _employee.E職稱; }
			set { _employee.E職稱 = value; }
		}

		public DateTime? E到職日期
		{
			get { return _employee.E到職日期; }
			set { _employee.E到職日期 = value; }
		}

		public DateTime? E離職日期
		{
			get { return _employee.E離職日期; }
			set { _employee.E離職日期 = value; }
		}

		public int? E權限
		{
			get { return _employee.E權限; }
			set { _employee.E權限 = value; }
		}

		public DateTime? E建立日期
		{
			get { return _employee.E建立日期; }
			set { _employee.E建立日期 = value; }
		}

		public string? E建立者工號
		{
			get { return _employee.E建立者工號; }
			set { _employee.E建立者工號 = value; }
		}

		public DateTime? E修改日期
		{
			get { return _employee.E修改日期; }
			set { _employee.E修改日期 = value; }
		}

		public string? E修改者工號
		{
			get { return _employee.E修改者工號; }
			set { _employee.E修改者工號 = value; }
		}

		public DateTime? E員工生日
		{
			get { return _employee.E員工生日; }
			set { _employee.E員工生日 = value; }
		}

		public string? EImagePath
		{
			get { return _employee.EImagePath; }
			set { _employee.EImagePath = value; }
		}

		public IFormFile photo { get; set; }
	}
}
