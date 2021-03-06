USE [master]
GO
/****** Object:  Database [RematadosWebDB]    Script Date: 10/07/2022 08:37:50 p. m. ******/
CREATE DATABASE [RematadosWebDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RematadosWebDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RematadosWebDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RematadosWebDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RematadosWebDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RematadosWebDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RematadosWebDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RematadosWebDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RematadosWebDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RematadosWebDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RematadosWebDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RematadosWebDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RematadosWebDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RematadosWebDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RematadosWebDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RematadosWebDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RematadosWebDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RematadosWebDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RematadosWebDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RematadosWebDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RematadosWebDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RematadosWebDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RematadosWebDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RematadosWebDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RematadosWebDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RematadosWebDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RematadosWebDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RematadosWebDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RematadosWebDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RematadosWebDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RematadosWebDB] SET  MULTI_USER 
GO
ALTER DATABASE [RematadosWebDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RematadosWebDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RematadosWebDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RematadosWebDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RematadosWebDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RematadosWebDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RematadosWebDB', N'ON'
GO
ALTER DATABASE [RematadosWebDB] SET QUERY_STORE = OFF
GO
USE [RematadosWebDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/07/2022 08:37:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 10/07/2022 08:37:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Id] [nvarchar](450) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Precio] [float] NOT NULL,
	[VendedorDni] [int] NULL,
	[CompradorDni] [int] NULL,
	[Estado] [int] NOT NULL,
	[Categoria] [int] NOT NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCarritos]    Script Date: 10/07/2022 08:37:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCarritos](
	[Id] [nvarchar](450) NOT NULL,
	[UsuarioDni] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[ArticuloId] [nvarchar](450) NULL,
 CONSTRAINT [PK_ItemCarritos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 10/07/2022 08:37:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[Id] [nvarchar](450) NOT NULL,
	[Texto] [nvarchar](max) NULL,
	[ArticuloId] [nvarchar](450) NULL,
	[UsuarioDni] [int] NULL,
	[Fechahora] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/07/2022 08:37:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Dni] [int] NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220620234419_Initial', N'3.1.25')
GO
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'118bfca9-fa99-4931-bb64-1f349895ff4f', N'55|', N'55', 55, 33, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'183f258c-ff60-4b67-8e97-07a0a73f11a1', N'44', N'44', 44, 33, 22, 3, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'289337de-e0f6-4b16-b09d-bfd6572250ae', N'33', N'33', 33, 33, 22, 3, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'431d9b0c-7436-4c24-b2d5-d6230fb00815', N'Sombrero', N'El sombrero', 9, 33, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'7e21f825-c8d5-45c2-9ba0-8f9960c05b8f', N'2', N'2', 2, 33, 22, 3, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'89594454-725b-41fe-8b64-e916124a5ec4', N'123', N'213', 21, 33, 22, 2, 1)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'a8b9d70e-08c2-4735-b90d-4efb7308a8bd', N'66', N'66', 66, 33, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'ce0c1d6e-0627-4416-b7b8-5cc36a4b2d87', N'Mouse', N'elmouse', 22, 33, 22, 0, 1)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'd39bd228-15b6-4490-80d1-7d7f610d59a7', N'Pan', N'pan', 200, 33, 22, 0, 4)
GO
INSERT [dbo].[ItemCarritos] ([Id], [UsuarioDni], [Cantidad], [ArticuloId]) VALUES (N'9595a4ba-81f3-488a-b75a-f79a9a5d56fe', 22, 1, N'289337de-e0f6-4b16-b09d-bfd6572250ae')
GO
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (1, N'12242222', N'hoho', N'1', N'2')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (6, N'6', N'6', N'6', N'6')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (10, N'10', N'10', N'10', N'10')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (11, N'11', N'11', N'11', N'11')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (22, N'Matias Juan', N'Mandelbaum ', N'12123', N'66')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (33, N'33', N'33', N'33', N'33')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (55, N'55', N'55', N'55', N'55')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (2223, N'Matias Gabriel', N'Mandelbaum ', N'mandelbaum@mail.com', N'2')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (11111111, N'MATIAS', N'Matias', N'mandelbaum@gmail.com', N'2222222')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (33333333, N'Matias', N'Mandelbaum ', N'mandelbaum@mail.com', N'222222')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (38813835, N'Jose', N'Perez', N'joseperez@gmail.com', N'1111')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (38856846, N'Perez', N'H', N'perez@mail.', N'111')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (388822335, N'Gabrriel', N'Perez', N'perez@mail.', N'11')
GO
/****** Object:  Index [IX_Articulos_CompradorDni]    Script Date: 10/07/2022 08:37:51 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Articulos_CompradorDni] ON [dbo].[Articulos]
(
	[CompradorDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articulos_VendedorDni]    Script Date: 10/07/2022 08:37:51 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Articulos_VendedorDni] ON [dbo].[Articulos]
(
	[VendedorDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ItemCarritos_ArticuloId]    Script Date: 10/07/2022 08:37:51 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ItemCarritos_ArticuloId] ON [dbo].[ItemCarritos]
(
	[ArticuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemCarritos_UsuarioDni]    Script Date: 10/07/2022 08:37:51 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ItemCarritos_UsuarioDni] ON [dbo].[ItemCarritos]
(
	[UsuarioDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mensajes_ArticuloId]    Script Date: 10/07/2022 08:37:51 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Mensajes_ArticuloId] ON [dbo].[Mensajes]
(
	[ArticuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Mensajes_UsuarioDni]    Script Date: 10/07/2022 08:37:51 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Mensajes_UsuarioDni] ON [dbo].[Mensajes]
(
	[UsuarioDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Usuarios_CompradorDni] FOREIGN KEY([CompradorDni])
REFERENCES [dbo].[Usuarios] ([Dni])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Usuarios_CompradorDni]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Usuarios_VendedorDni] FOREIGN KEY([VendedorDni])
REFERENCES [dbo].[Usuarios] ([Dni])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Usuarios_VendedorDni]
GO
ALTER TABLE [dbo].[ItemCarritos]  WITH CHECK ADD  CONSTRAINT [FK_ItemCarritos_Articulos_ArticuloId] FOREIGN KEY([ArticuloId])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[ItemCarritos] CHECK CONSTRAINT [FK_ItemCarritos_Articulos_ArticuloId]
GO
ALTER TABLE [dbo].[ItemCarritos]  WITH CHECK ADD  CONSTRAINT [FK_ItemCarritos_Usuarios_UsuarioDni] FOREIGN KEY([UsuarioDni])
REFERENCES [dbo].[Usuarios] ([Dni])
GO
ALTER TABLE [dbo].[ItemCarritos] CHECK CONSTRAINT [FK_ItemCarritos_Usuarios_UsuarioDni]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Articulos_ArticuloId] FOREIGN KEY([ArticuloId])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Articulos_ArticuloId]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Usuarios_UsuarioDni] FOREIGN KEY([UsuarioDni])
REFERENCES [dbo].[Usuarios] ([Dni])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Usuarios_UsuarioDni]
GO
USE [master]
GO
ALTER DATABASE [RematadosWebDB] SET  READ_WRITE 
GO
