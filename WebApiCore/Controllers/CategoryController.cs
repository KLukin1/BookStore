using API.Models;
using DataBase;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CategoryController : ControllerBase
    {
        private BookStoreContext db;
        public CategoryController(BookStoreContext db)
        {
            this.db = db;
        }

        [Route("")]
        [HttpGet]
        public IActionResult GetCategories()
        {
            return Ok(Get());
        }

        private List<CategoryGetApiModel> Get()
        {

            return db.Database.SqlQuery<CategoryGetApiModel>($@"select Category.CategoryName, 
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
