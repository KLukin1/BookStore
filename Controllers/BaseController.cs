using API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Net.Http.Headers;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http.Headers;

namespace WebApiCore.Controllers
{
    public class BaseController : ControllerBase
    {
        public CurrentUser LoggedInUser
        {
            get
            {
                var authorization = Request.Headers[HeaderNames.Authorization];

                if (AuthenticationHeaderValue.TryParse(authorization, out var headerValue))
                {
                    var token = headerValue.Parameter;

                    var handler = new JwtSecurityTokenHandler();
                    var jwtSecurityToken = handler.ReadJwtToken(token);
                    var email = jwtSecurityToken.Claims.First(claim => claim.Type == "email").Value;
                    var userId = jwtSecurityToken.Claims.First(claim => claim.Type == "userId").Value;
                    var adminClaim = jwtSecurityToken.Claims.FirstOrDefault(claim => claim.Type == "isAdmin");

                    return new CurrentUser()
                    {
                        UserId = int.Parse(userId),
                        Email = email,
                        IsAdmin = adminClaim != null ? bool.Parse(adminClaim.Value) : false
                    };
                }
                else
                {
                    return null;
                }
            }
        }
    }
}
