using System;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections;
using CheerTravel.Mobile.Web.Interfaces;
using System.Linq;
using Microsoft.Extensions.Configuration;

namespace CheerTravel.Mobile.Web.Data {
public class TravellerRepository : BaseRepository, ITravellerRepository {
    public TravellerRepository(IConfiguration configuration):base(configuration) {
    }
    public Traveller GetById(int id){
        //Fetch the traveller by id. If none return NULL
        using(IDbConnection dbConnection = this.Connection) {
        string sql = "SELECT * FROM mobile_vTravellers WHERE TUID = @Id";
        dbConnection.Open();
        return dbConnection.Query<Traveller,Group,Traveller>(sql,
            (traveller, group) =>
            {
                traveller.Group = group;
                return traveller;
            },new { Id = id },splitOn: "FK_GroupId").FirstOrDefault();
        }
    }

    public ICollection<Traveller> GetByEmail(string email) {
        using(IDbConnection dbConnection = this.Connection) {
        string sql = "SELECT * FROM mobile_vTravellers WHERE Email = @email";
        dbConnection.Open();
        return dbConnection.Query<Traveller,Group,Traveller>(sql,
            (traveller, group) =>
            {
                traveller.Group = group;
                return traveller;
            },new { Email = email },splitOn: "FK_GroupId").ToList();
        }
 
    }
}
}