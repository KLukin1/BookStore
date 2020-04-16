using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class BookGetApiModel
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public string CategoryName { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
        public string AuthorFirstName { get; set; }
        public string AuthorLastName { get; set; }
        public int Year { get; set; }
        public string ISBN { get; set; }
        public string Summary { get; set; }
        public decimal? Discount { get; set; }
        public bool? IsReccomended { get; set; }
    }
}