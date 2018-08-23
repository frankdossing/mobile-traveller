namespace Cheertravel.Mobile.Interfaces {
    public interface IEmailService {
        bool SendEmail(string email, string subject, string body);
    }
}