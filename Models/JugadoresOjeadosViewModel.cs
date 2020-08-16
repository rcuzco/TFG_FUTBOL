using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using TFG_FUTBOL.DataModels;

namespace TFG_FUTBOL.Models
{
    public class JugadoresOjeadosViewModel
    {
        [DisplayName("Nombres completos")]
        public string NombresCompletos
        {
            get
            {
                return Nombres + " " + PrimerApellido + " " + SegundoApellido;
            }
        }
            

        [Key]
        public string DNI { get; set; }
        
        public string Nombres { get; set; }
        
        [DisplayName("1er Apellido")]
        public string PrimerApellido { get; set; }
        
        [DisplayName("2do Apellido")]
        public string SegundoApellido { get; set; }

        [DisplayName("Teléfono 1")]
        public string Telefono1 { get; set; }

        [DisplayName("Teléfono 2")]
        public string Telefono2 { get; set; }

        [DisplayName("E-Mail")]
        public string Correo { get; set; }

        [DisplayName("Año nacimiento")]
        public short? AnhoNacimiento { get; set; }

        [DisplayName("Valoración")]
        public short? Valoracion { get; set; }
        public int? IdClub { get; set; }

        [DisplayName("Posición")]
        public string Posicion { get; set; }

        [DisplayName("Pierna dominante")]
        public string PiernaDominante { get; set; }
        public short? Goles { get; set; }
        public string Club { get; set; }

        [DisplayName("Valor de mercado")]
        public decimal? ValorDeMercado { get; set; }

        [DisplayName("Vto. de Contrato")]
        public System.DateTime? VencimientoContrato { get; set; }

        [DisplayName("Partidos jugados")]
        public short? PartidosJugados { get; set; }

        [DisplayName("País de nacimiento")]
        public string PaisNacimiento { get; set; }
        public string Pasaporte { get; set; }
        public short? Altura { get; set; }
        public short? Peso { get; set; }
        
        [DisplayName("En préstamo")]
        public bool? EnPrestamo { get; set; }
        public string Foto { get; set; }

        public IFormFile ArchivoFoto { get; set; }
    }
}
