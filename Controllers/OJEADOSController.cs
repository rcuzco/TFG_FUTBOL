using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TFG_FUTBOL.DataContext;
using TFG_FUTBOL.DataModels;
using TFG_FUTBOL.Models;

namespace TFG_FUTBOL.Controllers
{
    [Authorize]
    public class OJEADOSController : Controller
    {
        private readonly TfgFutbolDataContext _context;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment webHostEnvironment;

        public OJEADOSController(TfgFutbolDataContext context, IMapper mapper, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _mapper = mapper;
            webHostEnvironment = hostEnvironment;
        }

        // GET: OJEADOS
        public async Task<IActionResult> Index()
        {
            return View(await _context.OJEADOS.ToListAsync());
        }

        // GET: OJEADOS/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var oJEADOS = await _context.OJEADOS
                .FirstOrDefaultAsync(m => m.DNI == id);
            if (oJEADOS == null)
            {
                return NotFound();
            }

            return View(oJEADOS);
        }

        // GET: OJEADOS/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: OJEADOS/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,IdClub")] OJEADOS oJEADOS)
        {
            if (ModelState.IsValid)
            {
                _context.Add(oJEADOS);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(oJEADOS);
        }

        // GET: OJEADOS/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var oJEADOS = await _context.OJEADOS.FindAsync(id);
            if (oJEADOS == null)
            {
                return NotFound();
            }
            return View(oJEADOS);
        }

