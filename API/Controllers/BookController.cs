using API.Models;
using DataBase;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Mvc.Html;

namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/books")]
    public class BookController : ApiController
    {
        [HttpGet]
        [Route("")]
        public IHttpActionResult GetBooks(string categoryName = null, string author = null, string input = null)
        {
            return Ok(Get(categoryName, author, input));
        }

        public List<BookGetApiModel> Get(string categoryName, string author, string input)
        {
            using (var db = new BookStoreContext())
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

                var list = db.Database.SqlQuery<BookGetApiModel>(@"select Book.Id as BookId, Book.Title, 
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
        }

        [HttpGet]
        [Route("{id:int}")]
        public IHttpActionResult GetBookById(int id)
        {
            return Ok(GetById(id));
        }
        public BookGetApiModel GetById(int id)
        {
            using (var db = new BookStoreContext())
            {
                return db.Database.SqlQuery<BookGetApiModel>(@"select Book.Id as BookId, Book.Title, 
                                            Category.CategoryName, Book.Image, Book.IsReccomended,
                                            Author.FirstName as AuthorFirstName, Author.LastName as AuthorLastName,
                                            Book.Year, Book.Price, Book.Discount, Book.ISBN, Book.Summary
                                            from Book
                                            inner join Author
                                            on Book.AuthorId = Author.Id
                                            inner join Category
                                            on Book.CategoryId = Category.Id").FirstOrDefault(x => x.BookId == id);
            }
        }

        [HttpGet]
        [Route("reccomended")]
        public IHttpActionResult GetReccomended()
        {
            return Ok(GetReccom());
        }
        public List<BookGetApiModel> GetReccom()
        {
            using (var db = new BookStoreContext())
            {
                var list = db.Database.SqlQuery<BookGetApiModel>(@"select Book.Id as BookId, Book.Title, 
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
}
