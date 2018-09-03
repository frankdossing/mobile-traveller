using System;
using System.Collections;
using CheerTravel.Mobile.Web.Data;

namespace CheerTravel.Mobile.Web.Interfaces {
    public interface IAccountRepository {
        int? GetTravellerId(string email, string securityCode);
        LoginTraveller FindByEmailAndSecurityCode(string email, string securityCode);
        LoginTraveller FindByIdAndFK(string id, int foreignTravellerKey);
        LoginTraveller Find(string userId);
        LoginTraveller FindByFK(int FK);
        void Add(LoginTraveller entity);
        void SaveChanges();
        
    }
}