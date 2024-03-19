using System.Security.Cryptography;
using System.Text;

namespace WebApiCore.Helpers
{
    public static class StringHelpers
    {
        public static string GetMd5Hash(this string input)
        {
            StringBuilder sBuilder = new StringBuilder();
            using (MD5 md5hash = MD5.Create())
            {
                byte[] data = md5hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
            }
            return sBuilder.ToString();
        }
    }
}
