using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RematadosWeb.Models
{
    public class Mensaje
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]

        public string Id { get; set; }
        public string Texto { get; set; }
        public Articulo Articulo { get; set; }

        public Usuario Usuario { get; set; }

        public DateTime Fechahora { get; set; }

    }
}
