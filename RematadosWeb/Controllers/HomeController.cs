﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using RematadosWeb.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;


namespace RematadosWeb.Controllers
{
    public class HomeController : Controller
    {



        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }


        public IActionResult Index()
        {
            HttpContext.Session.SetInt32("UsuarioID", 0);

            var usuarioID = HttpContext.Session.GetInt32("UsuarioID");

            return View(model: usuarioID);
        }

        public IActionResult Dashboard()


        {


            // USUARIO DEFAULT
            HttpContext.Session.SetInt32("UsuarioID", 11222333);

            var usuarioID = HttpContext.Session.GetInt32("UsuarioID");

            return View(model: usuarioID);
        }
        public IActionResult Privacy()
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
