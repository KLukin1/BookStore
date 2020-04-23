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

namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/users")]
    public class UserController : ApiController
    {
        [HttpGet]
        [Route("")]
        public IHttpActionResult GetUsers()
        {
            return Ok(Get());
        }
        public List<User> Get()
        {
            using (var db = new BookStoreContext())
            {
                return db.Users.ToList();
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public IHttpActionResult GetUsersById(int id)
        {
            return Ok(GetById(id));
        }
        public User GetById(int id)
        {
            using (var db = new BookStoreContext())
            {
                return db.Users.FirstOrDefault(x => x.Id == id);
            }
        }

        [HttpPost]
        [Route("")]
        public IHttpActionResult CreateUser(User user)
        {
            return Ok(CreateUserr(user));
        }
        public User CreateUserr(User user)
        {
            using (var db = new BookStoreContext())

            using (MD5 md5hash = MD5.Create())
            {
                string hashedInput = GetMd5Hash(md5hash, user.Password);
                user.Password = hashedInput;
                db.Users.Add(user);
                db.SaveChanges();
                return user;
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
