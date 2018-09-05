namespace CheerTravel.Mobile.Web.Interfaces {
    public interface ISiteHelper {
        string ReadFileContent(string fileName);
        string GetResource(string resourceName);
    }
}