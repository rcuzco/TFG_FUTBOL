using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TFG_FUTBOL.DataContext;
using TFG_FUTBOL.DataModels;

namespace TFG_FUTBOL.Controllers
{
    [Authorize]
    public class CLUBController : Controller
    {
        private readonly TfgFutbolDataContext _context;

        public CLUBController(TfgFutbolDataContext context)
        {
            _context = context;
        }

        // GET: CLUB
        public async Task<IActionResult> Index()
        {
            return View(await _context.CLUB.ToListAsync());
        }

        // GET: CLUB/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cLUB = await _context.CLUB
                .FirstOrDefaultAsync(m => m.ID == id);
            if (cLUB == null)
            {
                return NotFound();
            }

            return View(cLUB);
        }

        // GET: CLUB/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: CLUB/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ID,Correo,Telefono,Direccion")] CLUB cLUB)
        {
            if (ModelState.IsValid)
            {
                _context.Add(cLUB);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(cLUB);
        }

        // GET: CLUB/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cLUB = await _context.CLUB.FindAsync(id);
            if (cLUB == null)
            {
                return NotFound();
            }
            return View(cLUB);
        }

        // POST: CLUB/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ID,Correo,Telefono,Direccion")] CLUB cLUB)
        {
            if (id != cLUB.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cLUB);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CLUBExists(cLUB.ID))
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
            return View(cLUB);
        }

        // GET: CLUB/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cLUB = await _context.CLUB
                .FirstOrDefaultAsync(m => m.ID == id);
            if (cLUB == null)
            {
                return NotFound();
            }

            return View(cLUB);
        }

        // POST: CLUB/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cLUB = await _context.CLUB.FindAsync(id);
            _context.CLUB.Remove(cLUB);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CLUBExists(int id)
        {
            return _context.CLUB.Any(e => e.ID == id);
        }
    }
}
