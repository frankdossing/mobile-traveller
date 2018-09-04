using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using CheerTravel.Mobile.Web.Data;
using Microsoft.EntityFrameworkCore;
using CheerTravel.Mobile.Web.Interfaces;

namespace CheerTravel.Mobile.Web.Pages.User {
    public class IndexModel : PageModel
    {
        private ISecurityManager _securityManager;
        public IndexModel(ISecurityManager securityManager) {
            _securityManager = securityManager;
        }

        [BindProperty]
        public string UserName {get;set;}
        public void OnGet()
        {
            //-- get the current logged on travel-userId
            UserName = User.Identity.Name;
        }
    }
}