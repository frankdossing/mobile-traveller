using Cheertravel.Mobile.Interfaces;

namespace Cheertravel.Mobile.Data {
    public class EmailService : IEmailService {
        public bool SendEmail(string email, string subject, string body) {
            //-- send the email
            return true;
        }
    }
}