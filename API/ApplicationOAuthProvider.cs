using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using DataBase;
using Microsoft.Owin.Security.OAuth;

namespace API
{
    public class ApplicationOAuthProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            using (var db = new BookStoreContext())
            {
                var user = db.Users.FirstOrDefault(x => x.Email == context.UserName);

                if (user != null)
                {
                    var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                    identity.AddClaim(new Claim("UserId", user.Id.ToString()));
                    identity.AddClaim(new Claim("FirstName", user.FirstName));
                    identity.AddClaim(new Claim("LastName", user.LastName));
                    identity.AddClaim(new Claim("Email", user.Email));
                    context.Validated(identity);
                }
                else
                {
                    return;
                }
            }
        }
    }
}