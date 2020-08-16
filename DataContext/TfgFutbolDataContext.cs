using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TFG_FUTBOL.DataModels;
using TFG_FUTBOL.Models;

namespace TFG_FUTBOL.DataContext
{
    public class TfgFutbolDataContext : DbContext
    {
        public TfgFutbolDataContext(DbContextOptions<TfgFutbolDataContext> options) : base(options)
        {
        }

        public virtual DbSet<CLUB> CLUB { get; set; }
        public virtual DbSet<EMPLEADOS_OJEADOS> EMPLEADOS_OJEADOS { get; set; }
        public virtual DbSet<JUGADORES_OJEADOS> JUGADORES_OJEADOS { get; set; }
        public virtual DbSet<OJEADOS> OJEADOS { get; set; }

        public virtual DbSet<EMPLEADOS> EMPLEADOS { get; set; }

        public virtual DbSet<USUARIOS> USUARIOS { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CLUB>().HasKey(c => new { c.ID });
            modelBuilder.Entity<OJEADOS>().HasKey(c=> new { c.DNI });
            modelBuilder.Entity<EMPLEADOS>().HasKey(c => new { c.DNI });
            modelBuilder.Entity<JUGADORES_OJEADOS>().HasKey(c => new { c.DNI });
            modelBuilder.Entity<EMPLEADOS_OJEADOS>().HasKey(c => new { c.DNI });
            modelBuilder.Entity<USUARIOS>().HasKey(c => new { c.ID });
            modelBuilder.Entity<JugadoresOjeadosViewModel>().Ignore(c => c.ArchivoFoto);
            base.OnModelCreating(modelBuilder);
        }

        public DbSet<TFG_FUTBOL.Models.JugadoresOjeadosViewModel> JugadoresOjeadosViewModel { get; set; }
    }
}
