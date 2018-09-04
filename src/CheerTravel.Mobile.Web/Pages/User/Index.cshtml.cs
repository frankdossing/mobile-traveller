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
        private IDapperUnitOfWork _unitOfWork;
        public IndexModel(ISecurityManager securityManager,IDapperUnitOfWork uow) {
            try {
            _securityManager = securityManager;
            _unitOfWork = uow;
            }
            catch(Exception ex) {
                //silent catch error
            }
        }

        [BindProperty]
        public Traveller LosTraveller  {get;set;}
        public void OnGet()
        {
            try {
            //-- get the current logged on travel-userId
            int userId = _securityManager.GetLoggedOnTravellerId(User.Identity.Name);
            Traveller t = _unitOfWork.TravellerRepository.Find(userId);
            if(t == null)  {
                LosTraveller = new Traveller() { Firstname = "No user found"};
            }
            LosTraveller = t;

            }
            catch(Exception ex) {
                LosTraveller = new Traveller() { Firstname = ex.Message};
            }
        }
    }
}