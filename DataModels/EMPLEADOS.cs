using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TFG_FUTBOL.DataModels
{
    public class EMPLEADOS
    {
        [Key]
        [Required(ErrorMessage = "Este campo es requerido")]
        public string DNI { get; set; }
        
        [Required(ErrorMessage = "Este campo es requerido")]
        public string Nombres { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Telefono1 { get; set; }
        public string Telefono2 { get; set; }

        [Required(ErrorMessage = "Este campo es requerido")]
        public string Correo { get; set; }
        public Nullable<short> AnhoNacimiento { get; set; }
        public Nullable<short> Valoracion { get; set; }
        public string Curriculum { get; set; }
        public Nullable<int> EquipoID { get; set; }
    }
}
