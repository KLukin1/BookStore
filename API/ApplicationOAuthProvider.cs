using DataBase;
using Microsoft.Owin.Security.OAuth;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

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
                using (MD5 md5Hash = MD5.Create())
                {
                    string email = context.UserName;
                    string password = context.Password;

                    string hash = GetMd5Hash(md5Hash, password);

                    var user = db.Users.FirstOrDefault(x => x.Email == context.UserName);

                    if (user.Password == hash)
                    {
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

        public static string GetMd5Hash(MD5 md5Hash, string input)
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}