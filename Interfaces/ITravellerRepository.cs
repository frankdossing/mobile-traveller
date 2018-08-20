using Cheertravel.Mobile.Data;

namespace Cheertravel.Mobile.Interfaces {
    public interface ITravellerRepository {
        Traveller GetById(int id);
    }
}