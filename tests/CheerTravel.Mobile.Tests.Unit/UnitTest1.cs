using System;
using Xunit;
using CheerTravel.Mobile.Web.Data;
using CheerTravel.Mobile.Web.Interfaces;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Identity.UI.Services;
using Moq;

namespace CheerTravel.Mobile.Tests.Unit
{
    public class SecurityManagerTests 
    {
        [Fact]  
        public void Test1()
        {
            var contextMoq = new Mock<IAccountRepository>();
            var unitOfWork = new Mock<IDapperUnitOfWork>();
            var emailSender = new Mock<IEmailSender>();
            var logger = new Mock<ILogger<SecurityManager>>();

            var securityManager = new SecurityManager(contextMoq.Object, emailSender.Object, unitOfWork.Object, logger.Object);
            var result = securityManager.EmailSecurityCodeToNewUserAsync("fake","frank");
            Assert.True(result);

        }
    }
}
