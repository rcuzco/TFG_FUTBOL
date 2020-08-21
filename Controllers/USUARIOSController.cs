using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TFG_FUTBOL.DataContext;
using TFG_FUTBOL.DataModels;
using TFG_FUTBOL.Helpers;

namespace TFG_FUTBOL.Controllers
{
    [Authorize]
    public class USUARIOSController : Controller
    {
        private readonly TfgFutbolDataContext _context;
        private readonly IHostingEnvironment _hostingEnvironment;

        public USUARIOSController(TfgFutbolDataContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }

        // GET: USUARIOS
        public async Task<IActionResult> Index()
        {
            
            return View(await _context.USUARIOS.ToListAsync());
        }

        // GET: USUARIOS/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var uSUARIOS = await _context.USUARIOS
                .FirstOrDefaultAsync(m => m.ID == id);
            if (uSUARIOS == null)
            {
                return NotFound();
            }
            ViewData["usuarioLogado"] = uSUARIOS.Nombres;
            return View(uSUARIOS);
        }

        // GET: USUARIOS/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: USUARIOS/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ID,Nombres,PrimerApellido,SegundoApellido,NombreUsuario,Contrasenha,Correo")] USUARIOS uSUARIOS)
        {
            if (ModelState.IsValid)
            {
                _context.Add(uSUARIOS);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(uSUARIOS);
        }

        // GET: USUARIOS/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var uSUARIOS = await _context.USUARIOS.FindAsync(id);
            if (uSUARIOS == null)
            {
                return NotFound();
            }
            return View(uSUARIOS);
        }

        // POST: USUARIOS/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ID,Nombres,PrimerApellido,SegundoApellido,NombreUsuario,Contrasenha,Correo")] USUARIOS uSUARIOS)
        {
            if (id != uSUARIOS.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var usuario = _context.USUARIOS.Find(id);
                    _context.USUARIOS.Update(usuario);                    
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!USUARIOSExists(uSUARIOS.ID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Details), new { id = id });
            }
            return View(uSUARIOS);
        }

        [AllowAnonymous]
        [HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Authenticate([Bind("NombreUsuario,Contrasenha")] USUARIOS uSUARIOS)
        public async Task<IActionResult> Authenticate([FromBody]USUARIOS uSUARIOS)
        {            
            USUARIOS usuarioEncontrado = null;
            if (ModelState.IsValid)
            {
                try
                {
                    usuarioEncontrado = await _context.USUARIOS.FirstOrDefaultAsync(u => u.NombreUsuario == uSUARIOS.NombreUsuario && u.Contrasenha == uSUARIOS.Contrasenha);
                    if (usuarioEncontrado == null)
                    {
                        ViewData["ValidacionUsuario"] = "Credenciales incorrectas. Revise e intente otra vez.";
                        return View("Login", uSUARIOS);
                    }
                }
                catch (Exception ex)
                {
                    return BadRequest($"Error validando datos de usuario: {ex.Message}");
                }

                ViewData["usuarioLogado"] = usuarioEncontrado.Nombres;
                HttpContext.Session.SetString("UsuarioLogadoNombre", usuarioEncontrado.NombreUsuario);
                HttpContext.Session.SetString("UsuarioLogadoPassword", usuarioEncontrado.Contrasenha);
                HttpContext.Session.SetInt32("UsuarioLogadoID", usuarioEncontrado.ID);
                return Ok($"{this.Request.Scheme}://{this.Request.Host}{this.Request.PathBase}/USUARIOS/{nameof(Details)}/{usuarioEncontrado.ID}");
            }
            return View("~/Views/Login/Login.cshtml", uSUARIOS);
        }

        [AllowAnonymous]
        public IActionResult Login()
        {
            return View("~/Views/Login/Login.cshtml");
        }

        // GET: USUARIOS/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var uSUARIOS = await _context.USUARIOS
                .FirstOrDefaultAsync(m => m.ID == id);
            if (uSUARIOS == null)
            {
                return NotFound();
            }

            return View(uSUARIOS);
        }

        // POST: USUARIOS/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var uSUARIOS = await _context.USUARIOS.FindAsync(id);
            _context.USUARIOS.Remove(uSUARIOS);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool USUARIOSExists(int id)
        {
            return _context.USUARIOS.Any(e => e.ID == id);
        }

        [HttpPost]        
        public IActionResult Logout()
        {
            ViewData["usuarioLogado"] = null;
            HttpContext.Session.Clear();            
            return View("~/Views/Login/Login.cshtml");
        }
    }
}
