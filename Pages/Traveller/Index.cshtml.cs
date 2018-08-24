using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Cheertravel.Mobile.Data;
using Microsoft.EntityFrameworkCore;
using Cheertravel.Mobile.Interfaces;


namespace Cheertravel.Mobile.Pages.Traveller {
    public class IndexModel : PageModel
    {
        private readonly ISecurityManager _securityManager;
        private readonly ITravellerRepository _travellerRepository;

        public IndexModel(ISecurityManager securityManager, ITravellerRepository travellerRep) {
            _securityManager = securityManager;
            _travellerRepository = travellerRep;
        }

        public Data.Traveller LosPageModel {get;set;}
        public void OnGet()
        {
            int userId = _securityManager.GetLoggedOnTravellerId(User.Identity.Name);
            LosPageModel = _travellerRepository.GetById(userId);
        }
   }
}