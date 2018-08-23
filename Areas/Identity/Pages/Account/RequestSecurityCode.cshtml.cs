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
using Cheertravel.Mobile.Data;
using Cheertravel.Mobile.Interfaces;

namespace Cheertravel.Mobile.Areas.Identity.Pages.Account
{
    [AllowAnonymous]
    public class RequestSecurityCodeModel : PageModel
    {
        private readonly ILogger<RegisterModel> _logger;
        private readonly ISecurityManager _cheerTravelSecurityManager;

        public RequestSecurityCodeModel(
            ILogger<RegisterModel> logger,
            IEmailSender emailSender, ISecurityManager securityManager)
        {
            _logger = logger;
            _cheerTravelSecurityManager = securityManager;
        }

        [BindProperty]
        public InputModel Input { get; set; }

        public string Status {get;set;}
        public string ReturnUrl { get; set; }
        public string Message {get;set;}

        public class InputModel
        {
            [Required]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }

            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 2)]
            [DataType(DataType.Password)]
            [Display(Name = "Firstname")]
            public string Firstname {get;set;}
 
        }
        public void OnGet(string returlUrl) {
            ReturnUrl = returlUrl;
            Status = "new";
        }
        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            returnUrl = returnUrl ?? Url.Content("~/Register");
            //-- Call the security-manager-email send, to actually send an email to the user with the requested security code
            if(ModelState.IsValid) {
                 var result = await _cheerTravelSecurityManager.EmailSecurityCodeToNewUser(Input.Email, Input.Firstname);
                 if(result) {
                   Status = "ok";
                 } else {
                     Status = "nomatch";
                 }
                return Page();
             }
            return Page();
        }
    }
}