using System.Configuration;
using System.IO;
using System.Reflection;
using Microsoft.Extensions.FileProviders;
using CheerTravel.Mobile.Web.Interfaces;
using System.Threading.Tasks;

namespace CheerTravel.Mobile.Web.Helpers {
    public class SiteHelper:ISiteHelper {
        private readonly IFileProvider _fileProvider;
        public SiteHelper(IFileProvider provider) {
            _fileProvider = provider;
        }

        public Task<string> GetResourceAsync(string resourceName) {
            var assembly = Assembly.GetEntryAssembly();
            var resourceStream = assembly.GetManifestResourceStream("CheerTravel.Mobile.Web.Resources." + resourceName);
            using(var reader = new StreamReader(resourceStream)) {
                return reader.ReadToEndAsync();
            }
        }

        public string ReadFileContent(string fileName) {
            using(StreamReader reader = File.OpenText(fileName)) {
                string fileContent = reader.ReadToEnd();
                if (fileContent != null && fileContent != "")
                {
                    return fileContent;
                }
            }               
            return null;
        }
    }
}