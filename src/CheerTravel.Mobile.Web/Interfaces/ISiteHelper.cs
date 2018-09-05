using System.Threading.Tasks;
using System;

namespace CheerTravel.Mobile.Web.Interfaces {
    public interface ISiteHelper {
        string ReadFileContent(string fileName);
        Task<string> GetResourceAsync(string resourceName);
    }
}