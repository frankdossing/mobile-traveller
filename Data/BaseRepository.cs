using System;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace Cheertravel.Mobile.Data {

public class BaseRepository {

    private readonly IConfiguration _configuration;
    public BaseRepository(IConfiguration configuration) {
        _configuration = configuration;
    }
    public IDbConnection Connection {
        get {
            return new SqlConnection(_configuration.GetConnectionString("SqlDefaultConnection"));
        }
    }
}
}