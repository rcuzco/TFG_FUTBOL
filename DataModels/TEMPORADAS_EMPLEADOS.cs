using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TFG_FUTBOL.DataModels
{
    public class TEMPORADAS_EMPLEADOS
    {
        [Key]
        public string DNI { get; set; }
        [Key]
        public string Temporada { get; set; }
        public Nullable<short> PartidosJugados { get; set; }
        public Nullable<short> Victorias { get; set; }
        public Nullable<short> Derrotas { get; set; }
        public Nullable<short> Empates { get; set; }
        public Nullable<short> Puntos { get; set; }
        public Nullable<short> Competicion { get; set; }
        public string Club { get; set; }

        public virtual EMPLEADOS_OJEADOS EMPLEADOS_OJEADOS { get; set; }
    }
}
