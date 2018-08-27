using System;

namespace Cheertravel.Mobile.Data {
    public class Trip {
        public string Destination {get;set;}
        public DateTime DepartureDate {get;set;}
        public DateTime ReturnDate {get;set;}
        public int NoOfTravellersTotal {get;set;}
        public int NoOfTravellersWithUser {get;set;}
        public string DepartureFlightNo {get;set;}
        public string HotelToStay {get;set;}
    }
}