using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using RematadosWeb.Context;
using RematadosWeb.Models;
using Microsoft.Extensions.Hosting;
using System.IO;
using System.Threading;

namespace RematadosWeb.Controllers
{
    public class ArticulosController : Controller
    {
        private readonly RematadosDatabaseContext _context;
        private readonly IHostEnvironment hostingEnvironment;


        public ArticulosController(RematadosDatabaseContext context, IHostEnvironment environment = null)
        {
            _context = context;
            hostingEnvironment = environment;
        }

        // GET: Articulos
        public async Task<IActionResult> Index()
        {
            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

            var articulos = await _context.Articulos.Where(articulos => articulos.Vendedor != usr && articulos.Estado == EstadoArticulo.EN_VENTA && articulos.Estado != EstadoArticulo.VENDIDO).ToListAsync();

            articulos = articulos.OrderBy(i => i.Categoria).ThenBy(i => i.Nombre).ToList();



            return View(articulos);
        }

        public async Task<IActionResult> ListadoArticulos()
        {
            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

            var articulos = await _context.Articulos.Where(articulos => articulos.Estado == EstadoArticulo.EN_VENTA).ToListAsync();
            articulos = await _context.Articulos.Where(articulos => articulos.Vendedor != usr).ToListAsync();
            articulos = articulos.OrderBy(i => i.Categoria).ThenBy(i => i.Nombre).ToList();



            return View(articulos);
        }

        public IActionResult ArticuloNoEncontrado()
        {
            return View();
        }

        public IActionResult VolverAVentas()
        {
            return View("MisVentas");
        }



        public async Task<IActionResult> Buscar(string id)
        {
            var input = Request.Form["Busqueda"];
           
            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

            var articulos = await _context.Articulos.Where(articulos => articulos.Nombre.Contains(input) && articulos.Vendedor != usr && articulos.Estado == EstadoArticulo.EN_VENTA && articulos.Estado != EstadoArticulo.VENDIDO).ToListAsync();




            articulos = articulos.OrderBy(i => i.Categoria).ThenBy(i => i.Nombre).ToList();

            if (articulos.Count() != 0)
            {
                return View(articulos);
            }
            else
            {
                return RedirectToAction(nameof(ArticuloNoEncontrado));
            }



        }

        // GET: Articulos/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos.Include(m => m.Vendedor)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }

        public async Task<IActionResult> Articulo(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }


        // GET: Articulos/Create
        public IActionResult Create()
        {
            return View();
        }
        public IActionResult CrearArticulo()
        {
            return View();
        }

        // POST: Articulos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nombre,Descripcion,Precio,Estado,Categoria,Foto")] Articulo articulo)
        {
            if (ModelState.IsValid)
            {
                var usrActual = HttpContext.Session.GetInt32("UsuarioID");
                var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);
                articulo.Vendedor = usr;


                _context.Add(articulo);
                articulo.Estado = EstadoArticulo.EN_VENTA;
                await _context.SaveChangesAsync();

                if (articulo.Foto != null)
                {
                    //var uniqueFileName = GetUniqueFileName(model.MyImage.FileName);
                    var uploads = Path.Combine(hostingEnvironment.ContentRootPath, "wwwroot/photos");
                    var filePath = Path.Combine(uploads, articulo.Id + ".jpg");
                    articulo.Foto.CopyTo(new FileStream(filePath, FileMode.Create));

                    //to do : Save uniqueFileName  to your db table   
                }


                return RedirectToAction(nameof(Index));

            }
            return View(articulo);
        }

        public async Task<IActionResult> Comprar(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos
                .FirstOrDefaultAsync(m => m.Id == id);

            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ComprarArticulo(string id)
        {
            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

            var articulo = await _context.Articulos.FindAsync(id);

            articulo.Comprador = usr;
            articulo.Estado = EstadoArticulo.VENDIDO;

            var itemCarrito = await _context.ItemCarritos.Include(e => e.Articulo)
                .FirstOrDefaultAsync(e => e.Articulo.Id == id && e.Usuario.Dni ==  usrActual.Value);



            _context.Update(articulo);

            if (itemCarrito != null)
            {
                _context.Remove(itemCarrito);
                HttpContext.Session.SetString("CarritoActualizado", "true");
            }
            await _context.SaveChangesAsync();
            Thread.Sleep(3000);
            return RedirectToAction(nameof(Index));
            ////return View("Index");

        }

        // GET: Articulos/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos.FindAsync(id);
            if (articulo == null)
            {
                return NotFound();
            }
            
            return View(articulo);

        }

