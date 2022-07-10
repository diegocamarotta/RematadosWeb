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
        [Required(ErrorMessage = "Por favor ingesa DNI", AllowEmptyStrings = false)]
        [RegularExpression(@"^[\d]{1,3}\.?[\d]{3,3}\.?[\d]{3,3}$",
                            ErrorMessage = "Ingrese un dni válido")]

        [Remote(action: "DNIExists", controller: "Usuarios",ErrorMessage = "DNI en uso")]
       

        public int Dni { get; set; }

        [Required(ErrorMessage = "Por favor ingesa un nombre", AllowEmptyStrings = false)]
        [RegularExpression(@"^([ \u00c0-\u01ffa-zA-Z'\-])+$",
                            ErrorMessage = "Ingrese un nombre válido")]

        public string Nombres { get; set; }

        [Required(ErrorMessage = "Por favor un apellido", AllowEmptyStrings = false)]
        [RegularExpression(@"^([ \u00c0-\u01ffa-zA-Z'\-])+$",
                            ErrorMessage = "Ingrese un apellido válido")]

        public string Apellidos { get; set; }


        [Required(ErrorMessage = "Ingrese un email valido", AllowEmptyStrings = false)]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$",
                            ErrorMessage = "Ingrese un formato válido")]


        public string Email { get; set; }

        [Required(ErrorMessage = "Ingrese una contraseña", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        public string Password { get; set; }
               
    }
}
