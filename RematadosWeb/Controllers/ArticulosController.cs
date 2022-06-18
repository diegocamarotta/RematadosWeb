using System;
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

namespace RematadosWeb.Controllers
{
    public class ArticulosController : Controller
    {
        private readonly RematadosDatabaseContext _context;

        public ArticulosController(RematadosDatabaseContext context)
        {
            _context = context;
        }

        // GET: Articulos
        public async Task<IActionResult> Index()
        {
            return View(await _context.Articulos.ToListAsync());
        }

        // GET: Articulos/Details/5
        public async Task<IActionResult> Details(string id)
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
        public async Task<IActionResult> Create([Bind("Id,Nombre,Descripcion,Precio,Estado,Categoria")] Articulo articulo)
        {
            if (ModelState.IsValid)
            {
                _context.Add(articulo);
                articulo.Estado = EstadoArticulo.EN_VENTA;
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
                
            }
            return View(articulo);
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
        public async Task<IActionResult> Edit(string id, [Bind("Id,Nombre,Descripcion,Precio,Estado,Categoria")] Articulo articulo)
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
            var articulo = await _context.Articulos.FindAsync(id);
            // _context.Update(articulo);
            var itemCarrito = await _context.ItemCarritos
                .FirstOrDefaultAsync(m => m.Articulo == articulo);

            var cant = Request.Form["Cantidad"];
            if (cant == "") {
                
                return RedirectToAction(nameof(Index));
            }
            int cantInt = Int32.Parse(cant);

            if (itemCarrito == null)
            {
                var alCarrito = new ItemCarrito
                {
                Cantidad = cantInt,
                Articulo = articulo
                };
                _context.ItemCarritos.Add(alCarrito);
                await _context.SaveChangesAsync();

            }
            return RedirectToAction(nameof(Index));
           }

  



        // POST: Articulos/Delete/5
        [HttpPost, ActionName("CancelarArticulo")]
        [ValidateAntiForgeryToken]
       //public async Task<IActionResult> CancelarArticuloConfirmado(string id, [Bind("Id,Nombre,Descripcion,Precio,Estado,Categoria")] Articulo articulo)
        public async Task<IActionResult> CancelarArticuloConfirmado(string id)
        {
            var articulo = await _context.Articulos.FindAsync(id);
            _context.Update(articulo);
            articulo.Estado = EstadoArticulo.CANCELADO;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));

  
        }


    }
}
