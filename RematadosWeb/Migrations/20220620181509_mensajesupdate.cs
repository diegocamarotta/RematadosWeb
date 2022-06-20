using Microsoft.EntityFrameworkCore.Migrations;

namespace RematadosWeb.Migrations
{
    public partial class mensajesupdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UsuarioDni",
                table: "Mensajes",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Mensajes_UsuarioDni",
                table: "Mensajes",
                column: "UsuarioDni");

            migrationBuilder.AddForeignKey(
                name: "FK_Mensajes_Usuarios_UsuarioDni",
                table: "Mensajes",
                column: "UsuarioDni",
                principalTable: "Usuarios",
                principalColumn: "Dni",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Mensajes_Usuarios_UsuarioDni",
                table: "Mensajes");

            migrationBuilder.DropIndex(
                name: "IX_Mensajes_UsuarioDni",
                table: "Mensajes");

            migrationBuilder.DropColumn(
                name: "UsuarioDni",
                table: "Mensajes");
        }
    }
}
