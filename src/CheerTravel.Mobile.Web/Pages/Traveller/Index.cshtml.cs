using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CheerTravel.Mobile.Web.Data;
using Microsoft.EntityFrameworkCore;
using CheerTravel.Mobile.Web.Interfaces;
using CheerTravel.Mobile.Web.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CheerTravel.Mobile.Web.Pages.Traveller {
    public class IndexModel : PageModel
    {
        private readonly ISecurityManager _securityManager;
        private readonly IDapperUnitOfWork _dapperUnitOfWork;

        public IndexModel(ISecurityManager securityManager, IDapperUnitOfWork travellerRep) {
            _securityManager = securityManager;
            _dapperUnitOfWork = travellerRep;
        }

        public Data.Traveller LosPageModel {get;set;}

        public void OnGet()
        {
            int userId = _securityManager.GetLoggedOnTravellerId(User.Identity.Name);
            LosPageModel = _dapperUnitOfWork.TravellerRepository.Find(userId);
        }
   }
}