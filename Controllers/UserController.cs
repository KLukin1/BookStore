using API.Models;
using DataBase;
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


        [HttpGet]
        [Route("")]
        public IActionResult GetUsers()
        {
            return Ok(userRepository.Get());
        }

        [HttpGet]
        [Route("{id:int}")]
        public IActionResult GetUsersById(int id)
        {
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
