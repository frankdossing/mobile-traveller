using System;
using System.Collections.Generic;

namespace Cheertravel.Mobile.Data {

    public class Group {
        public int Id {get;set;}
        public string Name {get;set;}
        public string Description {get;set;}
        public string ContactName {get;set;}
        public string ContactPhone {get;set;}
        public DateTime DepartureDateTime {get;set;}
        public DateTime ReturnDateTime {get;set;}
    }
}