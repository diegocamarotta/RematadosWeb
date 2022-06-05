﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using RematadosWeb.Context;

namespace RematadosWeb.Migrations
{
    [DbContext(typeof(RematadosDatabaseContext))]
    partial class RematadosDatabaseContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.25")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("RematadosWeb.Models.Articulo", b =>
                {
                    b.Property<string>("Nombre")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("Categoria")
                        .HasColumnType("int");

                    b.Property<string>("CompradorDni")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Estado")
                        .HasColumnType("int");

                    b.Property<double>("Precio")
                        .HasColumnType("float");

                    b.Property<string>("VendedorDni")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Nombre");

                    b.HasIndex("CompradorDni");

                    b.HasIndex("VendedorDni");

                    b.ToTable("Articulos");
                });

            modelBuilder.Entity("RematadosWeb.Models.Usuario", b =>
                {
                    b.Property<string>("Dni")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Apellidos")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombres")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Dni");

                    b.ToTable("Usuarios");
                });

            modelBuilder.Entity("RematadosWeb.Models.Articulo", b =>
                {
                    b.HasOne("RematadosWeb.Models.Usuario", "Comprador")
                        .WithMany()
                        .HasForeignKey("CompradorDni");

                    b.HasOne("RematadosWeb.Models.Usuario", "Vendedor")
                        .WithMany()
                        .HasForeignKey("VendedorDni");
                });
#pragma warning restore 612, 618
        }
    }
}