        // POST: Articulos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Nombre,Descripcion,Precio,Estado,Categoria,Foto")] Articulo articulo)
        {
            if (id != articulo.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(articulo);
                    await _context.SaveChangesAsync();

                    if (articulo.Foto != null)
                    {
                        //var uniqueFileName = GetUniqueFileName(model.MyImage.FileName);
                        var uploads = Path.Combine(hostingEnvironment.ContentRootPath, "wwwroot/photos");
                        var filePath = Path.Combine(uploads, articulo.Id + ".jpg");
                        articulo.Foto.CopyTo(new FileStream(filePath, FileMode.Create));

                        //to do : Save uniqueFileName  to your db table   
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ArticuloExists(articulo.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(articulo);
        }

        // GET: Articulos/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }

        // POST: Articulos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var articulo = await _context.Articulos.FindAsync(id);
            _context.Articulos.Remove(articulo);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ArticuloExists(string id)
        {
            return _context.Articulos.Any(e => e.Id == id);
        }


        // GET: Articulos/CancelarArticulo/5
        public async Task<IActionResult> CancelarArticulo(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }

        public async Task<IActionResult> Continuar(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos
                .FirstOrDefaultAsync(m => m.Id == id);



            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }
        [HttpPost, ActionName("Continuar")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ContinuarArticuloConfirmado(string id)
        {
            var articulo = await _context.Articulos.FindAsync(id);
            _context.Update(articulo);
            articulo.Estado = EstadoArticulo.EN_VENTA;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));


        }

        public async Task<IActionResult> AñadirAlCarrito(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulo = await _context.Articulos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (articulo == null)
            {
                return NotFound();
            }

            return View(articulo);
        }

        [HttpPost, ActionName("AñadirAlCarrito")]
        [ValidateAntiForgeryToken]
        //public async Task<IActionResult> CancelarArticuloConfirmado(string id, [Bind("Id,Nombre,Descripcion,Precio,Estado,Categoria")] Articulo articulo)
        public async Task<IActionResult> AñadirAlCarritoConfirmado(string id)
        {

            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

            var articulo = await _context.Articulos.FindAsync(id);

            var itemCarrito = await _context.ItemCarritos
                .FirstOrDefaultAsync(m => m.Articulo == articulo && m.Usuario.Dni == usrActual.Value);

            if (itemCarrito == null)
            {
                var alCarrito = new ItemCarrito
                {
                    Cantidad = 1,
                    Articulo = articulo,
                    Usuario = usr
                };
                _context.ItemCarritos.Add(alCarrito);
                await _context.SaveChangesAsync();

            }
            return RedirectToAction(nameof(Index));
        }





        // POST: Articulos/Delete/5
        [HttpPost, ActionName("CancelarArticulo")]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> CancelarArticuloConfirmado(string id)
        {
            var articulo = await _context.Articulos.FindAsync(id);
            _context.Update(articulo);
            articulo.Estado = EstadoArticulo.CANCELADO;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));


        }

        public async Task<IActionResult> MisVentas()
        {


            var usuario = HttpContext.Session.GetInt32("UsuarioID");
            var misVentas = await (from art in _context.Articulos where art.Vendedor.Dni.Equals(usuario) select art).Include(art => art.Vendedor).ToListAsync();

            
            
            return View(model: misVentas);
        }


        public async Task<IActionResult> MisCompras()
        {


            var usuario = HttpContext.Session.GetInt32("UsuarioID");
            var misCompras = await (from art in _context.Articulos where art.Comprador.Dni.Equals(usuario) && art.Comprador.Dni.Equals(usuario) select art).Include(art => art.Vendedor).ToListAsync();
           
            

            return View(model: misCompras);
        }

        public Articulo GetArticuloFromId(String id)
        {
            var articulo = _context.Articulos.Find(id);


            return articulo;
        }
    }
}
