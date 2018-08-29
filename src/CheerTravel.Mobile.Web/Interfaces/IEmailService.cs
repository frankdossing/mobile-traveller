namespace CheerTravel.Mobile.Web.Interfaces {
    public interface IEmailService {
        bool SendEmail(string email, string subject, string body);
    }
}