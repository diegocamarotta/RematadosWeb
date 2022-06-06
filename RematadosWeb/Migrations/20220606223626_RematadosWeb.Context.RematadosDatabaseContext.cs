using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace RematadosWeb.Migrations
{
    public partial class RematadosWebContextRematadosDatabaseContext : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Usuarios",
                columns: table => new
                {
                    Dni = table.Column<string>(nullable: false),
                    Nombres = table.Column<string>(nullable: true),
                    Apellidos = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Usuarios", x => x.Dni);
                });

            migrationBuilder.CreateTable(
                name: "Articulos",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Nombre = table.Column<string>(nullable: true),
                    Descripcion = table.Column<string>(nullable: true),
                    Precio = table.Column<double>(nullable: false),
                    VendedorDni = table.Column<string>(nullable: true),
                    CompradorDni = table.Column<string>(nullable: true),
                    Estado = table.Column<int>(nullable: false),
                    Categoria = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Articulos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Articulos_Usuarios_CompradorDni",
                        column: x => x.CompradorDni,
                        principalTable: "Usuarios",
                        principalColumn: "Dni",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Articulos_Usuarios_VendedorDni",
                        column: x => x.VendedorDni,
                        principalTable: "Usuarios",
                        principalColumn: "Dni",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ItemCarritos",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Cantidad = table.Column<int>(nullable: false),
                    ArticuloId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ItemCarritos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ItemCarritos_Articulos_ArticuloId",
                        column: x => x.ArticuloId,
                        principalTable: "Articulos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Mensajes",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Texto = table.Column<string>(nullable: true),
                    ArticuloId = table.Column<string>(nullable: true),
                    Fechahora = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Mensajes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Mensajes_Articulos_ArticuloId",
                        column: x => x.ArticuloId,
                        principalTable: "Articulos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Articulos_CompradorDni",
                table: "Articulos",
                column: "CompradorDni");

            migrationBuilder.CreateIndex(
                name: "IX_Articulos_VendedorDni",
                table: "Articulos",
                column: "VendedorDni");

            migrationBuilder.CreateIndex(
                name: "IX_ItemCarritos_ArticuloId",
                table: "ItemCarritos",
                column: "ArticuloId");

            migrationBuilder.CreateIndex(
                name: "IX_Mensajes_ArticuloId",
                table: "Mensajes",
                column: "ArticuloId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ItemCarritos");

            migrationBuilder.DropTable(
                name: "Mensajes");

            migrationBuilder.DropTable(
                name: "Articulos");

            migrationBuilder.DropTable(
                name: "Usuarios");
        }
    }
}
