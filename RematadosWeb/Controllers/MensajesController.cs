using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using RematadosWeb.Context;
using RematadosWeb.Models;
using Microsoft.AspNetCore.Http;

namespace RematadosWeb.Controllers
{
    public class MensajesController : Controller
    {
        private readonly RematadosDatabaseContext _context;

        public MensajesController(RematadosDatabaseContext context)
        {
            _context = context;
        }

        // GET: Mensajes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Mensajes.ToListAsync());
        }

        // GET: Mensajes/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mensaje = await _context.Mensajes
                .FirstOrDefaultAsync(m => m.Id == id);
            if (mensaje == null)
            {
                return NotFound();
            }

            return View(mensaje);
        }

        // GET: Mensajes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Mensajes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Texto,Fechahora")] Mensaje mensaje)
        {
            if (ModelState.IsValid)
            {
                _context.Add(mensaje);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(mensaje);
        }

        // GET: Mensajes/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mensaje = await _context.Mensajes.FindAsync(id);
            if (mensaje == null)
            {
                return NotFound();
            }
            return View(mensaje);
        }

        // POST: Mensajes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Texto,Fechahora")] Mensaje mensaje)
        {
            if (id != mensaje.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(mensaje);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MensajeExists(mensaje.Id))
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
            return View(mensaje);
        }

        // GET: Mensajes/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mensaje = await _context.Mensajes
                .FirstOrDefaultAsync(m => m.Id == id);
            if (mensaje == null)
            {
                return NotFound();
            }

            return View(mensaje);
        }

        // POST: Mensajes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var mensaje = await _context.Mensajes.FindAsync(id);
            _context.Mensajes.Remove(mensaje);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MensajeExists(string id)
        {
            return _context.Mensajes.Any(e => e.Id == id);
        }


        public  IActionResult MensajesOperacion(String id)        {

            
            dynamic conversacion = new ExpandoObject();
            var art = new ArticulosController(_context).GetArticuloFromId(id);
            conversacion.Articulo = art;
            conversacion.Mensajes = (from mess in _context.Mensajes where mess.Articulo.Equals(art) orderby mess.Fechahora ascending select mess).Include(mess => mess.Usuario).ToList();

            return  View(model: conversacion);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> NuevoMensaje([Bind("Id,Texto,Fechahora")] Mensaje mensaje)
        {
          
            var usrActual = HttpContext.Session.GetInt32("UsuarioID");
            var usr = new UsuariosController(_context).GetUsuarioFromId(usrActual.Value);
            mensaje.Usuario = usr;
            mensaje.Fechahora = DateTime.Now;
            var artid = Request.Form["ArticuloId"];
            var art = new ArticulosController(_context).GetArticuloFromId(artid);
            mensaje.Articulo = art;
            
            if (ModelState.IsValid)
            {
                _context.Add(mensaje);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(MensajesOperacion),new { id = artid });
            }

            return RedirectToAction("MensajesOperacion", artid);
        }

    }
}
