using API.Models;
using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Security;

namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Login()
        {
            LoginModel login = new LoginModel();
            return Ok(login);
        }

        [HttpPost]
        public IHttpActionResult Login(LoginModel loginModel)
        {
            using(var db = new BookStoreContext())
            {
                var user = db.Users.FirstOrDefault(x => x.Email == loginModel.Email);

                if(loginModel.Password == user.Password)
                {

                    FormsAuthentication.SetAuthCookie(loginModel.Email, false);
                    return Ok();
                }
                else
                {
                    return BadRequest();
                }
            }
        }
    }
}
