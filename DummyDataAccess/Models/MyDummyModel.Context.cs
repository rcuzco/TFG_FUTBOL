﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DummyDataAccess.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TFG_FUTBOLEntities : DbContext
    {
        public TFG_FUTBOLEntities()
            : base("name=TFG_FUTBOLEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CLUB> CLUB { get; set; }
        public virtual DbSet<EMPLEADOS> EMPLEADOS { get; set; }
        public virtual DbSet<EMPLEADOS_OJEADOS> EMPLEADOS_OJEADOS { get; set; }
        public virtual DbSet<ENTRENADORES> ENTRENADORES { get; set; }
        public virtual DbSet<EQUIPOS> EQUIPOS { get; set; }
        public virtual DbSet<JUGADORES> JUGADORES { get; set; }
        public virtual DbSet<JUGADORES_OJEADOS> JUGADORES_OJEADOS { get; set; }
        public virtual DbSet<OJEADOS> OJEADOS { get; set; }
        public virtual DbSet<TEMPORADAS_EMPLEADOS> TEMPORADAS_EMPLEADOS { get; set; }
        public virtual DbSet<TEMPORADAS_JUGADORES> TEMPORADAS_JUGADORES { get; set; }
        public virtual DbSet<USUARIOS> USUARIOS { get; set; }
    }
}