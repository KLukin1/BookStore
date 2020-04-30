using API.Models;
using DataBase;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/basket")]
    [Authorize]
    public class BasketController : ApiController
    {

        [HttpPost]
        [Route("")]
        public IHttpActionResult PostBasket(BookIdModel bookIdModel)
        {
            CurrentUser loginModel = GetCurrentUser();
            return Ok(PostBookToBasket(bookIdModel, loginModel.UserId));
        }

        public bool PostBookToBasket(BookIdModel bookModel, int userId)
        {
            using (var db = new BookStoreContext())
            {
                var basketExists = db.Baskets.Any(x => x.UserId == userId && x.IsPayed != true);

                if (!basketExists)
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
                    var basket = db.Baskets.FirstOrDefault(x => x.UserId == userId && x.IsPayed != true);
                    var itemExists = db.BasketItems.Any(x => x.BookId == bookModel.BookId && x.BasketId == basket.Id);
                    
                    if (itemExists)
                    {
                        var item = db.BasketItems.FirstOrDefault(x => x.BookId == bookModel.BookId);
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
        }

        [HttpGet]
        [Route("")]
        public IHttpActionResult GetBasket()
        {
            CurrentUser loginModel = GetCurrentUser();
            return Ok(GetBooksFromBasket(loginModel.UserId));
        }

        public List<BasketGetApiModel> GetBooksFromBasket(int userId)
        {
            using (var db = new BookStoreContext())
            {
                string where = "";
                var parameters = new List<SqlParameter> { };

                if (userId > 0)
                {
                    where = $"where Basket.UserId = @loggedInUserId";
                    parameters.Add(new SqlParameter("@loggedInUserId", userId.ToString().Trim()));

                }
                var list = db.Database.SqlQuery<BasketGetApiModel>(@"select Basket.Id as BasketId, 
                                                    BasketItem.Id as BasketItemId, Book.Id as BookId, 
                                                    Book.Title, Book.Image, Book.Price, Book.Discount,
                                                    Author.FirstName as AuthorFirstName, 
                                                    Author.LastName as AuthorLastName,
                                                    BasketItem.[Count] as [Count]
                                                    from BasketItem
                                                    inner join Basket
                                                    on BasketItem.BasketId = Basket.Id
                                                    inner join Book
                                                    on BasketItem.BookId = Book.Id
                                                    inner join Author
                                                    on Book.AuthorId = Author.Id " + where, parameters.ToArray()).ToList();

                return list;
            }
        }

        [HttpPut]
        [Route("basketItem")]
        public IHttpActionResult UpdateBasketItem(BasketGetApiModel basketItem)
        {
            return Ok(UpdateItem(basketItem));
        }

        public BasketItem UpdateItem(BasketGetApiModel basketItem)
        {
            using (var db = new BookStoreContext())
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
        }

        [HttpGet]
        [Route("count")]
        public IHttpActionResult GetBasketCount()
        {
            CurrentUser loginModel = GetCurrentUser();
            return Ok(GetBasketItemCount(loginModel.UserId));
        }

        public int GetBasketItemCount(int userId)
        {
            using(var db = new BookStoreContext())
            {
                string where = "";
                var parameters = new List<SqlParameter> { };

                if (userId > 0)
                {
                    where = $"where Basket.UserId = @loggedInUserId";
                    parameters.Add(new SqlParameter("@loggedInUserId", userId.ToString().Trim()));

                }
                var itemSum = db.Database.SqlQuery<int>(@"select BasketItem.[Count]
                                from BasketItem
                                inner join Basket
                                on BasketItem.BasketId = Basket.Id 
                                inner join [User]
                                on Basket.UserId = [User].Id " + where, parameters.ToArray());
                return itemSum.Sum();
            }
        }

        private CurrentUser GetCurrentUser()
        {
            var identityClaims = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identityClaims.Claims;
            CurrentUser loginModel = new CurrentUser()
            {
                Email = identityClaims.FindFirst("Email").Value,
                FirstName = identityClaims.FindFirst("FirstName").Value,
                LastName = identityClaims.FindFirst("LastName").Value,
                UserId = int.Parse(identityClaims.FindFirst("UserId").Value)
            };
            return loginModel;
        }
    }
}
