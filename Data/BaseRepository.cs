using System;
using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace Cheertravel.Mobile.Data {

public class BaseRepository {
    private string connectionString = "Server=(localdb)\\MSSQLLocalDb;Database=Cheer_db;integrated security=true";
    public IDbConnection Connection {
        get {
            return new SqlConnection(connectionString);
        }
    }


}
}