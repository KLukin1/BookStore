namespace API.Models
{
    public class BaseBookModel
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string AuthorFirstName { get; set; }
        public string AuthorLastName { get; set; }
        public decimal Price { get; set; }
        public decimal? Discount { get; set; }

    }
}