using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CheerTravel.Mobile.Web.Interfaces;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Logging;

namespace CheerTravel.Mobile.Web.Data {
public class SecurityManager:ISecurityManager {
    private readonly IAccountRepository _accountRepository;
    //private readonly ITravellerRepository _travellerRepository;
    private readonly IDapperUnitOfWork _dapperUnitOfWork;
    private readonly IEmailSender _emailService;
    private readonly ILogger<SecurityManager> _logger;
    public SecurityManager(IAccountRepository accountRepository,IEmailSender eService, IDapperUnitOfWork dapperUnitOfWork, ILogger<SecurityManager> logger) {
        _accountRepository= accountRepository;
        _emailService = eService;
        _dapperUnitOfWork = dapperUnitOfWork;
        _logger = logger;
    }
    public int? GetTravellerId(string email, string securityCode) {
        //LoginTraveller lt = _accountRepository.GetTravellers.Where( x => x.Id == email && x.SecurityToken == securityCode && x.SecurityTokenExpires > DateTime.Now.ToUniversalTime()).FirstOrDefault();
        LoginTraveller lt = _accountRepository.FindByEmailAndSecurityCode(email, securityCode);
        if(lt != null) 
            return lt.ForeignTravellerKey;
        return null; 
    }

    //-- update the logintraveller with a created-datetime, to indicate that the user is active
    public bool CreateLoginTraveller(string internalId, int foreignTravellerKey) {
        //LoginTraveller lt = _accountRepository.LoginTravellers.Where( x => x.Id == internalId && x.ForeignTravellerKey == foreignTravellerKey).FirstOrDefault();
        LoginTraveller lt = _accountRepository.FindByIdAndFK(internalId, foreignTravellerKey);
        if(lt != null) {
            lt.CreatedDateTime = DateTime.UtcNow; 
            _accountRepository.SaveChanges();
        return true;
        }
        return false;
    }

    public int GetLoggedOnTravellerId(string userId) {
            //LoginTraveller login = _accountRepository.LoginTravellers.Where( x => x.Id == userId).FirstOrDefault();
            LoginTraveller login = _accountRepository.Find(userId);
            return login.ForeignTravellerKey;
        }

    public async Task<bool> EmailSecurityCodeToNewUserAsync(string email,string firstname) {
        //-- validate that the email and firstname is to be found in the travellerdetails table
        //-- if yes, generate a new security-token with a time-to-live = 2 hours. Email the 
        //-- security token to the email. 

        //-- lookup email and firstname from travellerDetails table
        string securityCode = GenerateSecurityCode();
        var traveller = _dapperUnitOfWork.TravellerRepository.GetByEmail(email).Where( x => x.Firstname == firstname).FirstOrDefault();
        if(traveller != null && traveller.Firstname.ToLower() == firstname.ToLower()) {
            //-- send the email
            DateTime expiraryDateTime = DateTime.Now.AddHours(2);
            var subject = "CheerTravel Mobile Security Code";
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<h2>Welcome to CheerTravel Mobile App.</h2>");
            sb.AppendLine(string.Format("<p>Your security code to create your account is: <b>{0}</b>",securityCode));
            sb.AppendLine("<i>Note, that the code will expire in 2 hours");
            sb.AppendLine("<div></div>");
            await _emailService.SendEmailAsync(email, subject, sb.ToString());

            //-- create or update the LoginTraveller with the new security code
            LoginTraveller lt; 
            //lt = _accountRepository.LoginTravellers.Where( x=> x.ForeignTravellerKey == traveller.TUID).FirstOrDefault();
            lt = _accountRepository.FindByFK(traveller.TUID);
            if(lt == null) {
                lt = new LoginTraveller() { ForeignTravellerKey = traveller.TUID, SecurityToken = securityCode, SecurityTokenExpires = expiraryDateTime, Id = email};
            } else {
                lt.SecurityToken = securityCode;
                lt.SecurityTokenExpires = DateTime.Now.AddHours(2).ToUniversalTime();
            }
            _accountRepository.Add(lt);
            //_dbContext.LoginTravellers.Add(lt);
            //_dbContext.SaveChanges();
            _accountRepository.SaveChanges();

            return true;
            }
        return false;
    }

    private string GenerateSecurityCode() {
        int min = 1000;
        int max = 9999;
        Random r = new System.Random();
        return r.Next(min,max).ToString();
    }
}
}
