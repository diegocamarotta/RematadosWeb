using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace RematadosWeb.Models
{
    public class Usuario
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Required(ErrorMessage = "Please Provide DNI", AllowEmptyStrings = false)]
        [Remote(action: "DNIExists", controller: "Usuarios",ErrorMessage = "DNI en uso")]

        public int Dni { get; set; }

        [Required(ErrorMessage = "Please Provide Name", AllowEmptyStrings = false)]
        public string Nombres { get; set; }

        [Required(ErrorMessage = "Please Provide Last Name", AllowEmptyStrings = false)]
        public string Apellidos { get; set; }


        [Required(ErrorMessage = "Please Provide EMAIL", AllowEmptyStrings = false)]
        
        public string Email { get; set; }

        [Required(ErrorMessage = "Please provide password", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        public string Password { get; set; }
               
    }
}
