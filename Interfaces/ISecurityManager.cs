using System.Threading.Tasks;

namespace Cheertravel.Mobile.Interfaces {
    public interface ISecurityManager {
        int? GetTravellerId(string email, string securityCode);
        bool CreateLoginTraveller(string internalId, int foreignTravellerKey); 

        int GetLoggedOnTravellerId(string userId);

        Task<bool> EmailSecurityCodeToNewUser(string email,string firstname);
    }
}