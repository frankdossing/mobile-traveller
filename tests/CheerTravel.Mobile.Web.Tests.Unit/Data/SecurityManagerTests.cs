using Xunit;
using CheerTravel.Mobile.Web.Data;
using CheerTravel.Mobile.Web.Interfaces;
using Moq;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System;
using System.Threading.Tasks;

namespace CheerTravel.Mobile.Web.Tests.Unit {

    public class SecurityManagerTests {

        [Fact]
        public void CanCompile() {
            //--setup
            var accountRep = new Mock<IAccountRepository>();
            var dapperUOW = new Mock<IDapperUnitOfWork>();
            var emailer = new Mock<IEmailSender>();
            var logger = new Mock<ILogger<SecurityManager>>();
            var helper = new Mock<ISiteHelper>();
            //-- act
            SecurityManager sm = new SecurityManager(accountRep.Object, emailer.Object, dapperUOW.Object, logger.Object, helper.Object);
            //-- assert
            Assert.True(sm != null);
        }

        [Fact]
        public void ExpectToSendEmailAndUpdateExistingUser() {
            //--setup
            var accountRep = new Mock<IAccountRepository>();
            LoginTraveller lt = new LoginTraveller() { Id = "phony"};
            accountRep.Setup( x => x.FindByFK(It.IsAny<int>())).Returns(lt);
            var dapperUOW = new Mock<IDapperUnitOfWork>();
            var emailer = new Mock<IEmailSender>();
            var logger = new Mock<ILogger<SecurityManager>>();
            var travellerRep = new Mock<ITravellerRepository>();
            var helper = new Mock<ISiteHelper>();
            IList<Traveller> travellerCollection = new List<Traveller>();
            Traveller fakeTraveller = new Traveller() { Firstname = "tester"};
            travellerCollection.Add(fakeTraveller);
            travellerRep.Setup( x => x.GetByEmail(It.IsAny<string>())).Returns(travellerCollection);
            dapperUOW.Setup( x => x.TravellerRepository).Returns(travellerRep.Object);
            helper.Setup( x => x.ReadFileContentAsync(It.IsAny<string>())).Returns(Task<string>.FromResult("se"));

            //-- act
            SecurityManager sm = new SecurityManager(accountRep.Object, emailer.Object, dapperUOW.Object, logger.Object,helper.Object);
            var result = sm.EmailSecurityCodeToNewUserAsync("phony", "tester", "http://returnvalue" );
            //-- assert
            Assert.True(result.Result);
            Assert.True(lt.SecurityToken != String.Empty,"Security Token should not be empty");
            accountRep.Verify( x => x.SaveChanges(),Times.Once);
        }

        [Fact]
        public void ExpectToSendEmailAndCreateNewLoginTravellerUser() {
            //--setup
            var accountRep = new Mock<IAccountRepository>();
            LoginTraveller lt = new LoginTraveller() { Id = "phony"};
            accountRep.Setup( x => x.FindByFK(It.IsAny<int>())).Returns(lt);
            var dapperUOW = new Mock<IDapperUnitOfWork>();
            var emailer = new Mock<IEmailSender>();
            var logger = new Mock<ILogger<SecurityManager>>();
            var travellerRep = new Mock<ITravellerRepository>();
            var helper = new Mock<ISiteHelper>();
            IList<Traveller> travellerCollection = new List<Traveller>();
            Traveller fakeTraveller = new Traveller() { Firstname = "tester"};
            travellerCollection.Add(fakeTraveller);
            travellerRep.Setup( x => x.GetByEmail(It.IsAny<string>())).Returns(travellerCollection);
            dapperUOW.Setup( x => x.TravellerRepository).Returns(travellerRep.Object);
            helper.Setup( x => x.ReadFileContentAsync(It.IsAny<string>())).Returns(Task<string>.FromResult("se"));
            //-- act
            SecurityManager sm = new SecurityManager(accountRep.Object, emailer.Object, dapperUOW.Object, logger.Object,helper.Object);
            var result = sm.EmailSecurityCodeToNewUserAsync("phony", "tester", "http://returnvalue" );
            //-- assert
            Assert.True(result.Result);
            Assert.True(lt.SecurityToken != String.Empty,"Security Token should not be empty");
        }
    }
}