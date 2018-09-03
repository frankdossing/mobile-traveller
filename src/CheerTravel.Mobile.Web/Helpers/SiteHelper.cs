using System.Configuration;

namespace CheerTravel.Mobile.Web.Helpers {
    public class SiteHelper {
        public static string GetConnectionString(string name) {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}