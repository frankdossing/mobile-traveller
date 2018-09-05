using System.Configuration;
using System.IO;
using Microsoft.Extensions.FileProviders;
using CheerTravel.Mobile.Web.Interfaces;

namespace CheerTravel.Mobile.Web.Helpers {
    public class SiteHelper:ISiteHelper {
        private readonly IFileProvider _fileProvider;
        public SiteHelper(IFileProvider provider) {
            _fileProvider = provider;
        }
        public string ReadFileContent(string fileName) {
            IFileInfo file = _fileProvider.GetFileInfo(fileName);
            string fileOutput;
            using(var stream = file.CreateReadStream())
                using(var reader = new StreamReader(stream)) {
                    fileOutput = reader.ReadToEnd();
                }
            return fileOutput;                
        }
    }
}