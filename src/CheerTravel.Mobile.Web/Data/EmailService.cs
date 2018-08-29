using CheerTravel.Mobile.Web.Interfaces;

namespace CheerTravel.Mobile.Web.Data {
    public class EmailService : IEmailService {
        public bool SendEmail(string email, string subject, string body) {
            //-- send the email
            return true;
        }
    }
}