﻿using Microsoft.AspNetCore.Mvc;
using SLM.Bussines.Interfaces;
using SLM.WebApp.Models;
using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using SLM.Bussiness.DataServices;
using SLM.Bussiness.Models;

namespace SLM.WebApp.Controllers
{
	//[Authorize]
	public class AccountController : Controller
	{
		//private readonly ILogger<HomeController> _logger;
        private readonly IUserService _userService;
        public AccountController(IUserService userService)

        {
            _userService = userService;
        }
      
        public IActionResult Dashboard()
		{
			return View();
		}


       
        public IActionResult Details()
		{
            
            return View();
            //return View();
        }
        // POST: CoursesController/Details/5
      
        

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}