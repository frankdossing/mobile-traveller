using System;
using System.Collections.Generic;

namespace Cheertravel.Mobile.Data {
public class Traveller {
    public int TUID {get;set;}
    public int TravellerTypeUID {get;set;}
    public string AdultChild {get;set;}
    public string MiddleName {get;set;}
    public string Surname {get;set;}
    public string Firstname {get;set;}
    public string Title {get;set;}
    public string Sex {get;set;}
    public DateTime DateOfBirth {get;set;}
    public string MobileNo {get;set;}
    public string PhoneNo {get;set;}
    public int GroupId {get;set;}
    public string Email {get;set;}
    public Group Group {get;set;}
}
}