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
            _securityManager = securityManager;
            _unitOfWork = uow;
        }

        [BindProperty]
        public Data.Traveller LosTraveller  {get;set;}
        public void OnGet()
        {
        }
    }
}