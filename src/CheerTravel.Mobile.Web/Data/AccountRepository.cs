using System.Collections.Generic;
using System.Linq;
using CheerTravel.Mobile.Web.Interfaces;
using System;

namespace CheerTravel.Mobile.Web.Data {
public class AccountRepository : IAccountRepository {

    private ApplicationDbContext _dbContext;
    public AccountRepository(ApplicationDbContext dbContext) {
        _dbContext = dbContext;
    }

    public int? GetTravellerId(string email, string securityCode) {
        LoginTraveller lt = _dbContext.LoginTravellers.Where( x => x.Id == email && x.SecurityToken == securityCode && x.SecurityTokenExpires > DateTime.Now.ToUniversalTime()).FirstOrDefault();
        if(lt != null) 
            return lt.ForeignTravellerKey;
        return null; 
    }

    public LoginTraveller FindByEmailAndSecurityCode(string email, string securityCode) {
        return _dbContext.LoginTravellers.Where( x => x.Id == email && x.SecurityToken == securityCode && x.SecurityTokenExpires > DateTime.Now.ToUniversalTime()).FirstOrDefault();
    }

    public LoginTraveller FindByIdAndFK(string id, int foreignTravellerKey) {
        return _dbContext.LoginTravellers.Where( x => x.Id == id && x.ForeignTravellerKey == foreignTravellerKey).FirstOrDefault();
    }

    public LoginTraveller Find(string id) {
        return _dbContext.LoginTravellers.Find(id);
    }

    public LoginTraveller FindByFK(int fk) {
        return _dbContext.LoginTravellers.Where( x => x.ForeignTravellerKey == fk).FirstOrDefault();
    }

    public void Add(LoginTraveller entity) {
        _dbContext.LoginTravellers.Add(entity);
    }

    public void SaveChanges() {
        _dbContext.SaveChanges();
    }
}

}