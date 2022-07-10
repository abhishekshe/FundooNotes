using DatabaseLayer;
using DataBaseLayer;
using System;
using System.Collections.Generic;
using System.Text;

namespace BusinessLayer.Interface
{
    public interface IUserBL
    {
        public void AddUser(UsersModel users);
        List<UserResponseModel> GetAllUsers();
    }
}
