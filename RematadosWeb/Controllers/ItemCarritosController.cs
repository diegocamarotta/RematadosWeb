using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using RematadosWeb.Context;
using RematadosWeb.Models;

namespace RematadosWeb.Controllers
{
    public class ItemCarritosController : Controller
    {
        private readonly RematadosDatabaseContext _context;

        public ItemCarritosController(RematadosDatabaseContext context)
        {
            _context = context;
        }


        
        
        // GET: ItemCarritos
        public async Task<IActionResult> Index()

        {

            var usrActual = HttpContext.Session.GetInt32("UsuarioID");


            var misItems = await (from items in _context.ItemCarritos where items.Usuario.Dni.Equals(usrActual) select items).Include(items => items.Articulo).ToListAsync();
            

            return View(model: misItems);



        }

     
        //public async Task<IActionResult> ConfirmarCompra()

        //{

        //    var usrActual = HttpContext.Session.GetInt32("UsuarioID");

        //    var misItems = (from items in _context.ItemCarritos where items.Usuario.Dni.Equals(usrActual) select items).Include(items => items.Articulo).ToList();

        //    return View(model: misItems);

        //}





        //[HttpPost, ActionName("ConfirmarCompra")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> ConfirmarCompraOk()
        //{
        //    var usrActual = HttpContext.Session.GetInt32("UsuarioID");
        //    var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

        //    var misItems = (from items in _context.ItemCarritos where items.Usuario.Dni.Equals(usrActual) select items).Include(items => items.Articulo).ToList();
           

        //    var artController = new ArticulosController(_context);
        //    List<Articulo> articulos = new List<Articulo>();
            
        //    foreach (var item in misItems) {
        //       var articulo =  artController.GetArticuloFromId(item.Articulo.Id);
        //       articulos.Add(articulo);
    
        //    }

        //    foreach (var a in articulos) {
        //        a.Comprador = usr;
        //        a.Estado = EstadoArticulo.VENDIDO;
        //        _context.Update(a);
        //    }

            

        //    await _context.SaveChangesAsync();
        //    //return RedirectToAction(nameof(Index));
        //    return View("Index");

        //}



        // GET: ItemCarritos/Details/5
        public async Task<IActionResult> Details(string id)
        {


            if (id == null)
            {
                return NotFound();
            }

            var itemCarrito = await _context.ItemCarritos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (itemCarrito == null)
            {
                return NotFound();
            }

            return View(itemCarrito);
        }

        // GET: ItemCarritos/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ItemCarritos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Cantidad")] ItemCarrito itemCarrito)
        {
            if (ModelState.IsValid)
            {
                _context.Add(itemCarrito);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(itemCarrito);
        }

        // GET: ItemCarritos/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var itemCarrito = await _context.ItemCarritos.FindAsync(id);
            if (itemCarrito == null)
            {
                return NotFound();
            }
            return View(itemCarrito);
        }

        // POST: ItemCarritos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Cantidad")] ItemCarrito itemCarrito)
        {
            if (id != itemCarrito.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(itemCarrito);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ItemCarritoExists(itemCarrito.Id))
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
            return View(itemCarrito);
        }

        // GET: ItemCarritos/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var itemCarrito = await _context.ItemCarritos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (itemCarrito == null)
            {
                return NotFound();
            }

            return View(itemCarrito);
        }

        // POST: ItemCarritos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var itemCarrito = await _context.ItemCarritos.FindAsync(id);
            _context.ItemCarritos.Remove(itemCarrito);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ItemCarritoExists(string id)
        {
            return _context.ItemCarritos.Any(e => e.Id == id);
        }

        public async Task<IActionResult> ComprarTodo()
        {
            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);

            var misItems = (from items in _context.ItemCarritos where items.Usuario.Dni.Equals(usrActual) select items).Include(items => items.Articulo).ToList();

            var artController = new ArticulosController(_context);

            foreach (var item in misItems) {
                var esteArticulo = artController.GetArticuloFromId(item.Articulo.Id);

                esteArticulo.Comprador = usr;
                esteArticulo.Estado = EstadoArticulo.VENDIDO;
                _context.Update(esteArticulo);
                _context.Remove(item);
                await _context.SaveChangesAsync();


            }

            Thread.Sleep(3000);
            return RedirectToAction(nameof(Index));
        }
    }
}

