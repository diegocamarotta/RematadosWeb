using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RematadosWeb.Models
{
    public class ItemCarrito
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]

        public string Id { get; set; }

        public Usuario Usuario {get; set;}



        //[Required(ErrorMessage = "Please Provide Cantidad", AllowEmpty = false)]
        public int Cantidad { get; set; }
        public Articulo Articulo { get; set; }

        
    }
}
