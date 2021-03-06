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
    
    public partial class EMPLEADOS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EMPLEADOS()
        {
            this.ENTRENADORES = new HashSet<ENTRENADORES>();
            this.JUGADORES = new HashSet<JUGADORES>();
        }
    
        public string DNI { get; set; }
        public string Nombres { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Telefono1 { get; set; }
        public string Telefono2 { get; set; }
        public string Correo { get; set; }
        public Nullable<short> AnhoNacimiento { get; set; }
        public Nullable<short> Valoracion { get; set; }
        public string Curriculum { get; set; }
        public Nullable<int> EquipoID { get; set; }
    
        public virtual EQUIPOS EQUIPOS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ENTRENADORES> ENTRENADORES { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<JUGADORES> JUGADORES { get; set; }
    }
}
