using System;
using System.Linq;
using Cheertravel.Mobile.Interfaces;

namespace Cheertravel.Mobile.Data {
public class SecurityManager:ISecurityManager {
    private ApplicationDbContext _dbContext;
    public SecurityManager(ApplicationDbContext dbContext) {
        _dbContext = dbContext;
    }
    public int? GetTravellerId(string email, string token) {
        return 100;
    }

    public bool CreateLoginTraveller(string internalId, int foreignTravellerKey) {
        _dbContext.LoginTravellers.Add(new LoginTraveller() { ForeignTravellerKey = foreignTravellerKey, Id = internalId, CreatedDateTime = DateTime.Now});
        _dbContext.SaveChanges();
        return true;
    }

    public int GetLoggedOnTravellerId(string userId) {
            LoginTraveller login = _dbContext.LoginTravellers.Where( x => x.Id == userId).FirstOrDefault();
            return login.ForeignTravellerKey;
        }
    }
}