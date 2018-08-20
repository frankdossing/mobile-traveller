namespace Cheertravel.Mobile.Interfaces {
    public interface ISecurityManager {
        int? GetTravellerId(string email, string token);
        bool CreateLoginTraveller(string internalId, int foreignTravellerKey); 

        int GetLoggedOnTravellerId(string userId);
    }
}