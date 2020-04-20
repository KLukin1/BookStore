using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class BookGetApiModel : BaseBookModel
    {
        public string CategoryName { get; set; }
        public int Year { get; set; }
        public string ISBN { get; set; }
        public string Summary { get; set; }
        public bool? IsReccomended { get; set; }
    }
}