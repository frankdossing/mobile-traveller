using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace CheerTravel.Mobile.Web.Data {
    public class LoginTraveller {
        public int ForeignTravellerKey { get;set;}
        [Key]
        public string Id {get;set;}
        public DateTime CreatedDateTime {get;set;}
        public string SecurityToken {get;set;}
        public DateTime SecurityTokenExpires {get;set;}
    }
}