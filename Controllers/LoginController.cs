using DataBase;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace WebApiCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private BookStoreContext db;
        private IConfiguration _config;
        public LoginController(IConfiguration config, BookStoreContext db)
        {
            _config = config;
            this.db = db;
        }

        [HttpPost]
        [Route("")]
        public IActionResult Post([FromBody] LoginRequest loginRequest)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                string email = loginRequest.Email;
                string password = loginRequest.Password;

                string hash = GetMd5Hash(md5Hash, password);

                var user = db.Users.FirstOrDefault(x => x.Email == loginRequest.Email && x.Password == hash);

                if (user != null)
                {
                    var claimsdata = new[]
                    {
                        new Claim("userId", user.Id.ToString()),
                        new Claim("email", user.Email)
                    };

                    var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
                    var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                    var Sectoken = new JwtSecurityToken(
                      _config["Jwt:Issuer"],
                      _config["Jwt:Issuer"],
                      expires: DateTime.Now.AddMinutes(120),
                      claims: claimsdata,
                      signingCredentials: credentials);

                    var token = new JwtSecurityTokenHandler().WriteToken(Sectoken);

                    return Ok(token);
                }
                else
                {
                    return Unauthorized();
                }
            }
        }

        private static string GetMd5Hash(MD5 md5hash, string input)
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