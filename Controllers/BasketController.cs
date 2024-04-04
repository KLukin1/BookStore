using API.Models;
using DataBase;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using WebApiCore.Controllers;
using Microsoft.AspNetCore.Authorization;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BasketController : BaseController
    {
        private BookStoreContext db;
        public BasketController(BookStoreContext db)
        {
            this.db = db;
        }

        [HttpPost]
        [Route("")]
        public IActionResult PostBasket(BookIdModel bookIdModel)
        {
            CurrentUser loginModel = LoggedInUser;
            return Ok(PostBookToBasket(bookIdModel, loginModel.UserId));
        }

        private bool PostBookToBasket(BookIdModel bookModel, int userId)
        {
            var basket = db.Baskets.FirstOrDefault(x => x.UserId == userId && x.IsPayed != true);

            if (basket == null)
            {
                var newBasket = new Basket();
                newBasket.UserId = userId;
                newBasket.IsPayed = false;
                db.Baskets.Add(newBasket);
                db.SaveChanges();

                var newItem = new BasketItem();
                newItem.BasketId = newBasket.Id;
                newItem.BookId = bookModel.BookId;
                newItem.Count = bookModel.Count;
                db.BasketItems.Add(newItem);
                db.SaveChanges();
            }
            else
            {
                var item = db.BasketItems.FirstOrDefault(x => x.BookId == bookModel.BookId && x.BasketId == basket.Id);

                if (item != null)
                {
                    item.Count += bookModel.Count;
                }
                else
                {
                    var newItem = new BasketItem();
                    newItem.BasketId = basket.Id;
                    newItem.BookId = bookModel.BookId;
                    newItem.Count = bookModel.Count;
                    db.BasketItems.Add(newItem);
                }
                db.SaveChanges();
            }

            return true;
        }

        [Authorize]
        [HttpGet]
        [Route("")]
        public IActionResult GetBasket()
        {
            CurrentUser loginModel = LoggedInUser;
            return Ok(GetBooksFromBasket(loginModel.UserId));
        }

        private List<BasketGetApiModel> GetBooksFromBasket(int userId)
        {
            string where = "";
            var parameters = new List<SqlParameter> { };

            if (userId > 0)
            {
                where = $"where Basket.UserId = @loggedInUserId and Basket.IsPayed = 0";
                parameters.Add(new SqlParameter("@loggedInUserId", userId.ToString().Trim()));

            }
            var list = db.Database.SqlQueryRaw<BasketGetApiModel>(@"select Basket.Id as BasketId, 
                                                    BasketItem.Id as BasketItemId, Book.Id as BookId, 
                                                    Book.Title, Book.Image, Book.Price, Book.Discount,
                                                    Author.FirstName as AuthorFirstName, 
                                                    Author.LastName as AuthorLastName,
                                                    BasketItem.[Count] as [Count],
                                                    Basket.DatePayed as DatePayed
                                                    from BasketItem
                                                    inner join Basket
                                                    on BasketItem.BasketId = Basket.Id
                                                    inner join Book
                                                    on BasketItem.BookId = Book.Id
                                                    inner join Author
                                                    on Book.AuthorId = Author.Id " + where, parameters.ToArray()).ToList();

            return list;
        }

        [HttpPut]
        [Route("basketItem")]
        public IActionResult UpdateBasketItem(BasketGetApiModel basketItem)
        {
            return Ok(UpdateItem(basketItem));
        }

        private BasketItem UpdateItem(BasketGetApiModel basketItem)
        {
            var itemToUpdate = db.BasketItems.FirstOrDefault(x => x.Id == basketItem.BasketItemId);
            if (basketItem.Count == 0)
            {
                db.BasketItems.Remove(itemToUpdate);
            }
            else
            {
                itemToUpdate.Count = basketItem.Count;
            }
            db.SaveChanges();
            return itemToUpdate;
        }

        [Authorize]
        [HttpGet]
        [Route("count")]
        public IActionResult GetBasketCount()
        {
            CurrentUser loginModel = LoggedInUser;
            return Ok(GetBasketItemCount(loginModel.UserId));
        }

        private int GetBasketItemCount(int userId)
        {
            string where = "";
            var parameters = new List<SqlParameter> { };

            if (userId > 0)
            {
                where = $"where Basket.UserId = @loggedInUserId and Basket.IsPayed = 0";
                parameters.Add(new SqlParameter("@loggedInUserId", userId.ToString().Trim()));

                var itemSum = db.Database.SqlQueryRaw<int>(@"select BasketItem.[Count]
                                from BasketItem
                                inner join Basket
                                on BasketItem.BasketId = Basket.Id 
                                inner join [User]
                                on Basket.UserId = [User].Id " + where, parameters.ToArray()).ToList();
                return itemSum.Sum();
            }
            else
            {
                return -1;
            }
        }

        [HttpPut]
        [Route("checkout")]
        public IActionResult Checkout()
        {
            CurrentUser loginModel = LoggedInUser;
            return Ok(Pay(loginModel.UserId));
        }

        private bool Pay(int userId)
        {
            string where = "";
            var parameters = new List<SqlParameter> { };

            if (userId > 0)
            {
                where = $"where u.Id = @loggedInUserId and b.IsPayed = 0";
                parameters.Add(new SqlParameter("@loggedInUserId", userId.ToString().Trim()));
            }
            var basketUpdate = db.Database.ExecuteSqlRaw(@"update b
                                                          set b.IsPayed = 1, b.DatePayed = GETDATE()
                                                          from Basket b
                                                          inner join [User] u on u.Id = b.UserId " + where, parameters.ToArray());

            return true;
        }

        [Authorize]
        [HttpGet]
        [Route("history")]
        public IActionResult GetHistory()
        {
            CurrentUser loginModel = LoggedInUser;
            return Ok(GetHistoryList(loginModel.UserId));
        }

        private List<HistoryGetApiModel> GetHistoryList(int userId)
        {
            string where = "";
            var parameters = new List<SqlParameter> { };

            if (userId > 0)
            {
                where = $"where Basket.UserId = @loggedInUserId and Basket.IsPayed = 1";
                parameters.Add(new SqlParameter("@loggedInUserId", userId.ToString().Trim()));

            }
            var list = db.Database.SqlQueryRaw<BasketGetApiModel>(@"select Basket.Id as BasketId, 
                                                    BasketItem.Id as BasketItemId, Book.Id as BookId, 
                                                    Book.Title, Book.Image, Book.Price, Book.Discount,
                                                    Author.FirstName as AuthorFirstName, 
                                                    Author.LastName as AuthorLastName,
                                                    BasketItem.[Count] as [Count],
                                                    Basket.DatePayed as DatePayed
                                                    from BasketItem
                                                    inner join Basket
                                                    on BasketItem.BasketId = Basket.Id
                                                    inner join Book
                                                    on BasketItem.BookId = Book.Id
                                                    inner join Author
                                                    on Book.AuthorId = Author.Id " + where + " order by DatePayed desc", parameters.ToArray()).ToList();

            List<HistoryGetApiModel> sorted = list.GroupBy(x => x.BasketId)
                .Select(x => new HistoryGetApiModel
                {
                    BasketId = x.Key,
                    Items = x.ToList()
                })
                .ToList();

            return sorted;
        }
    }
}