        // POST: OJEADOS/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,IdClub")] OJEADOS oJEADOS)
        {
            if (id != oJEADOS.DNI)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(oJEADOS);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OJEADOSExists(oJEADOS.DNI))
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
            return View(oJEADOS);
        }

        // GET: OJEADOS/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var oJEADOS = await _context.OJEADOS
                .FirstOrDefaultAsync(m => m.DNI == id);
            if (oJEADOS == null)
            {
                return NotFound();
            }

            return View(oJEADOS);
        }

        // POST: OJEADOS/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var oJEADOS = await _context.OJEADOS.FindAsync(id);
            _context.OJEADOS.Remove(oJEADOS);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OJEADOSExists(string id)
        {
            return _context.OJEADOS.Any(e => e.DNI == id);
        }

        public IActionResult BusquedaAvanzada()
        {

            var jugadoresOjeados = _context.JUGADORES_OJEADOS.ToList();
            var ojeados = _context.OJEADOS.Where(j => jugadoresOjeados.Select(d => d.DNI).Contains(j.DNI));

            var datosADevolver = (from jo in jugadoresOjeados
                                  join o in ojeados on jo.DNI equals o.DNI
                                  select new JugadoresOjeadosViewModel
                                  {
                                      DNI = o.DNI,
                                      Nombres = o.Nombres,
                                      PrimerApellido = o.PrimerApellido,
                                      SegundoApellido = o.SegundoApellido,
                                      Telefono1 = o.Telefono1,
                                      Telefono2 = o.Telefono2,
                                      Correo = o.Correo,
                                      AnhoNacimiento = o.AnhoNacimiento,
                                      Valoracion = o.Valoracion,
                                      Foto = o.Foto,
                                      IdClub = o.IdClub,
                                      Club = o.Club,                                      
                                      Pasaporte = o.Pasaporte,
                                      PaisNacimiento = o.PaisNacimiento,
                                      Posicion = jo.Posicion,
                                      PiernaDominante = jo.PiernaDominante,
                                      ValorDeMercado = jo.ValorDeMercado,
                                      VencimientoContrato = jo.VencimientoContrato,
                                      Altura = jo.Altura,
                                      Peso = jo.Peso,
                                      EnPrestamo = jo.EnPrestamo
                                  });



            return View(datosADevolver);
        }

        public IActionResult BusquedaAvanzadaEmpleados()
        {

            var empleadosOjeados = _context.EMPLEADOS_OJEADOS.ToList();
            var ojeados = _context.OJEADOS.Where(j => empleadosOjeados.Select(d => d.DNI).Contains(j.DNI));

            var datosADevolver = (from eo in empleadosOjeados
                                  join o in ojeados on eo.DNI equals o.DNI
                                  select new EmpleadosOjeadosViewModel
                                  {
                                      DNI = o.DNI,
                                      Nombres = o.Nombres,
                                      PrimerApellido = o.PrimerApellido,
                                      SegundoApellido = o.SegundoApellido,
                                      Telefono1 = o.Telefono1,
                                      Telefono2 = o.Telefono2,
                                      Correo = o.Correo,
                                      AnhoNacimiento = o.AnhoNacimiento,
                                      Valoracion = o.Valoracion,
                                      Foto = o.Foto,
                                      IdClub = o.IdClub,
                                      Club = o.Club,
                                      Pasaporte = o.Pasaporte,
                                      PaisNacimiento = o.PaisNacimiento,
                                      Experiencia = eo.Experiencia,
                                      Formacion = eo.Formacion
                                  });
            return View(datosADevolver);

        }

        public async Task<IActionResult> DetallesRegistro(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            JugadoresOjeadosViewModel jugadoresOjeadosViewModel = new JugadoresOjeadosViewModel();
            var o = await _context.OJEADOS.FirstOrDefaultAsync(m => m.DNI == id);
            var jo = await _context.JUGADORES_OJEADOS.FirstOrDefaultAsync(d => d.DNI == id);
            if (o != null)
            {

                jugadoresOjeadosViewModel.AnhoNacimiento = o.AnhoNacimiento;
                jugadoresOjeadosViewModel.DNI = o.DNI;
                jugadoresOjeadosViewModel.Correo = o.Correo;
                jugadoresOjeadosViewModel.Foto = o.Foto;
                jugadoresOjeadosViewModel.Nombres = o.Nombres;
                jugadoresOjeadosViewModel.Telefono1 = o.Telefono1;
                jugadoresOjeadosViewModel.Telefono2 = o.Telefono2;
                jugadoresOjeadosViewModel.Valoracion = o.Valoracion;
            }

            if (jo != null)
            {
                jugadoresOjeadosViewModel.Altura = jo.Altura;
                jugadoresOjeadosViewModel.Club = o.Club;
                jugadoresOjeadosViewModel.EnPrestamo = jo.EnPrestamo;
                //jugadoresOjeadosViewModel.Goles = jo.Goles;
                jugadoresOjeadosViewModel.PaisNacimiento = o.PaisNacimiento;
                //jugadoresOjeadosViewModel.PartidosJugados = jo.PartidosJugados;
                jugadoresOjeadosViewModel.Pasaporte = o.Pasaporte;
                jugadoresOjeadosViewModel.Peso = jo.Peso;
                jugadoresOjeadosViewModel.PiernaDominante = jo.PiernaDominante;
                jugadoresOjeadosViewModel.Posicion = jo.Posicion;
                jugadoresOjeadosViewModel.PrimerApellido = o.PrimerApellido;
                jugadoresOjeadosViewModel.SegundoApellido = o.SegundoApellido;
                jugadoresOjeadosViewModel.ValorDeMercado = jo.ValorDeMercado;
                jugadoresOjeadosViewModel.VencimientoContrato = jo.VencimientoContrato;
            }




            return View(jugadoresOjeadosViewModel);
        }

        public async Task<IActionResult> EditarRegistro(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            JugadoresOjeadosViewModel jugadoresOjeadosViewModel = new JugadoresOjeadosViewModel();
            var o = await _context.OJEADOS.FirstOrDefaultAsync(m => m.DNI == id);
            var jo = await _context.JUGADORES_OJEADOS.FirstOrDefaultAsync(d => d.DNI == id);
            if (o != null)
            {

                jugadoresOjeadosViewModel.AnhoNacimiento  = o.AnhoNacimiento;
                jugadoresOjeadosViewModel.DNI             = o.DNI;
                jugadoresOjeadosViewModel.Correo          = o.Correo;
                jugadoresOjeadosViewModel.Foto            = o.Foto;
                jugadoresOjeadosViewModel.Nombres         = o.Nombres;
                jugadoresOjeadosViewModel.PrimerApellido  = o.PrimerApellido;
                jugadoresOjeadosViewModel.SegundoApellido = o.SegundoApellido;
                jugadoresOjeadosViewModel.Telefono1       = o.Telefono1;
                jugadoresOjeadosViewModel.Telefono2       = o.Telefono2;
                jugadoresOjeadosViewModel.Valoracion      = o.Valoracion;

            }

            if (jo != null)
            {
                jugadoresOjeadosViewModel.Altura              = jo.Altura;
                jugadoresOjeadosViewModel.Club                = o.Club;
                jugadoresOjeadosViewModel.EnPrestamo          = jo.EnPrestamo;
                //jugadoresOjeadosViewModel.Goles               = jo.Goles;
                jugadoresOjeadosViewModel.PaisNacimiento      = o.PaisNacimiento;
                //jugadoresOjeadosViewModel.PartidosJugados     = jo.PartidosJugados;
                jugadoresOjeadosViewModel.Pasaporte           = o.Pasaporte;
                jugadoresOjeadosViewModel.Peso                = jo.Peso;
                jugadoresOjeadosViewModel.PiernaDominante     = jo.PiernaDominante;
                jugadoresOjeadosViewModel.Posicion            = jo.Posicion;
                jugadoresOjeadosViewModel.ValorDeMercado      = jo.ValorDeMercado;
                jugadoresOjeadosViewModel.VencimientoContrato = jo.VencimientoContrato;
            }
            return View(jugadoresOjeadosViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditarRegistro(string id, [Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,IdClub,Posicion,PiernaDominante,Goles,Club,ValorDeMercado,VencimientoContrato,PartidosJugados,PaisNacimiento,Pasaporte,Altura,Peso,EnPrestamo,Foto,ArchivoFoto")] JugadoresOjeadosViewModel oJEADOS)
        {
            if (id != oJEADOS.DNI)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var o = _context.OJEADOS.FirstOrDefault(d => d.DNI == id);
                    var jo = _context.JUGADORES_OJEADOS.FirstOrDefault(d => d.DNI == id);
                    if (o != null)
                    {
                        o.AnhoNacimiento = oJEADOS.AnhoNacimiento;
                        o.Correo = oJEADOS.Correo;
                        //o.Foto = oJEADOS.Foto;
                        o.Foto = UploadedFile(oJEADOS) ?? o.Foto;
                        o.Nombres = oJEADOS.Nombres;
                        o.PrimerApellido = oJEADOS.PrimerApellido;
                        o.SegundoApellido = oJEADOS.SegundoApellido;
                        o.Telefono1 = oJEADOS.Telefono1;
                        o.Telefono2 = oJEADOS.Telefono2;
                        o.Valoracion = oJEADOS.Valoracion;
                    }

                    if (jo != null)
                    {
                        jo.Altura = oJEADOS.Altura;
                        o.Club = oJEADOS.Club;
                        jo.EnPrestamo = oJEADOS.EnPrestamo;
                        //jo.Goles = oJEADOS.Goles;
                        o.PaisNacimiento = oJEADOS.PaisNacimiento;
                        //jo.PartidosJugados = oJEADOS.PartidosJugados;
                        o.Pasaporte = oJEADOS.Pasaporte;
                        jo.Peso = oJEADOS.Peso;
                        jo.PiernaDominante = oJEADOS.PiernaDominante;
                        jo.Posicion = oJEADOS.Posicion;
                        jo.ValorDeMercado = oJEADOS.ValorDeMercado;
                        jo.VencimientoContrato = oJEADOS.VencimientoContrato;
                    }
                    _context.Update(o);
                    _context.Update(jo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OJEADOSExists(oJEADOS.DNI))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(BusquedaAvanzada));
            }
            return View(oJEADOS);
        }

        private string UploadedFile(JugadoresOjeadosViewModel model)
        {
            string uniqueFileName = null;

            if (model.ArchivoFoto != null)
            {
                string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, @"img\ojeados\jugadores");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.ArchivoFoto.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.ArchivoFoto.CopyTo(fileStream);
                }
            }
            return uniqueFileName;
        }


        public async Task<IActionResult> DetallesRegistroEmpleado(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            EmpleadosOjeadosViewModel jugadoresOjeadosViewModel = new EmpleadosOjeadosViewModel();
            var o = await _context.OJEADOS.FirstOrDefaultAsync(m => m.DNI == id);
            var jo = await _context.EMPLEADOS_OJEADOS.FirstOrDefaultAsync(d => d.DNI == id);
            if (o != null)
            {
                jugadoresOjeadosViewModel.DNI = o.DNI;
                jugadoresOjeadosViewModel.Nombres = o.Nombres;
                jugadoresOjeadosViewModel.PrimerApellido = o.PrimerApellido;
                jugadoresOjeadosViewModel.SegundoApellido = o.SegundoApellido;
                jugadoresOjeadosViewModel.Telefono1 = o.Telefono1;
                jugadoresOjeadosViewModel.Telefono2 = o.Telefono2;
                jugadoresOjeadosViewModel.Correo = o.Correo;
                jugadoresOjeadosViewModel.AnhoNacimiento = o.AnhoNacimiento;
                jugadoresOjeadosViewModel.Valoracion = o.Valoracion;
                jugadoresOjeadosViewModel.Foto = o.Foto;
                jugadoresOjeadosViewModel.Club = o.Club;
                jugadoresOjeadosViewModel.Pasaporte = o.Pasaporte;
                jugadoresOjeadosViewModel.PaisNacimiento = o.PaisNacimiento;
            }

            if (jo != null)
            {
                jugadoresOjeadosViewModel.Experiencia = jo.Experiencia;
                jugadoresOjeadosViewModel.Formacion = jo.Formacion;
            }

            return View(jugadoresOjeadosViewModel);
        }

        public async Task<IActionResult> EditarRegistroEmpleado(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            EmpleadosOjeadosViewModel jugadoresOjeadosViewModel = new EmpleadosOjeadosViewModel();
            var o = await _context.OJEADOS.FirstOrDefaultAsync(m => m.DNI == id);
            var jo = await _context.EMPLEADOS_OJEADOS.FirstOrDefaultAsync(d => d.DNI == id);
            if (o != null)
            {
                jugadoresOjeadosViewModel.DNI = o.DNI;
                jugadoresOjeadosViewModel.Nombres = o.Nombres;
                jugadoresOjeadosViewModel.PrimerApellido = o.PrimerApellido;
                jugadoresOjeadosViewModel.SegundoApellido = o.SegundoApellido;
                jugadoresOjeadosViewModel.Telefono1 = o.Telefono1;
                jugadoresOjeadosViewModel.Telefono2 = o.Telefono2;
                jugadoresOjeadosViewModel.Correo = o.Correo;
                jugadoresOjeadosViewModel.AnhoNacimiento = o.AnhoNacimiento;
                jugadoresOjeadosViewModel.Valoracion = o.Valoracion;
                jugadoresOjeadosViewModel.Foto = o.Foto;
                jugadoresOjeadosViewModel.Club = o.Club;
                jugadoresOjeadosViewModel.Pasaporte = o.Pasaporte;
                jugadoresOjeadosViewModel.PaisNacimiento = o.PaisNacimiento;
            }

            if (jo != null)
            {
                jugadoresOjeadosViewModel.Experiencia = jo.Experiencia;
                jugadoresOjeadosViewModel.Formacion = jo.Formacion;
            }
            return View(jugadoresOjeadosViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditarRegistroEmpleado(string id, [Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,IdClub,Club,PaisNacimiento,Pasaporte,Formacion,Experiencia,Foto,ArchivoFoto")] EmpleadosOjeadosViewModel oJEADOS)
        {
            if (id != oJEADOS.DNI)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var o = _context.OJEADOS.FirstOrDefault(d => d.DNI == id);
                    var jo = _context.EMPLEADOS_OJEADOS.FirstOrDefault(d => d.DNI == id);
                    if (o != null)
                    {
                        o.Nombres = oJEADOS.Nombres;
                        o.PrimerApellido = oJEADOS.PrimerApellido;
                        o.SegundoApellido = oJEADOS.SegundoApellido;
                        o.Telefono1 = oJEADOS.Telefono1;
                        o.Telefono2 = oJEADOS.Telefono2;
                        o.Correo = oJEADOS.Correo;
                        o.Valoracion = oJEADOS.Valoracion;                        
                        o.Foto = UploadedFileEmpleado(oJEADOS) ?? o.Foto;
                        o.AnhoNacimiento = oJEADOS.AnhoNacimiento;
                        o.Pasaporte = oJEADOS.Pasaporte;
                        o.PaisNacimiento = oJEADOS.PaisNacimiento;
                        o.Club = oJEADOS.Club;
                    }

                    if (jo != null)
                    {
                        jo.Formacion = oJEADOS.Formacion;
                        jo.Experiencia = oJEADOS.Experiencia;
                    }
                    _context.Update(o);
                    _context.Update(jo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OJEADOSExists(oJEADOS.DNI))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(BusquedaAvanzadaEmpleados));
            }
            return View(oJEADOS);
        }

        private string UploadedFileEmpleado(EmpleadosOjeadosViewModel model)
        {
            string uniqueFileName = null;

            if (model.ArchivoFoto != null)
            {
                string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, @"img\ojeados\empleados");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.ArchivoFoto.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.ArchivoFoto.CopyTo(fileStream);
                }
            }
            return uniqueFileName;
        }

        public IActionResult CrearRegistro()
        {
            JugadoresOjeadosViewModel jugadoresOjeadosViewModel = new JugadoresOjeadosViewModel();
            return View(jugadoresOjeadosViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CrearRegistro([Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,IdClub,Posicion,PiernaDominante,Goles,Club,ValorDeMercado,VencimientoContrato,PartidosJugados,PaisNacimiento,Pasaporte,Altura,Peso,EnPrestamo,Foto,ArchivoFoto")] JugadoresOjeadosViewModel oJEADOS)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    OJEADOS o = new OJEADOS();
                    JUGADORES_OJEADOS jo = new JUGADORES_OJEADOS();
                    
                    o.DNI = oJEADOS.DNI;                    
                    o.Nombres = oJEADOS.Nombres;
                    o.PrimerApellido = oJEADOS.PrimerApellido;
                    o.SegundoApellido = oJEADOS.SegundoApellido;
                    o.Telefono1 = oJEADOS.Telefono1;
                    o.Telefono2 = oJEADOS.Telefono2;
                    o.Correo = oJEADOS.Correo;
                    o.AnhoNacimiento = oJEADOS.AnhoNacimiento;
                    o.Valoracion = oJEADOS.Valoracion;
                    o.Foto = UploadedFile(oJEADOS) ?? o.Foto;
                    o.IdClub = oJEADOS.IdClub;
                    o.Club = oJEADOS.Club;
                    o.Pasaporte = oJEADOS.Pasaporte; 
                    o.PaisNacimiento = oJEADOS.PaisNacimiento;

                    jo.DNI = oJEADOS.DNI;
                    jo.Posicion = oJEADOS.Posicion;
                    jo.PiernaDominante = oJEADOS.PiernaDominante;
                    jo.ValorDeMercado = oJEADOS.ValorDeMercado;
                    jo.VencimientoContrato = oJEADOS.VencimientoContrato;
                    jo.Altura = oJEADOS.Altura;
                    jo.Peso = oJEADOS.Peso;
                    jo.EnPrestamo = oJEADOS.EnPrestamo;

                    _context.OJEADOS.Add(o);
                    await _context.SaveChangesAsync();
                    _context.JUGADORES_OJEADOS.Add(jo);
                    await _context.SaveChangesAsync();

                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
                return RedirectToAction(nameof(BusquedaAvanzada));
            }
            return View(oJEADOS);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CrearRegistroEmpleado([Bind("DNI,Nombres,PrimerApellido,SegundoApellido,Telefono1,Telefono2,Correo,AnhoNacimiento,Valoracion,IdClub,Club,PaisNacimiento,Pasaporte,Formacion,Experiencia,Foto,ArchivoFoto")] EmpleadosOjeadosViewModel oJEADOS)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    OJEADOS o = new OJEADOS();
                    EMPLEADOS_OJEADOS jo = new EMPLEADOS_OJEADOS();

                    o.DNI = oJEADOS.DNI;
                    o.Nombres = oJEADOS.Nombres;
                    o.PrimerApellido = oJEADOS.PrimerApellido;
                    o.SegundoApellido = oJEADOS.SegundoApellido;
                    o.Telefono1 = oJEADOS.Telefono1;
                    o.Telefono2 = oJEADOS.Telefono2;
                    o.Correo = oJEADOS.Correo;
                    o.AnhoNacimiento = oJEADOS.AnhoNacimiento;
                    o.Valoracion = oJEADOS.Valoracion;
                    o.Foto = UploadedFileEmpleado(oJEADOS) ?? o.Foto;
                    o.IdClub = oJEADOS.IdClub;
                    o.Club = oJEADOS.Club;
                    o.Pasaporte = oJEADOS.Pasaporte;
                    o.PaisNacimiento = oJEADOS.PaisNacimiento;

                    jo.DNI = oJEADOS.DNI;
                    jo.Formacion = oJEADOS.Formacion;
                    jo.Experiencia = oJEADOS.Experiencia;

                    _context.OJEADOS.Add(o);
                    await _context.SaveChangesAsync();
                    _context.EMPLEADOS_OJEADOS.Add(jo);
                    await _context.SaveChangesAsync();
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
                return RedirectToAction(nameof(BusquedaAvanzadaEmpleados));
            }
            return View(oJEADOS);
        }


        public IActionResult CrearRegistroEmpleado()
        {
            EmpleadosOjeadosViewModel jugadoresOjeadosViewModel = new EmpleadosOjeadosViewModel();
            return View(jugadoresOjeadosViewModel);
        }
    }
}
