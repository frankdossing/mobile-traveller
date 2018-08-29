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
        private ITravellerRepository _dbContext;
        private ISecurityManager _securityManager;
        public IndexModel(ITravellerRepository dbContext, ISecurityManager securityManager) {
            _dbContext = dbContext;
            _securityManager = securityManager;
        }

        [BindProperty]
        public Data.Traveller LosTraveller {get;set;}
        public void OnGet()
        {
            //-- get the current logged on travel-userId
            int userId = _securityManager.GetLoggedOnTravellerId(User.Identity.Name);
            LosTraveller = _dbContext.GetById(userId);
        }
    }
}