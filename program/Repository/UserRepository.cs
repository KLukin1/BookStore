using DataBase;
using System.Linq.Expressions;
using WebApiCore.DTOs;
using WebApiCore.Helpers;

namespace WebApiCore.Repository
{
    public class UserRepository
    {
        private BookStoreContext db;

        Func<User, UserDto> userMapper = (User user) =>
        {
            return new UserDto()
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                DeliveryAddress = user.DeliveryAddress
            };
        };


        public UserRepository(BookStoreContext db)
        {
            this.db = db;

        }

        public List<UserDto> Get()
        {
            List<User> dbUsers = db.Users.ToList();
            return dbUsers.Select(userMapper).ToList();
        }

        public UserDto GetById(int id)
        {
            UserDto userDto = new UserDto();
            User dbUser = db.Users.FirstOrDefault(x => x.Id == id);

            userDto.Id = dbUser.Id;
            userDto.FirstName = dbUser.FirstName;
            userDto.LastName = dbUser.LastName;
            userDto.Email = dbUser.Email;
            userDto.DeliveryAddress = dbUser.DeliveryAddress;

            return userDto;
        }

        public CreateUserDto CreateUserr(CreateUserDto userDto)
        {
            User newUser = new User();
            newUser.FirstName = userDto.FirstName;
            newUser.LastName = userDto.LastName;
            newUser.Email = userDto.Email;
            newUser.Password = userDto.Password.GetMd5Hash();
            newUser.DeliveryAddress = userDto.DeliveryAddress;

            db.Users.Add(newUser);
            db.SaveChanges();
            return userDto;
        }

        public UserDto GetCurrentUser(string email)
        {
            UserDto userDto = new UserDto();
            User dbUser = db.Users.FirstOrDefault(x => x.Email == email);

            userDto.Id = dbUser.Id;
            userDto.FirstName = dbUser.FirstName;
            userDto.LastName = dbUser.LastName;
            userDto.Email = dbUser.Email;
            userDto.DeliveryAddress = dbUser.DeliveryAddress;

            return userDto;
        }
    }
}
