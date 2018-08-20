using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Cheertravel.Mobile.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder) {
            base.OnModelCreating(builder);

            foreach(var entity in builder.Model.GetEntityTypes()) {
                entity.Relational().TableName = "mobile_" + entity.Relational().TableName;
            }            
        }
        public DbSet<LoginTraveller> LoginTravellers {get;set;}
        //public DbSet<Traveller> Travellers {get;set;}

    }
}
