using API.Models;
using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/category")]
    public class CategoryController : ApiController
    {
        [Route("")]
        [HttpGet]
        public IHttpActionResult GetCategories()
        {
            return Ok(Get());
        }

        public List<CategoryGetApiModel> Get()
        {
            using(var db = new BookStoreContext())
            {
                return db.Database.SqlQuery<CategoryGetApiModel>(@"select Category.CategoryName, 
                                            Author.LastName + ', ' + Author.FirstName as AuthorFullName
                                            from Category
                                            inner join Book
                                            on Category.Id = Book.CategoryId
                                            inner join Author
                                            on Book.AuthorId = Author.Id
                                            group by CategoryName, Author.LastName + ', ' + Author.FirstName
                                            ").ToList();
            }
        }
    }
}
