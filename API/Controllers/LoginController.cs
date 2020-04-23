using API.Models;
using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
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
        [Route("")]
        public IHttpActionResult Login()
        {
            LoginModel login = new LoginModel();
            return Ok(login);
        }

        [HttpPost]
        [Route("")]
        public IHttpActionResult Login(LoginModel loginModel)
        {
            using (var db = new BookStoreContext())
            {
                using (MD5 md5hash = MD5.Create())
                {
                    var user = db.Users.FirstOrDefault(x => x.Email == loginModel.Email);
                    string password = user.Password;
                    string hashedInput = GetMd5Hash(md5hash, loginModel.Password);

                    if (hashedInput == password)
                    {
                        Console.WriteLine(user.Email, user.Password);
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

        static string GetMd5Hash(MD5 md5hash, string input)
        {
            byte[] data = md5hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}
