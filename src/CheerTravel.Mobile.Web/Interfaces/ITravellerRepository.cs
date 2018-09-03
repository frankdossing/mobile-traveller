using System.Collections.Generic;
using CheerTravel.Mobile.Web.Data;

namespace CheerTravel.Mobile.Web.Interfaces {
    public interface ITravellerRepository {
        Traveller Find(int id);
        ICollection<Traveller> GetByEmail(string email);
    }
}