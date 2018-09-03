using CheerTravel.Mobile.Web.Interfaces;
using System;
using System.Data;
using System.Data.SqlClient;


namespace CheerTravel.Mobile.Web.Data 
{
    public class DapperUnitOfWork : IDapperUnitOfWork
    {

        private IDbConnection _connection;

        private IDbTransaction _transaction;

        private ITravellerRepository _travellerRepository;

        private bool _disposed;


        public DapperUnitOfWork(string connectionString)
        {
            _connection = new SqlConnection(connectionString);
            _connection.Open();
            _transaction = _connection.BeginTransaction();
        }

        public ITravellerRepository TravellerRepository
        {
            get { return _travellerRepository ?? (_travellerRepository = new TravellerRepository(_transaction)); }
        }

        public void Commit()
        {
            try
            {
                _transaction.Commit();
            }

            catch
            {
                _transaction.Rollback();
                throw;
            }

            finally
            {
                _transaction.Dispose();
                _transaction = _connection.BeginTransaction();
                resetRepositories();
            }
        }

        private void resetRepositories()
        {
            _travellerRepository = null;
        }

        public void Dispose()
        {
            dispose(true);
            GC.SuppressFinalize(this);
        }

        private void dispose(bool disposing)
        {
            if (!_disposed)
            {
                if(disposing)
                {
                    if (_transaction != null)
                    {
                        _transaction.Dispose();
                        _transaction = null;
                    }
                    if(_connection != null)
                    {
                        _connection.Dispose();
                        _connection = null;
                    }
                }
                _disposed = true;
            }
        }

        ~DapperUnitOfWork()
        {
            dispose(false);
        }
    }
}