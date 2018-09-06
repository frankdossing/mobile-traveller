using System.Threading.Tasks;
using System;

namespace CheerTravel.Mobile.Web.Interfaces {
    public interface ISiteHelper {
        Task<string> ReadFileContentAsync(string fileName);
        Task<string> GetResourceAsync(string resourceName);
    }
}