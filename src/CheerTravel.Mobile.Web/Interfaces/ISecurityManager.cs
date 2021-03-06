using System.Threading.Tasks;

namespace CheerTravel.Mobile.Web.Interfaces {
    public interface ISecurityManager {
        int? GetTravellerId(string email, string securityCode);
        bool CreateLoginTraveller(string internalId, int foreignTravellerKey); 

        int GetLoggedOnTravellerId(string userId);

        Task<bool> EmailSecurityCodeToNewUserAsync(string email,string firstname, string returnUrl);
    }
}