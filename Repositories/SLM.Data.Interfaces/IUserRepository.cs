﻿
using SLM.WebApp.Models;

namespace SLM.Data.Interfaces
{
    //creating 1 repository per table
    public interface IUserRepository: IRepository<User>
    {


    }
}
