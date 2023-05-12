using MimeKit;
using NursingHouseService.ViewModels;
using MimeKit;
using MailKit.Net.Smtp;

namespace NursingHouseService.Models
{
    public class CSqlFactory
    {
        private readonly fpdb2Context _context;

        public CSqlFactory(fpdb2Context fpdb2)
        {
            _context = fpdb2;
        }

        public List<CAppListViewModel> searchGoOutForDay(string day)
        {
            DateTime dt = DateTime.Parse(day);
            var temp = (from tA in _context.TApplicationForm
                        join tP in _context.TPatientInfo
                           on tA.PId equals tP.PId
                        where tA.App出發時間 >= dt && tA.App出發時間 <= DateTime.Now && tA.App結案.Contains("0")
                        select new CAppListViewModel
                        {
                            appId = tA.AppId,
                            paId = tA.PId,
                            p姓名 = tP.P姓名,
                            app陪同人員 = tA.App陪同人員,
                            app聯絡方式 = tA.App聯絡方式,
                            app外出日期 = (DateTime)tA.App外出日期,
                            app事由 = tA.App事由,
                            app地點 = tA.App地點,
                            app出發時間 = tA.App出發時間,
                            app預計外出時間 = tA.App預計外出時間
                        }).ToList();

            return temp;
        }

        public List<CAppListViewModel> searchGoOutForName(string name, string day)
        {
            DateTime dt = DateTime.Parse(day);

            var temp = (from tA in _context.TApplicationForm
                        join tP in _context.TPatientInfo
                           on tA.PId equals tP.PId
                        where tA.App出發時間 >= dt && tA.App出發時間 <= DateTime.Now && tA.App結案.Contains("0") && tP.P姓名 == name
                        select new CAppListViewModel
                        {
                            appId = tA.AppId,
                            paId = tA.PId,
                            p姓名 = tP.P姓名,
                            app陪同人員 = tA.App陪同人員,
                            app聯絡方式 = tA.App聯絡方式,
                            app外出日期 = (DateTime)tA.App外出日期,
                            app事由 = tA.App事由,
                            app地點 = tA.App地點,
                            app出發時間 = tA.App出發時間,
                            app預計外出時間 = tA.App預計外出時間
                        }).ToList();

            return temp;
        }

        public List<CStayViewModel> searchInsideForDay(string day)
        {
            DateTime dt = DateTime.Parse(day);

            var All = (from tP in _context.TPatientInfo
                       join tE in _context.TEmployee
                         on tP.EId equals tE.EId
                       join tB in _context.TBed
                         on tP.PId equals tB.PId
                       select new
                       {
                           pId = tP.PId,
                           p姓名 = tP.P姓名,
                           e員工姓名 = tE.E員工姓名,
                           rb床號 = (
                                       from tRB in _context.TRoombed
                                       where tRB.RbId == tB.RbId
                                       select tRB.Rb床號
                                      ).FirstOrDefault(),
                       });

            var outSide = (from tAp in _context.TApplicationForm
                           join tP in _context.TPatientInfo
                           on tAp.PId equals tP.PId
                           join tE in _context.TEmployee
                           on tP.EId equals tE.EId
                           join tB in _context.TBed
                           on tP.PId equals tB.PId
                           where tAp.App出發時間 >= dt && tAp.App出發時間 <= DateTime.Now && tAp.App結案 == "0"
                           select new
                           {
                               pId = tP.PId,
                               p姓名 = tP.P姓名,
                               e員工姓名 = tE.E員工姓名,
                               rb床號 = (
                                         from tRB in _context.TRoombed
                                         where tRB.RbId == tB.RbId
                                         select tRB.Rb床號
                                        ).FirstOrDefault(),
                           });

            List<CStayViewModel> lcs = new List<CStayViewModel>();
            var ans = All.Except(outSide);        
            foreach (var item in ans)
            {
                CStayViewModel cs = new CStayViewModel();
                cs.pId = item.pId;
                cs.p姓名 = item.p姓名;
                cs.e員工姓名 = item.e員工姓名;
                cs.b床號 = item.rb床號;
                lcs.Add(cs);
            }
            return lcs;
        }

        public List<CStayViewModel> searchInsideForName(string name, string day)
        {
            List<CStayViewModel> lcs = new List<CStayViewModel>();
            List<CStayViewModel> lcsReturn = new List<CStayViewModel>();
            lcs = searchInsideForDay(day);
            foreach (var item in lcs)
            {
                if (item.p姓名 == name)
                {
                    CStayViewModel cs = new CStayViewModel();
                    cs.pId = item.pId;
                    cs.p姓名 = item.p姓名;
                    cs.e員工姓名 = item.e員工姓名;
                    cs.b床號 = item.b床號;
                    lcsReturn.Add(cs);
                }
            }
            return lcsReturn;
        }

