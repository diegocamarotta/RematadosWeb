using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using RematadosWeb.Models;

namespace RematadosWeb.Context
{
    public class RematadosDatabaseContext : DbContext
    {
        public
    RematadosDatabaseContext(DbContextOptions<RematadosDatabaseContext> options) : base(options)
        {
        }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Articulo> Articulos { get; set; }
    }
}

