using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TFG_FUTBOL.DataContext;
using TFG_FUTBOL.DataModels;
using TFG_FUTBOL.Models;

namespace TFG_FUTBOL.Controllers
{
    public class EMPLEADOSController : Controller
    {
        private readonly TfgFutbolDataContext _context;

        public EMPLEADOSController(TfgFutbolDataContext context)
        {
            _context = context;
        }

        // GET: EMPLEADOS
        public async Task<IActionResult> Index()
        {
            return View(await _context.EMPLEADOS.ToListAsync());
        }

        // GET: EMPLEADOS/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var eMPLEADOS = await _context.EMPLEADOS
                .FirstOrDefaultAsync(m => m.DNI == id);
            if (eMPLEADOS == null)
            {
                return NotFound();
            }

            return View(eMPLEADOS);
        }

        // GET: EMPLEADOS/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: EMPLEADOS/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,Curriculum,EquipoID")] EMPLEADOS eMPLEADOS)
        {
            if (ModelState.IsValid)
            {
                _context.Add(eMPLEADOS);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(eMPLEADOS);
        }

        // GET: EMPLEADOS/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var eMPLEADOS = await _context.EMPLEADOS.FindAsync(id);
            if (eMPLEADOS == null)
            {
                return NotFound();
            }
            return View(eMPLEADOS);
        }

        // POST: EMPLEADOS/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,Curriculum,EquipoID")] EMPLEADOS eMPLEADOS)
        {
            if (id != eMPLEADOS.DNI)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(eMPLEADOS);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EMPLEADOSExists(eMPLEADOS.DNI))
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
            return View(eMPLEADOS);
        }

        // GET: EMPLEADOS/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var eMPLEADOS = await _context.EMPLEADOS
                .FirstOrDefaultAsync(m => m.DNI == id);
            if (eMPLEADOS == null)
            {
                return NotFound();
            }

            return View(eMPLEADOS);
        }

        // POST: EMPLEADOS/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var eMPLEADOS = await _context.EMPLEADOS.FindAsync(id);
            _context.EMPLEADOS.Remove(eMPLEADOS);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EMPLEADOSExists(string id)
        {
            return _context.EMPLEADOS.Any(e => e.DNI == id);
        }

       
    }
}
