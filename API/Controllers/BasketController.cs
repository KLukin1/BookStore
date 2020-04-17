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
    [RoutePrefix("api/basket")]
    public class BasketController : ApiController
    {
        private int loggedInUserId = 1;

        [HttpPost]
        [Route("")]
        public IHttpActionResult PostBasket(BookIdModel bookIdModel)
        {
            return Ok(PostBookToBasket(bookIdModel));
        }

        public bool PostBookToBasket(BookIdModel bookId)
        {
            using (var db = new BookStoreContext())
            {
                var basketExists = db.Baskets.Any(x => x.UserId == loggedInUserId && x.IsPayed != true);

                if (!basketExists)
                {
                    var newBasket = new Basket();
                    newBasket.UserId = loggedInUserId;
                    newBasket.IsPayed = false;
                    db.Baskets.Add(newBasket);
                    db.SaveChanges();

                    var newItem = new BasketItem();
                    newItem.BasketId = newBasket.Id;
                    newItem.BookId = bookId.BookId;
                    db.BasketItems.Add(newItem);
                    db.SaveChanges();
                }
                else
                {
                    var basket = db.Baskets.FirstOrDefault(x => x.UserId == loggedInUserId && x.IsPayed != true);
                    var newItem = new BasketItem();
                    newItem.BasketId = basket.Id;
                    newItem.BookId = bookId.BookId;
                    db.BasketItems.Add(newItem);
                    db.SaveChanges();
                }

                return true;
            }
        }
    }
}
