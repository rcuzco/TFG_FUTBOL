using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TFG_FUTBOL.DataModels
{
    public partial class USUARIOS
    {
        public int ID { get; set; }
        public string Nombres { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        [Required(ErrorMessage = "Este campo es requerido")]
        public string NombreUsuario { get; set; }
        
        [Required(ErrorMessage = "Este campo es requerido")]
        public string Contrasenha { get; set; }
        public string Correo { get; set; }
    }
}
