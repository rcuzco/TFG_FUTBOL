USE [TFG_FUTBOL]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OJEADOS_CLUB]') AND parent_object_id = OBJECT_ID(N'[dbo].[OJEADOS]'))
ALTER TABLE [dbo].[OJEADOS] DROP CONSTRAINT [FK_OJEADOS_CLUB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_JUGADORES_OJEADOS_OJEADOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[JUGADORES_OJEADOS]'))
ALTER TABLE [dbo].[JUGADORES_OJEADOS] DROP CONSTRAINT [FK_JUGADORES_OJEADOS_OJEADOS]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_JUGADORES_EMPLEADOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[JUGADORES]'))
ALTER TABLE [dbo].[JUGADORES] DROP CONSTRAINT [FK_JUGADORES_EMPLEADOS]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EQUIPOS_CLUB]') AND parent_object_id = OBJECT_ID(N'[dbo].[EQUIPOS]'))
ALTER TABLE [dbo].[EQUIPOS] DROP CONSTRAINT [FK_EQUIPOS_CLUB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ENTRENADORES_EMPLEADOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ENTRENADORES]'))
ALTER TABLE [dbo].[ENTRENADORES] DROP CONSTRAINT [FK_ENTRENADORES_EMPLEADOS]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPLEADOS_OJEADOS_OJEADOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[EMPLEADOS_OJEADOS]'))
ALTER TABLE [dbo].[EMPLEADOS_OJEADOS] DROP CONSTRAINT [FK_EMPLEADOS_OJEADOS_OJEADOS]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPLEADOS_EQUIPOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[EMPLEADOS]'))
ALTER TABLE [dbo].[EMPLEADOS] DROP CONSTRAINT [FK_EMPLEADOS_EQUIPOS]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS]') AND type in (N'U'))
DROP TABLE [dbo].[USUARIOS]
GO
/****** Object:  Table [dbo].[OJEADOS]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OJEADOS]') AND type in (N'U'))
DROP TABLE [dbo].[OJEADOS]
GO
/****** Object:  Table [dbo].[JUGADORES_OJEADOS]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JUGADORES_OJEADOS]') AND type in (N'U'))
DROP TABLE [dbo].[JUGADORES_OJEADOS]
GO
/****** Object:  Table [dbo].[JUGADORES]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JUGADORES]') AND type in (N'U'))
DROP TABLE [dbo].[JUGADORES]
GO
/****** Object:  Table [dbo].[EQUIPOS]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EQUIPOS]') AND type in (N'U'))
DROP TABLE [dbo].[EQUIPOS]
GO
/****** Object:  Table [dbo].[ENTRENADORES]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ENTRENADORES]') AND type in (N'U'))
DROP TABLE [dbo].[ENTRENADORES]
GO
/****** Object:  Table [dbo].[EMPLEADOS_OJEADOS]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADOS_OJEADOS]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLEADOS_OJEADOS]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADOS]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLEADOS]
GO
/****** Object:  Table [dbo].[CLUB]    Script Date: 09/08/2020 17:05:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLUB]') AND type in (N'U'))
DROP TABLE [dbo].[CLUB]
GO
/****** Object:  Table [dbo].[CLUB]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLUB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NULL,
	[Direccion] [nvarchar](200) NULL,
 CONSTRAINT [PK_CLUB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[DNI] [nvarchar](15) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[PrimerApellido] [nvarchar](50) NULL,
	[SegundoApellido] [nvarchar](50) NULL,
	[Telefono1] [nvarchar](20) NULL,
	[Telefono2] [nvarchar](20) NULL,
	[Correo] [nvarchar](50) NULL,
	[AnhoNacimiento] [smallint] NULL,
	[Valoracion] [smallint] NULL,
	[Curriculum] [nvarchar](max) NULL,
	[EquipoID] [int] NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS_OJEADOS]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS_OJEADOS](
	[DNI] [nvarchar](10) NOT NULL,
	[Formacion] [nvarchar](50) NULL,
	[Experiencia] [nvarchar](50) NULL,
 CONSTRAINT [PK_EMPLEADOS_OJEADOS] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTRENADORES]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTRENADORES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Formacion] [nvarchar](50) NULL,
	[Experiencia] [nvarchar](50) NULL,
	[EmpleadoDNI] [nvarchar](15) NULL,
 CONSTRAINT [PK_ENTRENADORES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EQUIPOS]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](50) NULL,
	[ClubID] [int] NULL,
 CONSTRAINT [PK_EQUIPOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JUGADORES]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JUGADORES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Posicion] [nvarchar](50) NULL,
	[PiernaDominante] [nvarchar](50) NULL,
	[Goles] [smallint] NULL,
	[PartidosTitular] [smallint] NULL,
	[EmpleadoDNI] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_JUGADORES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JUGADORES_OJEADOS]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JUGADORES_OJEADOS](
	[DNI] [nvarchar](10) NOT NULL,
	[Posicion] [nvarchar](50) NULL,
	[PiernaDominante] [char](10) NULL,
	[Goles] [smallint] NULL,
	[Club] [nvarchar](50) NULL,
	[ValorDeMercado] [money] NULL,
	[VencimientoContrato] [datetime] NULL,
	[PartidosJugados] [smallint] NULL,
	[PaisNacimiento] [nvarchar](100) NULL,
	[Pasaporte] [nvarchar](20) NULL,
	[Altura] [smallint] NULL,
	[Peso] [smallint] NULL,
	[EnPrestamo] [bit] NULL,
 CONSTRAINT [PK_JUGADORES_OJEADOS] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OJEADOS]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OJEADOS](
	[DNI] [nvarchar](10) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[PrimerApellido] [nvarchar](50) NOT NULL,
	[SegundoApellido] [nvarchar](50) NULL,
	[Telefono1] [nvarchar](15) NULL,
	[Telefono2] [nvarchar](15) NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[AnhoNacimiento] [smallint] NULL,
	[Valoracion] [smallint] NULL,
	[Foto] [nvarchar](500) NULL,
	[IdClub] [int] NULL,
 CONSTRAINT [PK_OJEADOS] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 09/08/2020 17:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[PrimerApellido] [nvarchar](50) NULL,
	[SegundoApellido] [nvarchar](50) NULL,
	[NombreUsuario] [nvarchar](10) NOT NULL,
	[Contrasenha] [nvarchar](100) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLUB] ON 

INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (1, N'convallis.in.cursus@Nuncmauris.com', N'04 46 21 99 42', N'1987 Fames Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (2, N'Lorem.ipsum.dolor@eu.com', N'03 81 22 06 59', N'1640 Et Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (3, N'imperdiet@nonbibendumsed.ca', N'09 75 46 70 31', N'P.O. Box 133, 2133 Cum Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (4, N'metus@inmolestie.org', N'08 15 42 05 69', N'P.O. Box 475, 9357 Ut Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (5, N'accumsan@nequesedsem.edu', N'05 00 96 79 94', N'589-1919 Donec Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (6, N'torquent.per.conubia@lectusjustoeu.edu', N'09 41 32 93 66', N'Ap #696-5031 Iaculis, Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (7, N'arcu.vel.quam@tinciduntnuncac.com', N'01 38 10 32 66', N'826-9837 Metus Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (8, N'Duis@inconsequat.ca', N'05 60 19 92 57', N'6764 Libero. Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (9, N'Duis.sit.amet@acorci.net', N'05 38 18 16 83', N'P.O. Box 560, 1226 Quis St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (10, N'leo@adipiscing.org', N'06 41 32 36 86', N'570-383 In Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (11, N'id.risus@auguemalesuada.net', N'02 09 75 70 33', N'P.O. Box 474, 245 Sit Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (12, N'metus.Vivamus@nibhvulputatemauris.edu', N'05 31 80 40 09', N'2633 Duis St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (13, N'Fusce@semperet.com', N'08 80 48 62 13', N'Ap #959-2799 Ullamcorper St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (14, N'laoreet.posuere.enim@sem.edu', N'09 91 70 60 94', N'Ap #708-8987 Hendrerit. Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (15, N'per@nequeIn.edu', N'01 90 82 55 90', N'608-4825 Arcu Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (16, N'lorem.luctus@Sed.org', N'09 64 35 73 24', N'P.O. Box 143, 8850 Pharetra St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (17, N'vel.quam.dignissim@estNuncullamcorper.net', N'04 66 82 02 05', N'714-4352 Curae; Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (18, N'lectus.Nullam@orci.org', N'01 87 22 15 02', N'Ap #578-3311 Cras Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (19, N'in.lobortis.tellus@ametmassa.edu', N'04 71 07 69 44', N'346-6147 Ornare St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (20, N'Cras@nuncrisus.net', N'03 70 11 18 00', N'2638 Amet, Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (21, N'velit.eget.laoreet@inhendreritconsectetuer.com', N'09 06 14 38 26', N'P.O. Box 906, 7677 Orci St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (22, N'nibh.enim.gravida@dui.org', N'01 03 60 97 53', N'Ap #791-9364 Luctus St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (23, N'Aliquam@inhendreritconsectetuer.edu', N'02 78 09 51 69', N'Ap #371-6632 Tempus Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (24, N'Vestibulum.ante.ipsum@sitamet.com', N'01 59 04 57 07', N'Ap #116-6371 Sapien. Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (25, N'at.risus.Nunc@Inmi.org', N'05 76 07 31 50', N'4666 Placerat Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (26, N'natoque.penatibus.et@odioNaminterdum.edu', N'05 48 65 66 78', N'Ap #121-4423 Nunc Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (27, N'odio.Phasellus@risusQuisquelibero.edu', N'07 48 10 71 31', N'Ap #171-7925 Nec Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (28, N'Praesent.interdum@Suspendisse.edu', N'02 65 82 59 26', N'Ap #675-5274 Egestas Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (29, N'at.iaculis.quis@egestasblanditNam.com', N'07 08 90 20 24', N'P.O. Box 241, 5055 Congue St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (30, N'sapien.Nunc@velitjusto.ca', N'08 28 19 64 69', N'3328 Interdum Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (31, N'cursus.et.magna@cursus.com', N'07 66 34 61 99', N'6238 Ipsum. Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (32, N'commodo.tincidunt@neque.ca', N'09 67 20 89 77', N'6473 Luctus Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (33, N'posuere.at@Aliquamrutrum.net', N'03 55 42 33 29', N'8735 Arcu Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (34, N'dignissim.Maecenas@nulla.ca', N'08 12 56 93 28', N'975-6187 Eu Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (35, N'Cras.lorem.lorem@nisiAenean.edu', N'04 91 60 58 18', N'842-9608 Enim Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (36, N'in.molestie@Praesent.net', N'01 74 08 89 13', N'4856 Felis Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (37, N'Duis.cursus.diam@vel.edu', N'05 85 08 21 93', N'P.O. Box 416, 2350 Non Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (38, N'Suspendisse@venenatisa.edu', N'04 74 65 03 32', N'P.O. Box 961, 5886 Mauris Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (39, N'sapien@Crasvehicula.co.uk', N'03 10 35 54 45', N'P.O. Box 684, 9310 Quam Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (40, N'aliquet@lectus.co.uk', N'07 90 94 51 02', N'980-8710 Nullam Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (41, N'lorem.tristique@Nullamscelerisqueneque.ca', N'01 98 03 26 78', N'P.O. Box 993, 6537 Dui Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (42, N'Ut.tincidunt.vehicula@Proinvelnisl.ca', N'02 33 95 00 47', N'P.O. Box 796, 4576 Risus. St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (43, N'fringilla@nonlaciniaat.ca', N'05 36 46 52 87', N'6522 Amet Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (44, N'lorem@quam.org', N'09 91 42 79 27', N'452-7401 Semper St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (45, N'diam@Duisgravida.co.uk', N'04 15 69 61 16', N'459-3354 Sed Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (46, N'dolor@nibhsitamet.ca', N'04 36 71 22 94', N'Ap #497-9003 Dapibus Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (47, N'consectetuer@Vestibulumut.com', N'02 69 32 98 85', N'P.O. Box 122, 5997 Aliquet. Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (48, N'eu@eleifend.co.uk', N'01 14 10 40 67', N'Ap #460-2527 Mollis Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (49, N'Proin@gravidaPraesenteu.ca', N'07 98 03 54 58', N'P.O. Box 264, 7535 Sem Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (50, N'Integer@lacusMaurisnon.edu', N'09 67 18 37 76', N'P.O. Box 347, 6803 Sed Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (51, N'ut.sem.Nulla@nequevenenatis.net', N'03 90 69 16 02', N'382-6380 Quisque St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (52, N'augue.malesuada@venenatislacusEtiam.org', N'07 26 71 11 76', N'508 Dui, Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (53, N'eu@ullamcorper.ca', N'08 16 18 70 19', N'3377 Lacus. Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (54, N'ante@tincidunt.com', N'02 73 57 35 47', N'Ap #770-8147 Velit. St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (55, N'dui.Suspendisse.ac@placerat.ca', N'09 61 44 87 38', N'P.O. Box 137, 5276 Justo St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (56, N'tortor.dictum.eu@sollicitudin.ca', N'02 83 89 36 56', N'Ap #963-6140 Varius Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (57, N'egestas.a@loremloremluctus.co.uk', N'05 76 84 04 01', N'Ap #578-5338 Et Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (58, N'luctus@id.com', N'01 34 32 08 41', N'4482 Interdum. Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (59, N'Vivamus.rhoncus.Donec@Pellentesqueultricies.org', N'04 76 71 66 68', N'3659 Cras Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (60, N'risus.Quisque.libero@et.net', N'09 29 96 98 77', N'226-6776 Feugiat Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (61, N'vitae.erat.Vivamus@acsem.co.uk', N'08 60 65 83 54', N'P.O. Box 946, 1005 Luctus Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (62, N'ut@egetdictumplacerat.ca', N'01 12 24 48 62', N'P.O. Box 164, 8581 Ut, Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (63, N'Quisque.varius@ultrices.ca', N'01 34 95 84 19', N'675-3239 Primis Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (64, N'ut.molestie.in@nonegestas.com', N'08 12 99 51 67', N'Ap #981-4002 Amet Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (65, N'nec.tempus@consequatpurus.ca', N'03 90 63 97 43', N'P.O. Box 287, 285 Cursus Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (66, N'tempus.eu.ligula@vitaealiquet.co.uk', N'04 94 02 03 72', N'P.O. Box 217, 4567 Quam. Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (67, N'nisi.Mauris@imperdiet.co.uk', N'07 09 82 73 55', N'9750 Nisi Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (68, N'risus.Donec@Sedauctorodio.co.uk', N'05 47 96 09 29', N'Ap #206-855 Vitae, Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (69, N'pretium@amalesuada.com', N'01 16 25 86 73', N'P.O. Box 255, 7164 Proin Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (70, N'luctus@fermentummetusAenean.edu', N'07 90 36 97 74', N'Ap #955-5001 Bibendum St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (71, N'erat.vitae@idrisus.ca', N'07 43 47 88 58', N'541-645 Nam Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (72, N'ante.dictum.cursus@augue.com', N'06 44 04 99 18', N'412-9665 Ac St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (73, N'rutrum.justo@rutrumurna.com', N'09 60 63 21 86', N'Ap #125-4277 Felis. St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (74, N'Praesent.eu@Etiamimperdietdictum.net', N'07 75 04 77 81', N'Ap #273-8553 Per St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (75, N'aliquet@mifelisadipiscing.co.uk', N'06 01 00 28 97', N'1301 Nisl. St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (76, N'id.mollis.nec@Maurisvestibulum.net', N'07 98 21 94 89', N'5117 Cursus Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (77, N'Nam.interdum@arcu.com', N'05 53 85 13 24', N'P.O. Box 917, 2654 In Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (78, N'vulputate.nisi@aliquetlobortisnisi.edu', N'06 03 60 75 72', N'P.O. Box 850, 4891 Lacus. Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (79, N'libero.Donec@suscipitnonummy.co.uk', N'04 73 69 41 18', N'329-6580 Sit Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (80, N'non.sollicitudin.a@egestaslaciniaSed.com', N'04 05 18 80 16', N'P.O. Box 964, 2996 Risus Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (81, N'sit@adipiscing.edu', N'07 14 56 53 41', N'Ap #617-8059 Nullam Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (82, N'sit.amet.nulla@maurisa.org', N'07 73 20 57 41', N'Ap #612-2582 Nonummy St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (83, N'Cras.interdum@Nunc.net', N'08 54 63 72 60', N'532-1201 Libero Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (84, N'ipsum@justo.org', N'08 10 05 52 92', N'4434 Sed St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (85, N'tortor@consectetuermauris.net', N'09 83 65 86 97', N'9458 Tellus St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (86, N'faucibus.ut.nulla@convallis.co.uk', N'09 44 13 18 21', N'979-4488 Velit Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (87, N'ultrices.iaculis.odio@fermentumvel.ca', N'03 85 10 99 87', N'7004 Nisi Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (88, N'molestie.dapibus.ligula@NulladignissimMaecenas.edu', N'01 02 54 17 50', N'902-569 Velit. Avenue')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (89, N'rutrum.urna@orci.com', N'03 78 15 84 48', N'256-7423 Aliquam Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (90, N'est.Nunc@a.co.uk', N'01 70 66 85 08', N'P.O. Box 210, 5560 Consectetuer Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (91, N'sollicitudin.a.malesuada@neque.ca', N'05 20 80 88 00', N'3037 Elit. Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (92, N'dui.semper.et@ornaresagittis.org', N'02 35 33 45 93', N'9477 Velit Rd.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (93, N'tellus.Suspendisse@ametrisusDonec.com', N'07 62 07 79 56', N'Ap #603-4022 Natoque Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (94, N'vehicula.aliquet.libero@tempor.edu', N'02 78 16 95 65', N'6137 Dictum. Ave')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (95, N'Donec@magnaatortor.ca', N'05 25 29 94 37', N'4387 Ligula St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (96, N'enim@posuereenim.net', N'04 17 97 28 80', N'Ap #958-6535 Nam Road')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (97, N'ipsum.primis.in@molestietellus.net', N'02 99 05 99 30', N'7744 Ac Av.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (98, N'penatibus.et@at.ca', N'05 06 32 85 71', N'P.O. Box 321, 1926 Purus. Street')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (99, N'pharetra.ut.pharetra@elementumloremut.ca', N'03 46 82 03 73', N'P.O. Box 527, 1895 Elit. Av.')
GO
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (100, N'convallis.in@suscipitest.com', N'06 94 23 82 86', N'Ap #868-3397 Dolor. St.')
INSERT [dbo].[CLUB] ([ID], [Correo], [Telefono], [Direccion]) VALUES (101, N'mimail@gmail.com', N'123456', N'Madrid 123')
SET IDENTITY_INSERT [dbo].[CLUB] OFF
GO
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DAH64LFQ2', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DAL01MYS0', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DCS85CLU3', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DEU50ZBG5', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DHP87BNS7', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DJE65RSX2', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DVC68ILL0', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DWB24NHG0', N'lorem psum', N'sit amet')
INSERT [dbo].[EMPLEADOS_OJEADOS] ([DNI], [Formacion], [Experiencia]) VALUES (N'DXE64OUQ6', N'lorem psum', N'sit amet')
GO
INSERT [dbo].[JUGADORES_OJEADOS] ([DNI], [Posicion], [PiernaDominante], [Goles], [Club], [ValorDeMercado], [VencimientoContrato], [PartidosJugados], [PaisNacimiento], [Pasaporte], [Altura], [Peso], [EnPrestamo]) VALUES (N'EFR03QTS3', N'Delantero', N'I         ', 2, N'Real Madrid C.F.', 5000009.0000, CAST(N'2024-12-14T14:07:00.000' AS DateTime), 50, N'España', N'987654321', 190, 75, 0)
INSERT [dbo].[JUGADORES_OJEADOS] ([DNI], [Posicion], [PiernaDominante], [Goles], [Club], [ValorDeMercado], [VencimientoContrato], [PartidosJugados], [PaisNacimiento], [Pasaporte], [Altura], [Peso], [EnPrestamo]) VALUES (N'EKV61HEI5', N'Defensa', N'I         ', 2, N'Real Madrid C.F.', 545875.0000, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[JUGADORES_OJEADOS] ([DNI], [Posicion], [PiernaDominante], [Goles], [Club], [ValorDeMercado], [VencimientoContrato], [PartidosJugados], [PaisNacimiento], [Pasaporte], [Altura], [Peso], [EnPrestamo]) VALUES (N'EOD33HRS6', N'Portero', N'I         ', 25, N'Real Madrid C.F.', 5000000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[JUGADORES_OJEADOS] ([DNI], [Posicion], [PiernaDominante], [Goles], [Club], [ValorDeMercado], [VencimientoContrato], [PartidosJugados], [PaisNacimiento], [Pasaporte], [Altura], [Peso], [EnPrestamo]) VALUES (N'ERH20KZS8', N'Defensa', N'I         ', 2, N'Real Madrid C.F.', 900000.0000, CAST(N'2020-08-29T19:12:00.000' AS DateTime), 11, N'España', N'98765432122', 180, 70, 1)
INSERT [dbo].[JUGADORES_OJEADOS] ([DNI], [Posicion], [PiernaDominante], [Goles], [Club], [ValorDeMercado], [VencimientoContrato], [PartidosJugados], [PaisNacimiento], [Pasaporte], [Altura], [Peso], [EnPrestamo]) VALUES (N'EVG94NLF7', N'Centro Campista', N'I         ', 2, N'Real Madrid C.F.', 6000000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[JUGADORES_OJEADOS] ([DNI], [Posicion], [PiernaDominante], [Goles], [Club], [ValorDeMercado], [VencimientoContrato], [PartidosJugados], [PaisNacimiento], [Pasaporte], [Altura], [Peso], [EnPrestamo]) VALUES (N'EYV51HUO7', N'Portero', N'I         ', 2, N'Real Madrid C.F.', 2000000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'AAQ60LRT0', N'Lillian', N'Herrera', N'Wade', N'08 04 51 36 13', N'08 19 53 48 45', N'ultricies.sem@varius.net', 1980, 10, N'3.jpg', 46)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'ANY13FOP7', N'Bree', N'Berry', N'Walker', N'06 46 01 52 22', N'08 69 28 26 56', N'urna@ipsumSuspendisse.com', 1993, 6, N'3.jpg', 52)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'AQT37HAR2', N'Kaseem', N'Fry', N'Whitney', N'09 76 02 49 61', N'02 90 01 72 09', N'egestas.rhoncus@diam.org', 1988, 1, N'3.jpg', 49)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'ARN75QZP7', N'Maris', N'Bowman', N'Benjamin', N'07 97 18 52 73', N'01 87 58 83 52', N'pharetra.Quisque@necenim.co.uk', 1985, 10, N'3.jpg', 82)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'BGA02XCN4', N'Rhoda', N'Potter', N'Mcgee', N'08 99 04 27 96', N'05 12 85 53 92', N'sem@duinec.edu', 1987, 3, N'3.jpg', 100)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'BLM78MNL8', N'Nathan', N'Hendrix', N'Randall', N'06 62 37 27 04', N'01 49 96 24 38', N'lacinia.mattis@nonsollicitudin.com', 1999, 9, N'3.jpg', 92)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'CGD02RDX9', N'Nolan', N'Bishop', N'Hudson', N'06 14 27 64 44', N'05 94 26 64 18', N'at@aliquetmolestie.net', 1989, 8, N'3.jpg', 75)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'CLW77DPJ9', N'Isaac', N'Carr', N'Stevens', N'07 10 18 79 63', N'05 37 41 42 72', N'non.hendrerit@imperdietullamcorperDuis.org', 1988, 9, N'3.jpg', 30)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'CQD84PJY0', N'Julie', N'Berger', N'Lawrence', N'07 38 13 75 06', N'06 60 40 70 97', N'luctus@nuncsit.com', 1996, 5, N'3.jpg', 8)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'CYP77VTF4', N'Ali', N'Galloway', N'Rosales', N'01 61 15 24 33', N'07 08 63 80 77', N'mauris.rhoncus.id@ategestasa.com', 2000, 10, N'3.jpg', 38)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DAH64LFQ2', N'Pamela', N'Thomas', N'Greene', N'02 67 36 17 26', N'09 18 93 41 70', N'massa@non.co.uk', 1980, 2, N'3.jpg', 61)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DAL01MYS0', N'Kylan', N'Mann', N'Castaneda', N'06 83 28 52 05', N'05 36 16 02 71', N'lacus.Etiam.bibendum@convallis.org', 1983, 4, N'3.jpg', 89)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DCS85CLU3', N'Reed', N'Mays', N'Calhoun', N'05 76 10 95 51', N'08 84 06 15 77', N'magna.malesuada@Integerid.edu', 2000, 6, N'3.jpg', 48)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DEU50ZBG5', N'Harrison', N'Casey', N'Talley', N'01 60 00 11 67', N'05 03 81 65 05', N'turpis.vitae@interdum.com', 1980, 7, N'3.jpg', 100)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DHP87BNS7', N'Anika', N'Huff', N'Combs', N'07 40 70 34 35', N'03 91 75 87 71', N'tempor.bibendum@mollis.edu', 1999, 8, N'3.jpg', 64)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DJE65RSX2', N'Allistair', N'Keller', N'Murray', N'04 79 65 62 27', N'02 16 55 62 08', N'quis.diam@Aliquamornarelibero.co.uk', 2000, 9, N'3.jpg', 67)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DVC68ILL0', N'Rogan', N'Mclaughlin', N'Trevino', N'08 63 11 69 13', N'08 01 47 37 32', N'lobortis.nisi.nibh@vel.edu', 1989, 4, N'3.jpg', 53)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DWB24NHG0', N'Nigel', N'Cooley', N'Cooley', N'05 51 07 23 43', N'04 12 23 74 91', N'placerat.eget@DonecnibhQuisque.co.uk', 1999, 5, N'3.jpg', 38)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'DXE64OUQ6', N'Griffin', N'Calhoun', N'Dale', N'08 42 30 92 94', N'08 05 77 77 86', N'semper@placerat.net', 1981, 10, N'3.jpg', 94)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'EFR03QTS3', N'Paco', N'Marks', N'Morgan', N'123456789', N'03 64 64 01 66', N'diam.Pellentesque@ultriciesligula.edu', 1986, 3, N'fa108761-93cb-45d6-8526-4487ea9f7db7_persia.jpg', 90)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'EKV61HEI5', N'Jamalia', N'Sampson', N'Lawrence', N'08 95 19 20 78', N'08 05 68 76 49', N'mus@pellentesquemassalobortis.ca', 1981, 6, N'a3d850fc-4ed0-4e20-a9d9-a5d2bcb12a47_persia.jpg', 86)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'EOD33HRS6', N'Jane', N'Duffy', N'Morrow', N'08 77 85 43 15', N'01 30 78 84 81', N'egestas.hendrerit@utcursus.edu', 1990, 6, N'9608010d-2e02-4961-9835-8d45444bed67_004_gr.png', 17)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'ERH20KZS8', N'Jordan', N'Mcclain', N'Rivera', N'01 82 96 61 06', N'02 52 68 61 93', N'hendrerit.consectetuer.cursus@mattis.co.uk', 1996, 6, N'da3fba07-430a-4191-a97d-077e14bdc1dd_d4a9daa55995698be51b9abc7029bd3d-color-maneki-neko-cat-by-vexels.png', 63)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'EVG94NLF7', N'Tarik', N'Gallagher', N'Alston', N'07 49 54 12 30', N'04 07 33 91 78', N'cursus.a.enim@Quisque.ca', 1989, 3, N'43af7b12-d3d8-45ee-b941-088d4f936b8a_manos.jpg', 30)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'EYV51HUO7', N'Brian', N'Newton', N'Harding', N'03 17 02 11 76', N'01 42 28 05 50', N'varius.orci@eget.edu', 1983, 8, N'3.jpg', 96)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'FFM53OEV5', N'Kyla', N'Mullen', N'Bray', N'03 26 66 02 56', N'02 33 52 13 18', N'nibh.sit@in.com', 1993, 4, N'3.jpg', 63)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'FSA28HNO5', N'Ayanna', N'Haley', N'Ford', N'05 52 16 98 64', N'06 42 83 87 08', N'est.mollis@atfringillapurus.edu', 1999, 7, N'3.jpg', 35)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'GBC53QQR9', N'Callum', N'Morse', N'Vega', N'08 51 68 61 84', N'04 70 96 44 40', N'dui@quamCurabiturvel.com', 1983, 3, N'3.jpg', 70)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'GEI40SOH7', N'Jemima', N'Floyd', N'Daniel', N'07 98 66 81 52', N'07 74 37 89 06', N'parturient.montes.nascetur@maurisaliquam.org', 1988, 3, N'3.jpg', 52)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'HIU76WPH8', N'Melvin', N'Terrell', N'Hull', N'08 73 40 77 61', N'04 93 67 67 38', N'ligula.Aenean@faucibusid.com', 1986, 3, N'3.jpg', 33)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'HRJ12GIU2', N'Declan', N'Wolfe', N'Walker', N'07 32 09 55 48', N'04 97 41 53 59', N'Fusce@necdiam.co.uk', 1994, 3, N'3.jpg', 20)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'HYT52BTA1', N'Eve', N'Bray', N'Wilson', N'09 70 23 60 36', N'07 53 18 96 29', N'Aliquam.fringilla.cursus@purusDuis.net', 1984, 9, N'3.jpg', 42)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'HYY60LTM3', N'Jolie', N'Long', N'Walsh', N'06 13 86 56 28', N'03 25 57 08 39', N'vulputate@dignissimtempor.co.uk', 1984, 6, N'3.jpg', 82)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'IJT88NTQ5', N'Kennedy', N'Oneal', N'Cooper', N'05 34 07 78 72', N'08 54 28 59 50', N'felis.Nulla.tempor@tempus.co.uk', 1981, 5, N'3.jpg', 57)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'IMH29NAE7', N'Lance', N'Gay', N'Vance', N'08 80 96 58 53', N'08 48 46 91 78', N'vulputate.risus.a@afelisullamcorper.co.uk', 1981, 9, N'3.jpg', 86)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'JBV94VOF3', N'Fitzgerald', N'Morales', N'Adams', N'06 94 15 25 56', N'09 73 15 40 69', N'ultrices@nunc.org', 1986, 5, N'3.jpg', 64)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'JEC43CAR0', N'Austin', N'Malone', N'Whitley', N'08 09 17 18 04', N'05 75 83 57 03', N'dui@pede.co.uk', 2000, 1, N'3.jpg', 32)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'JLJ19OCM8', N'Marny', N'Macias', N'Hinton', N'01 45 63 41 85', N'02 50 92 26 87', N'commodo@egetdictumplacerat.ca', 1999, 5, N'3.jpg', 94)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'JUF17LZW2', N'Eve', N'Morrow', N'Obrien', N'07 33 01 90 30', N'06 22 05 77 73', N'augue.eu@neque.edu', 1993, 3, N'3.jpg', 84)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'JUF40IGL8', N'Hayden', N'Mcknight', N'Lambert', N'02 64 71 08 67', N'06 40 33 70 47', N'adipiscing.elit.Aliquam@metusVivamuseuismod.co.uk', 1982, 3, N'3.jpg', 2)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'JZP75RTM9', N'Ivana', N'Galloway', N'Parrish', N'05 79 07 24 88', N'02 38 47 20 65', N'Suspendisse.non@enim.ca', 1988, 7, N'3.jpg', 60)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'KJF95AZI5', N'Bell', N'Hendricks', N'Hall', N'02 73 24 86 28', N'08 31 20 83 03', N'a.neque@ipsumSuspendisse.co.uk', 1988, 7, N'3.jpg', 63)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'KLN49QLT8', N'Lev', N'Mccormick', N'Strong', N'08 40 47 93 60', N'08 46 22 11 47', N'malesuada.vel.venenatis@nisiCum.co.uk', 1980, 2, N'3.jpg', 77)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'LBX96KGU2', N'Dane', N'Callahan', N'Woods', N'05 45 40 51 18', N'08 26 78 47 13', N'ridiculus@Phasellus.edu', 1982, 4, N'3.jpg', 55)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'LDA12ANF9', N'Giselle', N'Whitaker', N'Garza', N'04 81 91 90 73', N'05 99 49 09 25', N'risus@vulputate.ca', 1990, 5, N'3.jpg', 28)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'LDL08SIG9', N'Darius', N'Schwartz', N'Mcintyre', N'06 52 93 75 09', N'06 17 92 00 43', N'nisl.arcu@vitaemaurissit.net', 1986, 3, N'3.jpg', 38)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'LTQ20UBL6', N'Kennedy', N'Weiss', N'Jones', N'06 93 29 78 22', N'03 36 58 61 02', N'luctus.et@nonummyac.net', 1996, 6, N'3.jpg', 22)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MHA15HXH8', N'Zephr', N'Bowers', N'Peck', N'02 19 09 08 49', N'09 97 50 24 79', N'est.mauris@ligula.org', 1988, 8, N'3.jpg', 89)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MIJ23QBS9', N'John', N'Munoz', N'Gould', N'07 02 21 10 85', N'09 63 11 14 52', N'dignissim@dis.edu', 1990, 3, N'3.jpg', 79)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MNU11QDY8', N'Whilemina', N'Walsh', N'Roach', N'09 63 60 57 11', N'09 72 18 90 65', N'ac@natoque.co.uk', 1991, 10, N'3.jpg', 48)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MUX23YDJ9', N'Laurel', N'Flowers', N'Guthrie', N'06 27 04 16 16', N'06 25 70 11 80', N'lacus@eget.net', 1991, 5, N'3.jpg', 86)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MVZ70UXS1', N'Byron', N'Callahan', N'Duncan', N'05 21 98 79 49', N'07 97 78 36 74', N'venenatis.a.magna@cursusin.ca', 1991, 5, N'3.jpg', 9)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MWJ53SLT1', N'Yoko', N'Tyson', N'Weiss', N'04 34 57 88 59', N'02 07 80 07 07', N'quam.dignissim@nonluctussit.com', 1980, 4, N'3.jpg', 24)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'MZQ28PVF6', N'Ifeoma', N'Bell', N'Hunter', N'07 20 89 21 07', N'05 04 79 18 49', N'vitae.erat.Vivamus@sagittisNullam.co.uk', 1986, 6, N'3.jpg', 34)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'NTC57OIW8', N'Bevis', N'Hester', N'Sparks', N'02 81 72 12 05', N'05 94 56 91 52', N'ac@Donecfeugiat.ca', 1995, 8, N'3.jpg', 8)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'NUZ51XJX2', N'Veronica', N'Bowers', N'Knox', N'01 81 40 73 88', N'03 88 15 80 69', N'vitae@Suspendissealiquetmolestie.edu', 1985, 8, N'3.jpg', 4)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PAK66XZO4', N'Ria', N'Caldwell', N'Wyatt', N'01 27 14 19 16', N'08 67 39 29 66', N'ac@inceptos.edu', 1987, 4, N'3.jpg', 5)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PBL28HJH5', N'Kameko', N'Wright', N'Jarvis', N'09 38 52 68 15', N'09 90 66 79 09', N'dui.nec@adipiscingenim.net', 1984, 5, N'3.jpg', 31)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PCO08HBR5', N'Dillon', N'Gibbs', N'Mcleod', N'08 50 89 47 19', N'02 50 07 65 25', N'consectetuer.cursus.et@arcuVivamussit.org', 1988, 4, N'3.jpg', 57)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PGG97YIG1', N'Cleo', N'Dixon', N'Oconnor', N'05 17 31 54 87', N'01 50 26 37 45', N'accumsan.neque.et@nec.org', 2000, 6, N'3.jpg', 55)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PKH34DQF2', N'Damon', N'Santana', N'Parker', N'08 00 68 70 83', N'01 24 62 96 79', N'pellentesque.massa@sagittislobortismauris.co.uk', 2000, 3, N'3.jpg', 81)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PLI96LAQ3', N'Kristen', N'Cole', N'Todd', N'04 96 41 11 32', N'05 22 93 94 43', N'sapien.cursus.in@sed.com', 1994, 6, N'3.jpg', 36)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'PXV34SRZ0', N'Hillary', N'England', N'Hanson', N'07 36 83 54 30', N'05 95 68 45 13', N'sed.consequat@augue.ca', 2000, 5, N'3.jpg', 30)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'QEK80ABM3', N'Kaseem', N'Howard', N'Hines', N'01 31 04 33 69', N'01 96 39 53 82', N'Donec.sollicitudin@laciniaSed.com', 1993, 5, N'3.jpg', 75)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'QTE44XZC5', N'Simone', N'Clay', N'Merrill', N'09 57 32 30 43', N'06 24 75 30 51', N'Nunc.ullamcorper.velit@Utsemperpretium.co.uk', 1996, 4, N'3.jpg', 40)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'QYE55HNP2', N'Caleb', N'Ayers', N'Gamble', N'08 23 25 97 86', N'04 56 67 59 94', N'orci.luctus@Cumsociisnatoque.com', 1992, 7, N'3.jpg', 77)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'RFK46VAW0', N'Madison', N'Schultz', N'Conrad', N'04 04 69 65 36', N'09 78 33 85 46', N'vulputate.dui@velitduisemper.co.uk', 1988, 8, N'3.jpg', 52)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'RLI26SUR1', N'Kaseem', N'Vazquez', N'Reese', N'02 65 09 60 58', N'03 64 20 22 17', N'felis@egetlaoreetposuere.edu', 1985, 8, N'3.jpg', 36)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'RPE15FYY1', N'Casey', N'Combs', N'Knight', N'03 04 04 18 37', N'02 20 67 51 02', N'in.consectetuer.ipsum@necanteblandit.net', 1999, 8, N'3.jpg', 94)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'RVA14QAH8', N'Shelly', N'Moran', N'Pruitt', N'08 95 03 54 94', N'02 79 34 78 93', N'pharetra@loremluctusut.com', 1992, 7, N'3.jpg', 42)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'RWT25SOS7', N'Jin', N'Lambert', N'Duran', N'03 26 42 06 76', N'07 97 67 84 69', N'sit.amet@sitamet.com', 1994, 4, N'3.jpg', 37)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'RYS81HKW8', N'Susan', N'Norris', N'Duke', N'03 88 36 05 33', N'09 86 16 87 89', N'elit.Aliquam@odioNam.net', 1983, 10, N'3.jpg', 16)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'STJ36XMO6', N'Charissa', N'Robles', N'Waters', N'04 32 70 70 54', N'06 44 97 88 62', N'ipsum@aliquam.org', 1987, 6, N'3.jpg', 37)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'TBH97TWR8', N'Brett', N'Bean', N'Dalton', N'09 17 51 35 05', N'03 48 51 68 43', N'urna@montes.org', 1993, 7, N'3.jpg', 66)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'TCD82JPM8', N'Perry', N'Silva', N'Mcguire', N'03 13 31 31 71', N'08 72 20 78 12', N'consectetuer.adipiscing.elit@rhoncusNullam.co.uk', 1993, 3, N'3.jpg', 96)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'UBW82BHF4', N'Dahlia', N'Reeves', N'Buchanan', N'02 90 96 66 41', N'06 89 80 72 07', N'Quisque.varius.Nam@rhoncusNullam.org', 1981, 4, N'3.jpg', 41)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'UGO03DHD3', N'Kermit', N'Castaneda', N'Chambers', N'09 03 56 57 99', N'08 30 09 57 91', N'natoque.penatibus@nonquam.com', 1997, 7, N'3.jpg', 83)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'UGZ46QZS0', N'Reagan', N'Carr', N'Kelley', N'07 04 77 40 81', N'06 22 82 93 67', N'elit.Nulla@necquam.org', 1983, 6, N'3.jpg', 2)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'UHI31KZX9', N'Abel', N'Vargas', N'Castillo', N'09 69 29 51 58', N'06 86 64 41 97', N'metus.In.nec@idrisusquis.net', 1983, 4, N'3.jpg', 87)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'URY85IWD2', N'Halee', N'Campos', N'Gould', N'05 04 28 25 17', N'02 01 94 84 92', N'porta.elit.a@metus.co.uk', 1990, 4, N'3.jpg', 96)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'UWK39NVF0', N'Rajah', N'Wilkinson', N'Ball', N'08 02 27 17 04', N'06 94 08 69 55', N'id.magna@non.edu', 1995, 1, N'3.jpg', 4)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'UWR65BHS9', N'Edan', N'Holcomb', N'Cortez', N'08 12 87 28 79', N'09 22 76 04 84', N'dui.augue.eu@Maurisquis.edu', 1990, 3, N'3.jpg', 9)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VAL88MAS9', N'Christine', N'Benjamin', N'Barr', N'09 81 28 52 97', N'04 83 74 90 85', N'mauris@eulacus.ca', 1993, 3, N'3.jpg', 13)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VBB13VHN2', N'Hyatt', N'Goodwin', N'Mcdaniel', N'07 72 53 56 58', N'04 63 46 72 65', N'tincidunt.congue@famesacturpis.net', 1996, 4, N'3.jpg', 48)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VBC81WZA8', N'Marshall', N'Sellers', N'Cannon', N'08 07 24 39 69', N'03 35 75 23 05', N'egestas.urna@justo.edu', 1992, 3, N'3.jpg', 93)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VOL19YVA9', N'Aladdin', N'Daniel', N'Boyer', N'09 31 30 06 78', N'08 37 52 36 00', N'eget.laoreet@nibhdolornonummy.edu', 1998, 3, N'3.jpg', 2)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VUJ99PMX7', N'Imogene', N'Finch', N'Bernard', N'05 66 64 18 30', N'01 51 50 70 27', N'ac.mattis@euelitNulla.org', 1988, 2, N'3.jpg', 100)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VUV62HJQ4', N'Maia', N'Mcintosh', N'Stout', N'05 23 04 69 89', N'01 14 33 39 73', N'nec.urna@litoratorquentper.co.uk', 1987, 5, N'3.jpg', 69)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'VZS18TOV8', N'Samantha', N'Lynn', N'Rodriguez', N'04 15 97 19 93', N'07 37 97 72 05', N'gravida.mauris@ametnullaDonec.ca', 1987, 5, N'3.jpg', 94)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'WEL28SMI5', N'Cecilia', N'Johnston', N'Mcmillan', N'09 87 87 35 77', N'06 91 36 57 32', N'tincidunt.orci@Nulla.com', 1982, 7, N'3.jpg', 80)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'WNZ08UFQ2', N'Sean', N'Leon', N'Ortega', N'01 18 30 06 99', N'04 05 25 00 38', N'facilisis.eget.ipsum@pede.org', 1992, 2, N'3.jpg', 70)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'WPA67TBN9', N'Wade', N'Whitfield', N'Mckenzie', N'04 48 34 27 00', N'06 28 86 01 60', N'eu.neque.pellentesque@disparturientmontes.co.uk', 1999, 5, N'3.jpg', 57)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'WQV27TEU3', N'Jescie', N'Berg', N'Bridges', N'06 97 05 22 33', N'01 02 55 42 81', N'dui.nec.tempus@nec.net', 2000, 10, N'3.jpg', 98)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'XCP38UMQ9', N'Eden', N'Nieves', N'Smith', N'04 12 96 84 49', N'09 46 43 22 50', N'pellentesque@sitametrisus.net', 1991, 5, N'3.jpg', 56)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'XLM47POB4', N'Kimberly', N'Boone', N'Anderson', N'08 43 85 11 65', N'09 02 59 98 93', N'arcu.et.pede@porttitorscelerisqueneque.org', 1995, 7, N'3.jpg', 2)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'XQV60JBP9', N'Zoe', N'Calderon', N'Montgomery', N'08 49 60 69 57', N'08 63 60 43 77', N'eu.odio.tristique@Proin.co.uk', 1984, 7, N'3.jpg', 53)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'XRT05IIH0', N'Cooper', N'Burris', N'Horn', N'09 76 42 12 41', N'09 03 92 51 63', N'Nunc.sed@mollislectus.ca', 1994, 9, N'3.jpg', 69)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'YEF17ONN7', N'Jenette', N'Underwood', N'Bowers', N'04 57 85 99 19', N'02 00 36 14 96', N'vulputate@scelerisquesedsapien.co.uk', 1984, 5, N'3.jpg', 54)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'YRK23MKZ0', N'Patricia', N'Coffey', N'Pugh', N'06 19 90 55 96', N'03 92 05 43 51', N'Sed@imperdiet.net', 1991, 5, N'3.jpg', 85)
INSERT [dbo].[OJEADOS] ([DNI], [Nombres], [PrimerApellido], [SegundoApellido], [Telefono1], [Telefono2], [Correo], [AnhoNacimiento], [Valoracion], [Foto], [IdClub]) VALUES (N'ZJR81ARK9', N'Dillon', N'Blankenship', N'Pruitt', N'06 19 35 31 24', N'03 71 42 58 04', N'gravida.sit@sit.com', 1995, 4, N'3.jpg', 66)
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (1, N'Frances', N'Gardner', N'Hopper', N'quis', N'loremipsum', N'eget.ipsum@lacus.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (2, N'Reuben', N'Wilkins', N'Ware', N'quis,', N'loremipsum', N'vulputate.eu.odio@magnaLoremipsum.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (3, N'MacKensie', N'Hodges', N'Walls', N'erat.', N'loremipsum', N'parturient@in.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (4, N'Britanney', N'Vega', N'Conrad', N'odio,', N'loremipsum', N'iaculis@faucibusleo.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (5, N'Kyla', N'Trevino', N'Boyer', N'quis', N'loremipsum', N'ipsum.dolor@orciluctus.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (6, N'Ivan', N'Porter', N'Bentley', N'in,', N'loremipsum', N'et.lacinia.vitae@aceleifendvitae.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (7, N'Amity', N'Stanley', N'Galloway', N'ante,', N'loremipsum', N'In.scelerisque.scelerisque@lacusNullatincidunt.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (8, N'Brett', N'Travis', N'Fowler', N'sed', N'loremipsum', N'aliquam.eu@quis.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (9, N'Wynter', N'Mooney', N'Joseph', N'mauris', N'loremipsum', N'ante.Vivamus@fringilla.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (10, N'Quinn', N'Morin', N'Ray', N'felis.', N'loremipsum', N'Morbi@necquamCurabitur.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (11, N'Mason', N'Hodge', N'Summers', N'elementum', N'loremipsum', N'mauris.elit.dictum@cursusluctusipsum.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (12, N'Tanisha', N'Chase', N'Jimenez', N'Donec', N'loremipsum', N'cursus.Nunc.mauris@mollislectus.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (13, N'Marah', N'Kirkland', N'Rojas', N'posuere', N'loremipsum', N'diam.vel@erat.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (14, N'Sydney', N'Sears', N'Hernandez', N'ipsum.', N'loremipsum', N'est.mauris@Nam.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (15, N'Octavius', N'Jordan', N'Cline', N'Lorem', N'loremipsum', N'pellentesque.a@mauriselit.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (16, N'Kirk', N'Dalton', N'Mills', N'feugiat', N'loremipsum', N'risus@ante.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (17, N'Caldwell', N'Bond', N'Ball', N'cursus.', N'loremipsum', N'Praesent@bibendumDonec.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (18, N'Shad', N'Jacobs', N'Stevenson', N'elit.', N'loremipsum', N'in.consectetuer.ipsum@Nunc.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (19, N'Deacon', N'Marsh', N'Beasley', N'est', N'loremipsum', N'nulla.Integer.urna@rhoncusDonec.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (20, N'Warren', N'Fowler', N'Potter', N'convallis,', N'loremipsum', N'leo.elementum@turpis.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (21, N'Naida', N'Reynolds', N'Koch', N'mi', N'loremipsum', N'ante.Vivamus.non@Utsagittislobortis.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (22, N'Drake', N'Padilla', N'Rodriquez', N'in', N'loremipsum', N'neque.non@iaculislacus.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (23, N'Alden', N'Velasquez', N'Conley', N'id,', N'loremipsum', N'ipsum@liberoProinmi.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (24, N'Murphy', N'Harrington', N'Brooks', N'elit.', N'loremipsum', N'dictum.eu.placerat@arcuvelquam.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (25, N'Alexandra', N'Gilmore', N'Jacobson', N'risus', N'loremipsum', N'dolor.quam.elementum@gravidanuncsed.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (26, N'Quinn', N'Gallagher', N'Stout', N'ipsum', N'loremipsum', N'et.eros@sodales.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (27, N'Melinda', N'Noel', N'Wiggins', N'Aenean', N'loremipsum', N'Nullam.velit@sociosquad.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (28, N'Camilla', N'Cole', N'Maldonado', N'lorem', N'loremipsum', N'ipsum.Suspendisse.non@Vestibulum.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (29, N'Walker', N'Donaldson', N'Sears', N'ornare.', N'loremipsum', N'eros@Fusce.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (30, N'Tate', N'King', N'Mosley', N'neque.', N'loremipsum', N'velit@enimNuncut.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (31, N'Camden', N'Evans', N'Bryan', N'diam.', N'loremipsum', N'ultricies.sem.magna@Duisami.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (32, N'Yardley', N'Simon', N'Marks', N'ante,', N'loremipsum', N'Phasellus.vitae.mauris@a.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (33, N'Anjolie', N'Schultz', N'Woodard', N'metus', N'loremipsum', N'elementum.at.egestas@ultriciesligula.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (34, N'Naomi', N'Welch', N'Shelton', N'libero.', N'loremipsum', N'facilisis.Suspendisse@lorem.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (35, N'Imani', N'Atkinson', N'Estrada', N'arcu', N'loremipsum', N'eleifend@tempusrisusDonec.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (36, N'Arden', N'Haynes', N'Herman', N'ut,', N'loremipsum', N'consequat.enim@eutelluseu.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (37, N'Isaac', N'Reeves', N'Robbins', N'faucibus', N'loremipsum', N'Donec@egestasblanditNam.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (38, N'Laith', N'Diaz', N'Hobbs', N'lobortis', N'loremipsum', N'Curabitur@erosnonenim.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (39, N'Coby', N'Ryan', N'Humphrey', N'congue,', N'loremipsum', N'libero@quistristique.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (40, N'Ryan', N'Collier', N'Murphy', N'nisi', N'loremipsum', N'Nullam.lobortis.quam@vestibulum.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (41, N'Bruce', N'Fletcher', N'Brewer', N'ultrices', N'loremipsum', N'Nunc.mauris@amet.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (42, N'Aubrey', N'Kaufman', N'Barber', N'Nunc', N'loremipsum', N'diam@risus.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (43, N'Indira', N'Robinson', N'Singleton', N'vehicula', N'loremipsum', N'tellus.justo@sitamet.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (44, N'Ila', N'Williams', N'Jones', N'Sed', N'loremipsum', N'Aliquam.fringilla.cursus@sitametluctus.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (45, N'Irma', N'Williamson', N'Reilly', N'nisi', N'loremipsum', N'dui.in@leoCras.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (46, N'Jael', N'Reid', N'Mcgowan', N'fringilla', N'loremipsum', N'Nunc.quis@aliquam.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (47, N'Hanna', N'Skinner', N'Brock', N'rutrum', N'loremipsum', N'sit.amet.luctus@In.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (48, N'Casey', N'Gregory', N'Kirkland', N'orci.', N'loremipsum', N'lacus.varius.et@aneque.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (49, N'Kaden', N'Powell', N'Vincent', N'eu,', N'loremipsum', N'molestie.tellus.Aenean@tellus.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (50, N'Ina', N'Jennings', N'Flowers', N'Sed', N'loremipsum', N'cursus.non.egestas@felisegetvarius.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (51, N'Cassidy', N'Mills', N'Singleton', N'orci', N'loremipsum', N'purus.Maecenas@pede.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (52, N'Chanda', N'Kemp', N'Howell', N'aliquet.', N'loremipsum', N'cursus@Phasellus.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (53, N'Zephr', N'Medina', N'Sellers', N'ac', N'loremipsum', N'a.tortor@lorem.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (54, N'Stella', N'Britt', N'Morgan', N'In', N'loremipsum', N'ut.mi.Duis@nonlorem.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (55, N'Signe', N'York', N'Wade', N'id', N'loremipsum', N'adipiscing.elit@enim.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (56, N'Danielle', N'Anthony', N'Mcfarland', N'aliquam', N'loremipsum', N'Sed.congue.elit@magnaSuspendisse.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (57, N'Tamara', N'Bates', N'Curry', N'dolor.', N'loremipsum', N'non.egestas@amagna.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (58, N'Raphael', N'Obrien', N'Baker', N'Duis', N'loremipsum', N'ac.mattis.semper@egestasurnajusto.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (59, N'Howard', N'Winters', N'Hansen', N'sem.', N'loremipsum', N'iaculis.lacus@acfeugiatnon.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (60, N'Aileen', N'Wood', N'Davidson', N'tincidunt,', N'loremipsum', N'neque.Nullam@maurisMorbinon.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (61, N'Odessa', N'Flowers', N'Goodman', N'Curabitur', N'loremipsum', N'fringilla.purus.mauris@egetmetusIn.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (62, N'Nissim', N'Patton', N'Albert', N'pharetra.', N'loremipsum', N'malesuada@mi.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (63, N'Hayfa', N'Durham', N'Heath', N'ante.', N'loremipsum', N'eros@odio.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (64, N'Kendall', N'Durham', N'Dunn', N'gravida.', N'loremipsum', N'odio@Maecenasornareegestas.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (65, N'Genevieve', N'Gibbs', N'Mcintosh', N'facilisis', N'loremipsum', N'lacus@sagittis.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (66, N'Vera', N'Skinner', N'Ochoa', N'non', N'loremipsum', N'condimentum.Donec@egestasSedpharetra.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (67, N'Mohammad', N'Bonner', N'Puckett', N'libero', N'loremipsum', N'Duis.dignissim@malesuadafames.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (68, N'Bradley', N'Palmer', N'Johnston', N'euismod', N'loremipsum', N'nec.cursus@eget.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (69, N'Uriel', N'Cortez', N'Griffin', N'viverra.', N'loremipsum', N'quam@tortordictumeu.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (70, N'Phelan', N'Bolton', N'Kerr', N'sem', N'loremipsum', N'elit.erat.vitae@Quisqueaclibero.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (71, N'Yoshi', N'Harding', N'Dominguez', N'sagittis', N'loremipsum', N'at.egestas@imperdietnon.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (72, N'Ulla', N'Prince', N'Roy', N'Donec', N'loremipsum', N'vulputate.risus.a@ascelerisque.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (73, N'Hasad', N'Gregory', N'Henderson', N'ornare,', N'loremipsum', N'et.euismod@infaucibusorci.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (74, N'Dorian', N'Stephenson', N'Heath', N'ipsum', N'loremipsum', N'ipsum.nunc@nonegestas.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (75, N'Derek', N'Oconnor', N'Sparks', N'risus.', N'loremipsum', N'placerat.velit@mauris.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (76, N'Matthew', N'Davis', N'Parker', N'malesuada', N'loremipsum', N'Duis@auctorvelit.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (77, N'Colby', N'Skinner', N'Jacobson', N'amet', N'loremipsum', N'sem@venenatis.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (78, N'Herman', N'Tyler', N'Welch', N'dolor.', N'loremipsum', N'adipiscing.enim.mi@convallis.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (79, N'Luke', N'Dorsey', N'Johns', N'dictum', N'loremipsum', N'auctor.Mauris@tempus.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (80, N'Magee', N'Jacobs', N'Washington', N'nec,', N'loremipsum', N'a@elitEtiam.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (81, N'Galena', N'Rocha', N'Savage', N'nisi', N'loremipsum', N'imperdiet.ullamcorper.Duis@temporeratneque.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (82, N'Kyra', N'Wiley', N'Bowman', N'nisl.', N'loremipsum', N'ultricies@faucibusleoin.edu')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (83, N'Brady', N'Allison', N'Bernard', N'pharetra', N'loremipsum', N'aliquet.molestie@amet.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (84, N'MacKenzie', N'Miles', N'Reed', N'ullamcorpe', N'loremipsum', N'ut.dolor@orci.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (85, N'Finn', N'Deleon', N'Gray', N'consectetu', N'loremipsum', N'vestibulum@ipsum.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (86, N'Evan', N'Santos', N'Contreras', N'rutrum', N'loremipsum', N'nibh.dolor@consequatnecmollis.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (87, N'Bradley', N'Rogers', N'Clayton', N'eget', N'loremipsum', N'odio@suscipitnonummy.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (88, N'Cairo', N'Buckley', N'Page', N'auctor', N'loremipsum', N'Aenean.massa.Integer@vulputatelacus.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (89, N'Caleb', N'Nielsen', N'Ewing', N'imperdiet', N'loremipsum', N'amet.ornare.lectus@Proin.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (90, N'Yoshio', N'Walton', N'Leonard', N'et', N'loremipsum', N'Aliquam@dis.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (91, N'Grant', N'Marks', N'Gordon', N'facilisis', N'loremipsum', N'consectetuer.adipiscing@pedesagittis.co.uk')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (92, N'Gretchen', N'Johnson', N'Rose', N'molestie', N'loremipsum', N'Morbi@lacusQuisque.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (93, N'Ferdinand', N'Blake', N'Case', N'Phasellus', N'loremipsum', N'risus@dapibusquamquis.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (94, N'Kalia', N'Cherry', N'Martinez', N'quam', N'loremipsum', N'tellus.id.nunc@urnaVivamusmolestie.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (95, N'Steel', N'Munoz', N'Curry', N'aliquet', N'loremipsum', N'augue.eu@Crassedleo.net')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (96, N'Yen', N'Rivers', N'Mcintosh', N'non', N'loremipsum', N'tellus.justo.sit@egetlaoreetposuere.org')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (97, N'Kimberley', N'Owen', N'Dodson', N'euismod', N'loremipsum', N'elementum.purus.accumsan@euismodenimEtiam.com')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (98, N'Shafira', N'Burt', N'Andrews', N'nec', N'loremipsum', N'elit.elit@Duisrisusodio.ca')
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (99, N'Imogene', N'Whitney', N'Wood', N'Quisque', N'loremipsum', N'vitae.purus@mauris.ca')
GO
INSERT [dbo].[USUARIOS] ([ID], [Nombres], [PrimerApellido], [SegundoApellido], [NombreUsuario], [Contrasenha], [Correo]) VALUES (100, N'Yvonne', N'Mcgowan', N'Tate', N'tristique', N'loremipsum', N'magna.Suspendisse.tristique@nascetur.com')
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_EQUIPOS] FOREIGN KEY([EquipoID])
REFERENCES [dbo].[EQUIPOS] ([ID])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_EQUIPOS]
GO
ALTER TABLE [dbo].[EMPLEADOS_OJEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_OJEADOS_OJEADOS] FOREIGN KEY([DNI])
REFERENCES [dbo].[OJEADOS] ([DNI])
GO
ALTER TABLE [dbo].[EMPLEADOS_OJEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_OJEADOS_OJEADOS]
GO
ALTER TABLE [dbo].[ENTRENADORES]  WITH CHECK ADD  CONSTRAINT [FK_ENTRENADORES_EMPLEADOS] FOREIGN KEY([EmpleadoDNI])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[ENTRENADORES] CHECK CONSTRAINT [FK_ENTRENADORES_EMPLEADOS]
GO
ALTER TABLE [dbo].[EQUIPOS]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPOS_CLUB] FOREIGN KEY([ClubID])
REFERENCES [dbo].[CLUB] ([ID])
GO
ALTER TABLE [dbo].[EQUIPOS] CHECK CONSTRAINT [FK_EQUIPOS_CLUB]
GO
ALTER TABLE [dbo].[JUGADORES]  WITH CHECK ADD  CONSTRAINT [FK_JUGADORES_EMPLEADOS] FOREIGN KEY([EmpleadoDNI])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[JUGADORES] CHECK CONSTRAINT [FK_JUGADORES_EMPLEADOS]
GO
ALTER TABLE [dbo].[JUGADORES_OJEADOS]  WITH CHECK ADD  CONSTRAINT [FK_JUGADORES_OJEADOS_OJEADOS] FOREIGN KEY([DNI])
REFERENCES [dbo].[OJEADOS] ([DNI])
GO
ALTER TABLE [dbo].[JUGADORES_OJEADOS] CHECK CONSTRAINT [FK_JUGADORES_OJEADOS_OJEADOS]
GO
ALTER TABLE [dbo].[OJEADOS]  WITH CHECK ADD  CONSTRAINT [FK_OJEADOS_CLUB] FOREIGN KEY([IdClub])
REFERENCES [dbo].[CLUB] ([ID])
GO
ALTER TABLE [dbo].[OJEADOS] CHECK CONSTRAINT [FK_OJEADOS_CLUB]
GO
