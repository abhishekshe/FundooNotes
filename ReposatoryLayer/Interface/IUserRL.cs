using DatabaseLayer;
using DataBaseLayer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ReposatoryLayer.Interface
{
    public interface IUserRL
    {
        public void AddUser(UsersModel user);
        public List<UserResponseModel> GetAllUsers();

        public string LoginUser(LoginUserModel loginUser);
        public bool ForgetPasswordUser(string email);
    }
}
