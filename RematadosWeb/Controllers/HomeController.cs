using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using RematadosWeb.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using RematadosWeb.Context;
using Microsoft.AspNetCore.Mvc.Rendering;



namespace RematadosWeb.Controllers
{
    public class HomeController : Controller
    {


        private readonly RematadosDatabaseContext _context;

   

        private readonly ILogger<HomeController> _logger;
       

        public HomeController(ILogger<HomeController> logger, RematadosDatabaseContext context)
        {
            _logger = logger;
            _context = context;
      
        }



        public ActionResult Index()
        {

            var usuarioID = HttpContext.Session.GetInt32("UsuarioID");

            if (usuarioID == 0 || usuarioID == null)
            {
                return View();
            }
            else
            {
                return View("Index");
            }


       
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(Usuario usr)
        {



            //var item = _context.Usuarios.FindAsync(usr.Dni);
            var usuario = new UsuariosController(_context).GetUsuarioFromId(usr.Dni);

            if (usuario != null && usuario.Dni == usr.Dni && usuario.Password == usr.Password)
            {


                HttpContext.Session.SetInt32("UsuarioID", usr.Dni);

                var usuarioID = HttpContext.Session.GetInt32("UsuarioID");



                return View("Dashboard", usuarioID);
            }
            else
            {
                HttpContext.Session.SetInt32("UsuarioID", 0);
                usuario = new Usuario();
                usuario.Dni = 0;
                return View(usuario);
            }



            
       
        }
        public IActionResult Dashboard()


        {
            var usuarioID = HttpContext.Session.GetInt32("UsuarioID");

            if (usuarioID != 0)
            {
   
                return View();
            }
            else
            {
                return RedirectToAction("Index");
            }


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

        public ActionResult Salir()
        {
            HttpContext.Session.SetInt32("UsuarioID", 0);
            return RedirectToAction(nameof(Index));
        }






    }
}
