using System.Collections.Generic;
using Cheertravel.Mobile.Data;

namespace Cheertravel.Mobile.Interfaces {
    public interface ITravellerRepository {
        Traveller GetById(int id);
        ICollection<Traveller> GetByEmail(string email);
    }
}