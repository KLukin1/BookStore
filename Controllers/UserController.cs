using API.Models;
using DataBase;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApiCore.Controllers;
using WebApiCore.DTOs;
using WebApiCore.Repository;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : BaseController
    {
        private UserRepository userRepository;

        public UsersController(UserRepository userRepository)
        {
            this.userRepository = userRepository;
        }

        [Authorize]
        [HttpGet]
        [Route("")]
        public IActionResult GetUsers()
        {
            if (!LoggedInUser.IsAdmin)
            {
                return Unauthorized();
            }
            return Ok(userRepository.Get());
        }

        [Authorize]
        [HttpGet]
        [Route("{id:int}")]
        public IActionResult GetUsersById(int id)
        {
            if (!LoggedInUser.IsAdmin)
            {
                return Unauthorized();
            }
            return Ok(userRepository.GetById(id));
        }

        [HttpPost]
        [Route("")]
        public IActionResult CreateUser(CreateUserDto user)
        {
            return Ok(userRepository.CreateUserr(user));
        }

        [HttpGet]
        [Route("currentUser")]
        public IActionResult GetCurrentUser()
        {
            return Ok(userRepository.GetCurrentUser(LoggedInUser.Email));
        }
    }
}