        public int searchPId(string searchKeyword)
        {
            TPatientInfo tp = _context.TPatientInfo.FirstOrDefault(p => p.P姓名 == searchKeyword);
            int id = tp.PId;
            return id;
        }

        public int searchEId(string searchKeyword)
        {
            //TPatientInfo tp = _context.TPatientInfo.FirstOrDefault(p => p.P姓名 == searchKeyword);
            var ans = _context.TPatientInfo.FirstOrDefault(p => p.P姓名 == searchKeyword).EId;
            int? id = ans;

            //int id = (int)tp.EId;
            return (int)id;
        }

        public int searchFamId(int id)
        {
            TFamilyMembers tf = _context.TFamilyMembers.FirstOrDefault(f => f.PId == id);
            int fId = tf.FamId;
            return fId;
        }

        public CCalendarViewModel searchCalendarAll(string selectDay)
        {
            DateTime dt = DateTime.Parse(selectDay);
            DateTime dt2 = dt.AddDays(1);

            CCalendarViewModel sqlTempData = new CCalendarViewModel();
            var data = _context.TApplicationForm.Join(_context.TPatientInfo,
                tA => tA.PId,
                tP => tP.PId,
                (tA, tP) => new
                {
                    Name = tP.P姓名,
                    appId = tA.AppId,
                    pid = tA.PId,
                    eid = tA.EId,
                    day = tA.App外出日期,
                    reason = tA.App事由
                }).Where(d => d.day >= dt && d.day < dt2);
            foreach (var d in data)
            {
                CCalendarDataViewModel cData = new CCalendarDataViewModel();
                cData.Name = d.Name;
                cData.appId = d.appId;
                cData.pid = d.pid;
                cData.eid = d.eid;
                cData.外出日期 = d.day;
                cData.reason = d.reason;
                sqlTempData.SqlData.Add(cData);
            }

            return (sqlTempData);
        }


        public string SendEmail(EmailUse emailAddress)
        {

            int tempInt = Convert.ToInt32(emailAddress.memberId);
            string mailData = _context.TMember.FirstOrDefault(p => p.MId == tempInt).MEmail;

            string host = "smtp.gmail.com"; // 送信郵件主機
            int port = 587; // 送信郵件主機連接埠
            string account = "0821tomcat@gmail.com"; // 帳號
            string password = "joeiexrhohojreoe"; // 密碼

            string mailServerName = "Server"; // 寄信者名稱  => 網站名稱??
            string mailServerAddress = "0821tomcat@gmail.com"; // 寄送者信箱
                                                               //string targetAddress = "0821tomcat@gmail.com"; // 目標信箱
            string targetAddress = mailData;
            string subject = "繳費通知測試"; // 信件主旨  string body = "這是一封測試信件"; // 信件內容

            MimeMessage message = new();
            message.From.Add(new MailboxAddress(mailServerName, mailServerAddress));
            message.To.Add(MailboxAddress.Parse(targetAddress));
            message.Subject = subject;
            message.Body = new TextPart("html")
            {
                Text = "測試信件"
            };

            using SmtpClient client = new();
            client.Connect(host, port, false);
            client.Authenticate(account, password);
            client.Send(message);
            client.Disconnect(true);
            return "OK";
        }


		public string OrderIdUseSendEmail(int orderId)
		{
            int data = _context.TActivityOrder.FirstOrDefault(p => p.AoId == orderId).Ao會員Id;
			
			string mailData = _context.TMember.FirstOrDefault(p => p.MId == data).MEmail;

			string host = "smtp.gmail.com"; // 送信郵件主機
			int port = 587; // 送信郵件主機連接埠
			string account = "0821tomcat@gmail.com"; // 帳號
			string password = "joeiexrhohojreoe"; // 密碼

			string mailServerName = "Server"; // 寄信者名稱  => 網站名稱??
			string mailServerAddress = "0821tomcat@gmail.com"; // 寄送者信箱
															   //string targetAddress = "0821tomcat@gmail.com"; // 目標信箱
			string targetAddress = mailData;
			string subject = "繳費通知測試"; // 信件主旨  string body = "這是一封測試信件"; // 信件內容

			MimeMessage message = new();
			message.From.Add(new MailboxAddress(mailServerName, mailServerAddress));
			message.To.Add(MailboxAddress.Parse(targetAddress));
			message.Subject = subject;
			message.Body = new TextPart("html")
			{
				Text = "測試信件"
			};

			using SmtpClient client = new();
			client.Connect(host, port, false);
			client.Authenticate(account, password);
			client.Send(message);
			client.Disconnect(true);
			return "OK";
		}
	}
}
