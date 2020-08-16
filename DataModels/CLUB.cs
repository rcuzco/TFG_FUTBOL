using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TFG_FUTBOL.DataModels
{
    public class CLUB
    {
        [Key]
        public int ID { get; set; }
        
        [Required(ErrorMessage = "Este campo es requerido")]
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }        
    }
}