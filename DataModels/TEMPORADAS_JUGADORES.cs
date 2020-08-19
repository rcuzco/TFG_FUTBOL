using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TFG_FUTBOL.DataModels
{
    public class TEMPORADAS_JUGADORES
    {
        public string DNI { get; set; }
        public string Temporada { get; set; }
        public string Club { get; set; }
        public string Competicion { get; set; }
        public Nullable<short> PartidosTitular { get; set; }
        public Nullable<short> PartidosSuplente { get; set; }
        public Nullable<short> PartidosConvocado { get; set; }
        public Nullable<short> MinutosJugados { get; set; }
        public Nullable<short> Goles { get; set; }
        public Nullable<short> TarjetasAmarillas { get; set; }
        public Nullable<short> TarjetasRojas { get; set; }        
    }
}
