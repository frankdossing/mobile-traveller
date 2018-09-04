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
using Microsoft.Extensions.Logging;

namespace CheerTravel.Mobile.Web.Pages.Traveller {
    public class IndexModel : PageModel
    {
        private readonly ISecurityManager _securityManager;
        private readonly IDapperUnitOfWork _dapperUnitOfWork;
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ISecurityManager securityManager, IDapperUnitOfWork travellerRep, ILogger<IndexModel> logger) {
            _securityManager = securityManager;
            _dapperUnitOfWork = travellerRep;
            _logger = logger;
        }

        [BindProperty]
        public Data.Traveller LosPageModel {get;set;}

        public void OnGet()
        {
            int userId = _securityManager.GetLoggedOnTravellerId(User.Identity.Name);
            LosPageModel  =  _dapperUnitOfWork.TravellerRepository.Find(userId);
        }
   }
}