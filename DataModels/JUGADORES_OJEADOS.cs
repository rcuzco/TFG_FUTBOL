using System;

namespace TFG_FUTBOL.DataModels
{
    public class JUGADORES_OJEADOS 
    {
        public string DNI { get; set; }
        public string Posicion { get; set; }
        public string PiernaDominante { get; set; }
        public Nullable<decimal> ValorDeMercado { get; set; }
        public Nullable<System.DateTime> VencimientoContrato { get; set; }
        public Nullable<short> Altura { get; set; }
        public Nullable<short> Peso { get; set; }
        public Nullable<bool> EnPrestamo { get; set; }
    }
}