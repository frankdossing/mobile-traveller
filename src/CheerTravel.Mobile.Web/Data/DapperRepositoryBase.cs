using System.Data;



namespace CheerTravel.Mobile.Web.Data 
{
    internal abstract class DapperRepositoryBase
    {
        protected IDbTransaction Transaction { get; private set; }
        protected IDbConnection Connection { get { return Transaction.Connection; } }

        public DapperRepositoryBase(IDbTransaction transaction)
        {
            Transaction = transaction;
        }
    }
}