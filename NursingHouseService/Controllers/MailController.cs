using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MimeKit;
using MailKit.Net.Smtp;
using NursingHouseService.Models;
using NursingHouseService.ViewModels;

namespace NursingHouseService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class MailController : ControllerBase
    {
        private readonly fpdb2Context _context;
        private readonly IWebHostEnvironment _web;

        public MailController(fpdb2Context fpdb2, IWebHostEnvironment web)
        {
            _context = fpdb2;
            _web = web;
        }

        [HttpPost]
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
            string subject = "測試信件"; // 信件主旨  string body = "這是一封測試信件"; // 信件內容

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
