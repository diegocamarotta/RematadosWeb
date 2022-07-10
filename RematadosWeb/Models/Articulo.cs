using Microsoft.AspNetCore.Http;
using System;

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RematadosWeb.Models
{
    public class Articulo
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]

        
        public string Id { get; set; }

        [Required(ErrorMessage = "Por favor ingresa un nombre para el artículo", AllowEmptyStrings = false)]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Por favor ingresa una descripción", AllowEmptyStrings = false)]
        public string Descripcion { get; set; }

        [Required(ErrorMessage = "Por favor ingresa ingresa un precio", AllowEmptyStrings = false)]
        [Range(1, int.MaxValue, ErrorMessage = "El precio debe ser mayor a 0")]
        public double Precio { get; set; }
        public Usuario Vendedor { get; set; }
        public Usuario Comprador { get; set; }
        public EstadoArticulo Estado { get; set; }
        public Categoria Categoria { get; set; }

        [NotMapped]
        public IFormFile Foto { get; set; }


    }
}

