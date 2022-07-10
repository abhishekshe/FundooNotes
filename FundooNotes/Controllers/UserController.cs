﻿using BusinessLayer.Interface;
using DatabaseLayer;
using DataBaseLayer;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace FundooNotes.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        IUserBL userBL;
        public UserController(IUserBL userBL)
        {
            this.userBL = userBL;
        }
        [HttpPost("Register")]
        public IActionResult AddUser(UsersModel users)
        {
            try
            {
                this.userBL.AddUser(users);
                return this.Ok(new { success = true, Message = "User Registration Sucessfull" });

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       

    }
}