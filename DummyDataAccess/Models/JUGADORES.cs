//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class JUGADORES
    {
        public int ID { get; set; }
        public string Posicion { get; set; }
        public string PiernaDominante { get; set; }
        public Nullable<short> Goles { get; set; }
        public Nullable<short> PartidosTitular { get; set; }
        public string EmpleadoDNI { get; set; }
    
        public virtual EMPLEADOS EMPLEADOS { get; set; }
    }
}
