using System.ComponentModel.DataAnnotations;

namespace TFG_FUTBOL.DataModels
{
    public class OJEADOS
    {
        [Key]
        [Required(ErrorMessage = "Este campo es requerido")]
        public string DNI { get; set; }
        [Required(ErrorMessage = "Este campo es requerido")]
        public string Nombres { get; set; }
        [Required(ErrorMessage = "Este campo es requerido")]
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Telefono1 { get; set; }
        public string Telefono2 { get; set; }
        [Required(ErrorMessage = "Este campo es requerido")]
        public string Correo { get; set; }
        public short? AnhoNacimiento { get; set; }
        public short? Valoracion { get; set; }
        public int? IdClub { get; set; }
        public string Foto { get; set; }
        public string Club { get; set; }
        public string Pasaporte { get; set; }
        public string PaisNacimiento { get; set; }

    }
}