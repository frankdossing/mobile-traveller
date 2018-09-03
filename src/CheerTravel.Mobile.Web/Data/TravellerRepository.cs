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
internal class TravellerRepository : DapperRepositoryBase, ITravellerRepository {

    public TravellerRepository(IDbTransaction transaction):base(transaction) {}

    public Traveller Find(int id){
        //Fetch the traveller by id. If none return NULL
        string sql = "SELECT * FROM mobile_vTravellers WHERE TUID = @Id";
        return Connection.Query<Traveller,Group,Traveller>(sql,
            (traveller, group) =>
            {
                traveller.Group = group;
                return traveller;
            },new { Id = id },
            splitOn: "FK_GroupId", transaction: Transaction).FirstOrDefault();
    }

    public ICollection<Traveller> GetByEmail(string email) {
        string sql = "SELECT * FROM mobile_vTravellers WHERE Email = @email";
        return Connection.Query<Traveller,Group,Traveller>(sql,
            (traveller, group) =>
            {
                traveller.Group = group;
                return traveller;
            },new { Email = email },splitOn: "FK_GroupId", transaction: Transaction).ToList();
        }
 
    }
}