using System;



namespace CheerTravel.Mobile.Web.Interfaces 
{

    public interface IDapperUnitOfWork : IDisposable
    {
        ITravellerRepository TravellerRepository { get; }
        void Commit();
    }
}