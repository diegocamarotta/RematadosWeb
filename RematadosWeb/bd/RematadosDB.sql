USE [master]
GO
/****** Object:  Database [RematadosWebDB]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
/****** Object:  Table [dbo].[Articulos]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
/****** Object:  Table [dbo].[ItemCarritos]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
/****** Object:  Table [dbo].[Mensajes]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'1130a1eb-10cb-4629-9000-c3c80e8fab31', N'9999', N'9999', 9999, 1, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'2499cec4-86de-4bc9-bef7-fdf84c1bdead', N'33ss', N'ccccc', 5165, 1, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'294f48da-2b8c-4610-ba0f-ecfc7bf933f6', N'Pionono', N'es un pio', 2000, 22, 22, 0, 4)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'3a923fdb-a23c-4ffd-8774-309d05bfefec', N'Heladera', N'heladera', 1000, 22, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'4829f6fa-cc58-445f-b9aa-e0055bb23d57', NULL, NULL, 3333, 22, NULL, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834', N'1', N'1', 1, 1, 22, 0, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'87c816e9-a957-49d4-931a-a6c8df2751ba', N'33', N'33', 33, 1, 22, 3, 1)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'945a1cf3-a0ea-4c47-bdc2-afca1b16fd7e', N'1231231', N'1231231', 1111111, 22, 22, 0, 4)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'986013c9-9d79-45ab-9093-968f23f45a42', N'Campera', N'camp', 2222222, 1, 22, 3, 0)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'a7820e5c-c1a7-47bb-9288-3a989d3173a1', N'el de prueba', N'prueba', 22222222, 1, NULL, 0, 3)
INSERT [dbo].[Articulos] ([Id], [Nombre], [Descripcion], [Precio], [VendedorDni], [CompradorDni], [Estado], [Categoria]) VALUES (N'bb50d7a4-c8bc-4604-9e8f-183c8aaf89eb', N'No deberia aparece p.v33', N'NO', 22222, 33, NULL, 2, 0)
GO
INSERT [dbo].[ItemCarritos] ([Id], [UsuarioDni], [Cantidad], [ArticuloId]) VALUES (N'67cae5b6-dd07-4458-b8e7-22e38ef2834f', NULL, 2, N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834')
INSERT [dbo].[ItemCarritos] ([Id], [UsuarioDni], [Cantidad], [ArticuloId]) VALUES (N'efcb96d5-54c8-4444-b54e-0f801a6c0cca', NULL, 333, N'1130a1eb-10cb-4629-9000-c3c80e8fab31')
INSERT [dbo].[ItemCarritos] ([Id], [UsuarioDni], [Cantidad], [ArticuloId]) VALUES (N'fe093603-90f7-4cfc-bce1-f643ce4e9674', NULL, 2, N'294f48da-2b8c-4610-ba0f-ecfc7bf933f6')
GO
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'04ad3eb3-90ec-40cc-bcb6-0fcea14f1eae', N'Espero que bien', N'2499cec4-86de-4bc9-bef7-fdf84c1bdead', 1, CAST(N'2022-06-25T20:21:07.2935337' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'0c5b8032-db9b-4d5c-b766-0f97bcd7b12e', N'Espero que bien', N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834', 1, CAST(N'2022-06-25T19:57:04.0510154' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'21c6de07-57f3-4b25-a10c-c2ce3fe8f081', N'fff', N'1130a1eb-10cb-4629-9000-c3c80e8fab31', 1, CAST(N'2022-06-25T20:35:09.3660496' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'48dfd0ea-84de-4726-8e4f-9a8597b5f47c', N'Espero que bien', N'2499cec4-86de-4bc9-bef7-fdf84c1bdead', 1, CAST(N'2022-06-25T20:21:09.9782462' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'5b6596ee-4a2e-458b-965b-48997b4c7472', N'Hola!', N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834', 1, CAST(N'2022-06-25T20:29:48.0766015' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'76d0af90-022c-45b5-a48b-0680eef018ba', NULL, N'1130a1eb-10cb-4629-9000-c3c80e8fab31', 1, CAST(N'2022-06-25T20:36:41.2204998' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'932f76e8-d8dc-437f-843f-4bfc131dee42', N'Como andas<?', N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834', 1, CAST(N'2022-06-25T19:56:58.7874631' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'9f1c3b40-6bb5-401d-b4d8-1767dbaa6506', N'Hola!', N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834', 1, CAST(N'2022-06-25T19:56:54.6281088' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'be94a9ab-3923-46f0-9944-6759fe1f426a', N'Hola!', N'2499cec4-86de-4bc9-bef7-fdf84c1bdead', 1, CAST(N'2022-06-25T20:21:14.2341873' AS DateTime2))
INSERT [dbo].[Mensajes] ([Id], [Texto], [ArticuloId], [UsuarioDni], [Fechahora]) VALUES (N'd516f0c3-1d77-498a-a74f-ed50f3861bd4', NULL, N'6f3a67b1-2a1f-4311-bb78-c1e6c746f834', 1, CAST(N'2022-06-25T19:57:09.3059949' AS DateTime2))
GO
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (1, N'12242222', N'hoho', N'1', N'2')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (6, N'6', N'6', N'6', N'6')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (11, N'11', N'11', N'11', N'11')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (22, N'Matias Gabriel', N'Mandelbaum ', N'12123', N'55')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (33, N'33', N'33', N'33', N'33')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (55, N'55', N'55', N'55', N'55')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (11111111, N'MATIAS', N'Matias', N'mandelbaum@gmail.com', N'2222222')
INSERT [dbo].[Usuarios] ([Dni], [Nombres], [Apellidos], [Email], [Password]) VALUES (38856846, N'Perez', N'H', N'perez@mail.', N'111')
GO
/****** Object:  Index [IX_Articulos_CompradorDni]    Script Date: 27/06/2022 08:30:42 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Articulos_CompradorDni] ON [dbo].[Articulos]
(
	[CompradorDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articulos_VendedorDni]    Script Date: 27/06/2022 08:30:42 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Articulos_VendedorDni] ON [dbo].[Articulos]
(
	[VendedorDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ItemCarritos_ArticuloId]    Script Date: 27/06/2022 08:30:42 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_ItemCarritos_ArticuloId] ON [dbo].[ItemCarritos]
(
	[ArticuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemCarritos_UsuarioDni]    Script Date: 27/06/2022 08:30:42 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_ItemCarritos_UsuarioDni] ON [dbo].[ItemCarritos]
(
	[UsuarioDni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mensajes_ArticuloId]    Script Date: 27/06/2022 08:30:42 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Mensajes_ArticuloId] ON [dbo].[Mensajes]
(
	[ArticuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Mensajes_UsuarioDni]    Script Date: 27/06/2022 08:30:42 a. m. ******/
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
