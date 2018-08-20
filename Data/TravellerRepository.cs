using System;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections;
using Cheertravel.Mobile.Interfaces;
using System.Linq;

namespace Cheertravel.Mobile.Data {
public class TravellerRepository : BaseRepository, ITravellerRepository {
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
}
}