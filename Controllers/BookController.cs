using API.Models;
using DataBase;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BooksController : ControllerBase
    {
        private BookStoreContext db;

        public BooksController(BookStoreContext db)
        {
            this.db = db;
        }


        [HttpGet]
        [Route("")]
        public IActionResult GetBooks(string categoryName = null, string author = null, string input = null)
        {
            return Ok(Get(categoryName, author, input));
        }

        private List<BookGetApiModel> Get(string categoryName, string author, string input)
        {
            string where = "";
            string like = "";

            var parameters = new List<SqlParameter> { };

            if (!string.IsNullOrEmpty(categoryName))
            {
                where = $"where Category.CategoryName = @categoryName";
                parameters.Add(new SqlParameter("@categoryName", categoryName.Trim()));

                if (!string.IsNullOrEmpty(author))
                {
                    where += $" and Author.LastName = @author";
                    parameters.Add(new SqlParameter("@author", author.Trim()));
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(author))
                {
                    where = $"where Author.LastName = @author";
                    parameters.Add(new SqlParameter("@author", author.Trim()));
                }
            }

            if (!string.IsNullOrEmpty(input))
            {
                where = $"where Book.Title ";
                like = $"like @input";
                input = "%" + input.Trim() + "%";
                parameters.Add(new SqlParameter("@input", input));
            }

            var list = db.Database.SqlQueryRaw<BookGetApiModel>(@"select Book.Id as BookId, Book.Title, 
                                            Category.CategoryName, Book.Image, Book.IsReccomended,
                                            Author.FirstName as AuthorFirstName, Author.LastName as AuthorLastName,
                                            Book.Year, Book.Price, Book.Discount, Book.ISBN, Book.Summary
                                            from Book
                                            inner join Author
                                            on Book.AuthorId = Author.Id
                                            inner join Category
                                            on Book.CategoryId = Category.Id " + where + like, parameters.ToArray()).ToList();

            return list;
        }

        [HttpGet]
        [Route("{id:int}")]
        public IActionResult GetBookById(int id)
        {
            return Ok(GetById(id));
        }
        private BookGetApiModel GetById(int id)
        {
            var book = db.Database.SqlQuery<BookGetApiModel>($@"select Book.Id as BookId, Book.Title, 
                                            Category.CategoryName, Book.Image, Book.IsReccomended,
                                            Author.FirstName as AuthorFirstName, Author.LastName as AuthorLastName,
                                            Book.Year, Book.Price, Book.Discount, Book.ISBN, Book.Summary
                                            from Book
                                            inner join Author
                                            on Book.AuthorId = Author.Id
                                            inner join Category
                                            on Book.CategoryId = Category.Id").FirstOrDefault(x => x.BookId == id);

            if (book == null)
            {
                throw new ArgumentNullException("Book id is null");
            } else
            {
                return book;
            }
        }

        [HttpGet]
        [Route("recommended")]
        public IActionResult GetRecommended()
        {
            return Ok(GetRecom());
        }
        private List<BookGetApiModel> GetRecom()
        {
            var list = db.Database.SqlQuery<BookGetApiModel>($@"select Book.Id as BookId, Book.Title, 
                                            Category.CategoryName, Book.Image, Book.IsReccomended,
                                            Author.FirstName as AuthorFirstName, Author.LastName as AuthorLastName,
                                            Book.Year, Book.Price, Book.Discount, Book.ISBN, Book.Summary
                                            from Book
                                            inner join Author
                                            on Book.AuthorId = Author.Id
                                            inner join Category
                                            on Book.CategoryId = Category.Id ")
                                            .Where(x => x.IsReccomended == true).ToList();

            return list;
        }
    }
}
