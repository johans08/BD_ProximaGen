USE [master]
GO
/****** Object:  Database [ProximaGen]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE DATABASE [ProximaGen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProximaGen', FILENAME = N'E:\Coding Apps\SQL Server 2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProximaGen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProximaGen_log', FILENAME = N'E:\Coding Apps\SQL Server 2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProximaGen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProximaGen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProximaGen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProximaGen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProximaGen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProximaGen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProximaGen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProximaGen] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProximaGen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProximaGen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProximaGen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProximaGen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProximaGen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProximaGen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProximaGen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProximaGen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProximaGen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProximaGen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProximaGen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProximaGen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProximaGen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProximaGen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProximaGen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProximaGen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProximaGen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProximaGen] SET RECOVERY FULL 
GO
ALTER DATABASE [ProximaGen] SET  MULTI_USER 
GO
ALTER DATABASE [ProximaGen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProximaGen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProximaGen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProximaGen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProximaGen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProximaGen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProximaGen', N'ON'
GO
ALTER DATABASE [ProximaGen] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProximaGen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProximaGen]
GO
/****** Object:  Schema [proximagen]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE SCHEMA [proximagen]
GO
/****** Object:  Table [proximagen].[asignaciones]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[asignaciones](
	[idAsignacion] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](45) NOT NULL,
	[descripcion] [nvarchar](45) NOT NULL,
	[archivo] [nvarchar](max) NOT NULL,
	[Grupos_idGrupo] [int] NOT NULL,
 CONSTRAINT [PK_asignaciones_idAsignacion] PRIMARY KEY CLUSTERED 
(
	[idAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[aulas]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[aulas](
	[idAula] [int] IDENTITY(1,1) NOT NULL,
	[direccionAula] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_aulas_idAula] PRIMARY KEY CLUSTERED 
(
	[idAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [aulas$direccionAula_UNIQUE] UNIQUE NONCLUSTERED 
(
	[direccionAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[carreras]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[carreras](
	[idCarrera] [int] IDENTITY(1,1) NOT NULL,
	[carrera] [nvarchar](45) NOT NULL,
	[Estados_idEstado] [int] NOT NULL,
 CONSTRAINT [PK_carreras_idCarrera] PRIMARY KEY CLUSTERED 
(
	[idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [carreras$carrera_UNIQUE] UNIQUE NONCLUSTERED 
(
	[carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[carreras_has_tipogrado]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[carreras_has_tipogrado](
	[Carreras_idCarrera] [int] NOT NULL,
	[TipoGrado_idTipoGrado] [int] NOT NULL,
 CONSTRAINT [PK_carreras_has_tipogrado_Carreras_idCarrera] PRIMARY KEY CLUSTERED 
(
	[Carreras_idCarrera] ASC,
	[TipoGrado_idTipoGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[contacto]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[contacto](
	[idContacto] [int] IDENTITY(1,1) NOT NULL,
	[descripcionContacto] [nvarchar](45) NOT NULL,
	[TipoContactos_idTipoContacto] [int] NOT NULL,
	[Personas_idPersona] [int] NOT NULL,
 CONSTRAINT [PK_contacto_idContacto] PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[cursos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[cursos](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[curso] [nvarchar](45) NOT NULL,
	[requisito] [nvarchar](45) NOT NULL,
	[creditos] [int] NOT NULL,
	[Estados_idEstado] [int] NOT NULL,
	[Precios_idPrecio] [int] NOT NULL,
 CONSTRAINT [PK_cursos_idCurso] PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [cursos$curso_UNIQUE] UNIQUE NONCLUSTERED 
(
	[curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[cursos_has_carreras]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[cursos_has_carreras](
	[Cursos_idCurso] [int] NOT NULL,
	[Carreras_idCarrera] [int] NOT NULL,
 CONSTRAINT [PK_cursos_has_carreras_Cursos_idCurso] PRIMARY KEY CLUSTERED 
(
	[Cursos_idCurso] ASC,
	[Carreras_idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[cursos_has_horarios]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[cursos_has_horarios](
	[Cursos_idCurso] [int] NOT NULL,
	[Horarios_idHorario] [int] NOT NULL,
 CONSTRAINT [PK_cursos_has_horarios_Cursos_idCurso] PRIMARY KEY CLUSTERED 
(
	[Cursos_idCurso] ASC,
	[Horarios_idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[descuentos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[descuentos](
	[idDescuento] [int] IDENTITY(1,1) NOT NULL,
	[porcentaje] [real] NOT NULL,
	[TipoDescuento_idTipoDescuento] [int] NOT NULL,
 CONSTRAINT [PK_descuentos_idDescuento] PRIMARY KEY CLUSTERED 
(
	[idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[dias]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[dias](
	[idDia] [int] IDENTITY(1,1) NOT NULL,
	[dia] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_dias_idDia] PRIMARY KEY CLUSTERED 
(
	[idDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [dias$dia_UNIQUE] UNIQUE NONCLUSTERED 
(
	[dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[entregables]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[entregables](
	[idEntregable] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](45) NOT NULL,
	[descripcion] [nvarchar](45) NOT NULL,
	[archivo] [nvarchar](max) NOT NULL,
	[Asignaciones_idAsignacion] [int] NOT NULL,
 CONSTRAINT [PK_entregables_idEntregable] PRIMARY KEY CLUSTERED 
(
	[idEntregable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[estados]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[descripcionEstado] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_estados_idEstado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [estados$descripcionEstado_UNIQUE] UNIQUE NONCLUSTERED 
(
	[descripcionEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[facturacion]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[facturacion](
	[idFacturacion] [int] IDENTITY(1,1) NOT NULL,
	[subtotal] [real] NOT NULL,
	[iva] [real] NOT NULL,
	[descuento] [real] NOT NULL,
	[total] [real] NOT NULL,
	[fechaFacturacion] [date] NOT NULL,
	[Personas_idPersona] [int] NOT NULL,
	[MetodoPago_idMetodoPago] [int] NOT NULL,
 CONSTRAINT [PK_facturacion_idFacturacion] PRIMARY KEY CLUSTERED 
(
	[idFacturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[facturacion_has_descuentos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[facturacion_has_descuentos](
	[Facturacion_idFacturacion] [int] NOT NULL,
	[Descuentos_idDescuento] [int] NOT NULL,
 CONSTRAINT [PK_facturacion_has_descuentos_Facturacion_idFacturacion] PRIMARY KEY CLUSTERED 
(
	[Facturacion_idFacturacion] ASC,
	[Descuentos_idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[generos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[generos](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[genero] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_generos_idGenero] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [generos$genero_UNIQUE] UNIQUE NONCLUSTERED 
(
	[genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[grupos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[grupos](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Cursos_idCurso] [int] NOT NULL,
	[Modalidades_idModalidad] [int] NOT NULL,
	[Aulas_idAula] [int] NULL,
 CONSTRAINT [PK_grupos_idGrupo] PRIMARY KEY CLUSTERED 
(
	[idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[horarios]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[horarios](
	[idHorario] [int] IDENTITY(1,1) NOT NULL,
	[horario] [nvarchar](45) NOT NULL,
	[Dias_idDia] [int] NOT NULL,
	[Horas_idHora] [int] NOT NULL,
 CONSTRAINT [PK_horarios_idHorario] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [horarios$horario_UNIQUE] UNIQUE NONCLUSTERED 
(
	[horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[horas]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[horas](
	[idHora] [int] IDENTITY(1,1) NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
 CONSTRAINT [PK_horas_idHora] PRIMARY KEY CLUSTERED 
(
	[idHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[metodopago]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[metodopago](
	[idMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[metodo] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_metodopago_idMetodoPago] PRIMARY KEY CLUSTERED 
(
	[idMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [metodopago$metodo_UNIQUE] UNIQUE NONCLUSTERED 
(
	[metodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[modalidades]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[modalidades](
	[idModalidad] [int] IDENTITY(1,1) NOT NULL,
	[modalidad] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_modalidades_idModalidad] PRIMARY KEY CLUSTERED 
(
	[idModalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [modalidades$modalidad_UNIQUE] UNIQUE NONCLUSTERED 
(
	[modalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[permisos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[permisos](
	[idPermiso] [int] IDENTITY(1,1) NOT NULL,
	[permiso] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_permisos_idPermiso] PRIMARY KEY CLUSTERED 
(
	[idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [permisos$permiso_UNIQUE] UNIQUE NONCLUSTERED 
(
	[permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[personas]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[personas](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [int] NOT NULL,
	[nombre] [nvarchar](45) NOT NULL,
	[apellido] [nvarchar](45) NOT NULL,
	[apellido2] [nvarchar](45) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[Generos_idGenero] [int] NOT NULL,
	[Estados_idEstado] [int] NOT NULL,
 CONSTRAINT [PK_personas_idPersona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [personas$cedula_UNIQUE] UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[precios]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[precios](
	[idPrecio] [int] IDENTITY(1,1) NOT NULL,
	[precio] [real] NOT NULL,
 CONSTRAINT [PK_precios_idPrecio] PRIMARY KEY CLUSTERED 
(
	[idPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [precios$precio_UNIQUE] UNIQUE NONCLUSTERED 
(
	[precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[roles]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcionRol] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_roles_idRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [roles$descripcionRol_UNIQUE] UNIQUE NONCLUSTERED 
(
	[descripcionRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[roles_has_permisos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[roles_has_permisos](
	[Roles_idRol] [int] NOT NULL,
	[Permisos_idPermiso] [int] NOT NULL,
 CONSTRAINT [PK_roles_has_permisos_Roles_idRol] PRIMARY KEY CLUSTERED 
(
	[Roles_idRol] ASC,
	[Permisos_idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[tarjetas]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[tarjetas](
	[idTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[numeroTarjeta] [int] NOT NULL,
	[expiracionMes] [date] NOT NULL,
	[expiracionAnno] [date] NOT NULL,
	[cvv] [int] NOT NULL,
	[Personas_idPersona] [int] NOT NULL,
	[Estados_idEstado] [int] NOT NULL,
 CONSTRAINT [PK_tarjetas_idTarjeta] PRIMARY KEY CLUSTERED 
(
	[idTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [tarjetas$numeroTarjeta_UNIQUE] UNIQUE NONCLUSTERED 
(
	[numeroTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[tipocontactos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[tipocontactos](
	[idTipoContacto] [int] IDENTITY(1,1) NOT NULL,
	[descripcionTipoContacto] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_tipocontactos_idTipoContacto] PRIMARY KEY CLUSTERED 
(
	[idTipoContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [tipocontactos$descripcionTipoContacto_UNIQUE] UNIQUE NONCLUSTERED 
(
	[descripcionTipoContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[tipodescuento]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[tipodescuento](
	[idTipoDescuento] [int] IDENTITY(1,1) NOT NULL,
	[tipoDescuento] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_tipodescuento_idTipoDescuento] PRIMARY KEY CLUSTERED 
(
	[idTipoDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [tipodescuento$tipoDescuento_UNIQUE] UNIQUE NONCLUSTERED 
(
	[tipoDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[tipogrado]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[tipogrado](
	[idTipoGrado] [int] IDENTITY(1,1) NOT NULL,
	[gradoAcademico] [nvarchar](45) NOT NULL,
	[duracion] [int] NOT NULL,
 CONSTRAINT [PK_tipogrado_idTipoGrado] PRIMARY KEY CLUSTERED 
(
	[idTipoGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [tipogrado$gradoAcademico_UNIQUE] UNIQUE NONCLUSTERED 
(
	[gradoAcademico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[usuarios]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [nvarchar](45) NOT NULL,
	[contrasenna] [nvarchar](45) NOT NULL,
	[correo] [nvarchar](45) NOT NULL,
	[Roles_idRol] [int] NOT NULL,
	[Personas_idPersona] [int] NOT NULL,
	[Estados_idEstado] [int] NOT NULL,
 CONSTRAINT [PK_usuarios_idUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [usuarios$nombreUsuario_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[usuarios_has_grupos]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[usuarios_has_grupos](
	[Usuarios_idUsuario] [int] NOT NULL,
	[Grupos_idGrupo] [int] NOT NULL,
 CONSTRAINT [PK_usuarios_has_grupos_Usuarios_idUsuario] PRIMARY KEY CLUSTERED 
(
	[Usuarios_idUsuario] ASC,
	[Grupos_idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proximagen].[usuarios_has_grupos_has_entregables]    Script Date: 10/28/2023 1:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proximagen].[usuarios_has_grupos_has_entregables](
	[Usuarios_has_Grupos_Usuarios_idUsuario] [int] NOT NULL,
	[Usuarios_has_Grupos_Grupos_idGrupo] [int] NOT NULL,
	[Entregables_idEntregable] [int] NOT NULL,
 CONSTRAINT [PK_usuarios_has_grupos_has_entregables_Usuarios_has_Grupos_Usuarios_idUsuario] PRIMARY KEY CLUSTERED 
(
	[Usuarios_has_Grupos_Usuarios_idUsuario] ASC,
	[Usuarios_has_Grupos_Grupos_idGrupo] ASC,
	[Entregables_idEntregable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [fk_Asignaciones_Grupos2_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Asignaciones_Grupos2_idx] ON [proximagen].[asignaciones]
(
	[Grupos_idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Carreras_Estados1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Carreras_Estados1_idx] ON [proximagen].[carreras]
(
	[Estados_idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Carreras_has_TipoGrado_Carreras1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Carreras_has_TipoGrado_Carreras1_idx] ON [proximagen].[carreras_has_tipogrado]
(
	[Carreras_idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Carreras_has_TipoGrado_TipoGrado1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Carreras_has_TipoGrado_TipoGrado1_idx] ON [proximagen].[carreras_has_tipogrado]
(
	[TipoGrado_idTipoGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Contacto_Personas1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Contacto_Personas1_idx] ON [proximagen].[contacto]
(
	[Personas_idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Contacto_TipoContactos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Contacto_TipoContactos1_idx] ON [proximagen].[contacto]
(
	[TipoContactos_idTipoContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Curso_Estados1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Curso_Estados1_idx] ON [proximagen].[cursos]
(
	[Estados_idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Cursos_Precios1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Cursos_Precios1_idx] ON [proximagen].[cursos]
(
	[Precios_idPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Cursos_has_Carreras_Carreras1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Cursos_has_Carreras_Carreras1_idx] ON [proximagen].[cursos_has_carreras]
(
	[Carreras_idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Cursos_has_Carreras_Cursos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Cursos_has_Carreras_Cursos1_idx] ON [proximagen].[cursos_has_carreras]
(
	[Cursos_idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Cursos_has_Horarios_Cursos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Cursos_has_Horarios_Cursos1_idx] ON [proximagen].[cursos_has_horarios]
(
	[Cursos_idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Cursos_has_Horarios_Horarios1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Cursos_has_Horarios_Horarios1_idx] ON [proximagen].[cursos_has_horarios]
(
	[Horarios_idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Descuentos_TipoDescuento1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Descuentos_TipoDescuento1_idx] ON [proximagen].[descuentos]
(
	[TipoDescuento_idTipoDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Entregables_Asignaciones1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Entregables_Asignaciones1_idx] ON [proximagen].[entregables]
(
	[Asignaciones_idAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Facturacion_MetodoPago1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Facturacion_MetodoPago1_idx] ON [proximagen].[facturacion]
(
	[MetodoPago_idMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Facturacion_Personas1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Facturacion_Personas1_idx] ON [proximagen].[facturacion]
(
	[Personas_idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Facturacion_has_Descuentos_Descuentos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Facturacion_has_Descuentos_Descuentos1_idx] ON [proximagen].[facturacion_has_descuentos]
(
	[Descuentos_idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Facturacion_has_Descuentos_Facturacion1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Facturacion_has_Descuentos_Facturacion1_idx] ON [proximagen].[facturacion_has_descuentos]
(
	[Facturacion_idFacturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Grupos_Aulas1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Grupos_Aulas1_idx] ON [proximagen].[grupos]
(
	[Aulas_idAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Grupos_Cursos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Grupos_Cursos1_idx] ON [proximagen].[grupos]
(
	[Cursos_idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Grupos_Modalidades1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Grupos_Modalidades1_idx] ON [proximagen].[grupos]
(
	[Modalidades_idModalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Horarios_Dias1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Horarios_Dias1_idx] ON [proximagen].[horarios]
(
	[Dias_idDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Horarios_Horas1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Horarios_Horas1_idx] ON [proximagen].[horarios]
(
	[Horas_idHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Personas_Estados1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Personas_Estados1_idx] ON [proximagen].[personas]
(
	[Estados_idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Personas_Generos_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Personas_Generos_idx] ON [proximagen].[personas]
(
	[Generos_idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Roles_has_Permisos_Permisos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Roles_has_Permisos_Permisos1_idx] ON [proximagen].[roles_has_permisos]
(
	[Permisos_idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Roles_has_Permisos_Roles1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Roles_has_Permisos_Roles1_idx] ON [proximagen].[roles_has_permisos]
(
	[Roles_idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Tarjetas_Estados1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Tarjetas_Estados1_idx] ON [proximagen].[tarjetas]
(
	[Estados_idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Tarjetas_Personas1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Tarjetas_Personas1_idx] ON [proximagen].[tarjetas]
(
	[Personas_idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_Estados1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_Estados1_idx] ON [proximagen].[usuarios]
(
	[Estados_idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_Personas1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_Personas1_idx] ON [proximagen].[usuarios]
(
	[Personas_idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_Roles1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_Roles1_idx] ON [proximagen].[usuarios]
(
	[Roles_idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_has_Grupos_Grupos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_has_Grupos_Grupos1_idx] ON [proximagen].[usuarios_has_grupos]
(
	[Grupos_idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_has_Grupos_Usuarios1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_has_Grupos_Usuarios1_idx] ON [proximagen].[usuarios_has_grupos]
(
	[Usuarios_idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_has_Grupos_has_Entregables_Entregables1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_has_Grupos_has_Entregables_Entregables1_idx] ON [proximagen].[usuarios_has_grupos_has_entregables]
(
	[Entregables_idEntregable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Usuarios_has_Grupos_has_Entregables_Usuarios_has_Grupos1_idx]    Script Date: 10/28/2023 1:13:57 PM ******/
CREATE NONCLUSTERED INDEX [fk_Usuarios_has_Grupos_has_Entregables_Usuarios_has_Grupos1_idx] ON [proximagen].[usuarios_has_grupos_has_entregables]
(
	[Usuarios_has_Grupos_Usuarios_idUsuario] ASC,
	[Usuarios_has_Grupos_Grupos_idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [proximagen].[grupos] ADD  DEFAULT (NULL) FOR [Aulas_idAula]
GO
ALTER TABLE [proximagen].[asignaciones]  WITH CHECK ADD  CONSTRAINT [asignaciones$fk_Asignaciones_Grupos2] FOREIGN KEY([Grupos_idGrupo])
REFERENCES [proximagen].[grupos] ([idGrupo])
GO
ALTER TABLE [proximagen].[asignaciones] CHECK CONSTRAINT [asignaciones$fk_Asignaciones_Grupos2]
GO
ALTER TABLE [proximagen].[carreras]  WITH CHECK ADD  CONSTRAINT [carreras$fk_Carreras_Estados1] FOREIGN KEY([Estados_idEstado])
REFERENCES [proximagen].[estados] ([idEstado])
GO
ALTER TABLE [proximagen].[carreras] CHECK CONSTRAINT [carreras$fk_Carreras_Estados1]
GO
ALTER TABLE [proximagen].[carreras_has_tipogrado]  WITH CHECK ADD  CONSTRAINT [carreras_has_tipogrado$fk_Carreras_has_TipoGrado_Carreras1] FOREIGN KEY([Carreras_idCarrera])
REFERENCES [proximagen].[carreras] ([idCarrera])
GO
ALTER TABLE [proximagen].[carreras_has_tipogrado] CHECK CONSTRAINT [carreras_has_tipogrado$fk_Carreras_has_TipoGrado_Carreras1]
GO
ALTER TABLE [proximagen].[carreras_has_tipogrado]  WITH CHECK ADD  CONSTRAINT [carreras_has_tipogrado$fk_Carreras_has_TipoGrado_TipoGrado1] FOREIGN KEY([TipoGrado_idTipoGrado])
REFERENCES [proximagen].[tipogrado] ([idTipoGrado])
GO
ALTER TABLE [proximagen].[carreras_has_tipogrado] CHECK CONSTRAINT [carreras_has_tipogrado$fk_Carreras_has_TipoGrado_TipoGrado1]
GO
ALTER TABLE [proximagen].[contacto]  WITH CHECK ADD  CONSTRAINT [contacto$fk_Contacto_Personas1] FOREIGN KEY([Personas_idPersona])
REFERENCES [proximagen].[personas] ([idPersona])
GO
ALTER TABLE [proximagen].[contacto] CHECK CONSTRAINT [contacto$fk_Contacto_Personas1]
GO
ALTER TABLE [proximagen].[contacto]  WITH CHECK ADD  CONSTRAINT [contacto$fk_Contacto_TipoContactos1] FOREIGN KEY([TipoContactos_idTipoContacto])
REFERENCES [proximagen].[tipocontactos] ([idTipoContacto])
GO
ALTER TABLE [proximagen].[contacto] CHECK CONSTRAINT [contacto$fk_Contacto_TipoContactos1]
GO
ALTER TABLE [proximagen].[cursos]  WITH CHECK ADD  CONSTRAINT [cursos$fk_Curso_Estados1] FOREIGN KEY([Estados_idEstado])
REFERENCES [proximagen].[estados] ([idEstado])
GO
ALTER TABLE [proximagen].[cursos] CHECK CONSTRAINT [cursos$fk_Curso_Estados1]
GO
ALTER TABLE [proximagen].[cursos]  WITH CHECK ADD  CONSTRAINT [cursos$fk_Cursos_Precios1] FOREIGN KEY([Precios_idPrecio])
REFERENCES [proximagen].[precios] ([idPrecio])
GO
ALTER TABLE [proximagen].[cursos] CHECK CONSTRAINT [cursos$fk_Cursos_Precios1]
GO
ALTER TABLE [proximagen].[cursos_has_carreras]  WITH CHECK ADD  CONSTRAINT [cursos_has_carreras$fk_Cursos_has_Carreras_Carreras1] FOREIGN KEY([Carreras_idCarrera])
REFERENCES [proximagen].[carreras] ([idCarrera])
GO
ALTER TABLE [proximagen].[cursos_has_carreras] CHECK CONSTRAINT [cursos_has_carreras$fk_Cursos_has_Carreras_Carreras1]
GO
ALTER TABLE [proximagen].[cursos_has_carreras]  WITH CHECK ADD  CONSTRAINT [cursos_has_carreras$fk_Cursos_has_Carreras_Cursos1] FOREIGN KEY([Cursos_idCurso])
REFERENCES [proximagen].[cursos] ([idCurso])
GO
ALTER TABLE [proximagen].[cursos_has_carreras] CHECK CONSTRAINT [cursos_has_carreras$fk_Cursos_has_Carreras_Cursos1]
GO
ALTER TABLE [proximagen].[cursos_has_horarios]  WITH CHECK ADD  CONSTRAINT [cursos_has_horarios$fk_Cursos_has_Horarios_Cursos1] FOREIGN KEY([Cursos_idCurso])
REFERENCES [proximagen].[cursos] ([idCurso])
GO
ALTER TABLE [proximagen].[cursos_has_horarios] CHECK CONSTRAINT [cursos_has_horarios$fk_Cursos_has_Horarios_Cursos1]
GO
ALTER TABLE [proximagen].[cursos_has_horarios]  WITH CHECK ADD  CONSTRAINT [cursos_has_horarios$fk_Cursos_has_Horarios_Horarios1] FOREIGN KEY([Horarios_idHorario])
REFERENCES [proximagen].[horarios] ([idHorario])
GO
ALTER TABLE [proximagen].[cursos_has_horarios] CHECK CONSTRAINT [cursos_has_horarios$fk_Cursos_has_Horarios_Horarios1]
GO
ALTER TABLE [proximagen].[descuentos]  WITH CHECK ADD  CONSTRAINT [descuentos$fk_Descuentos_TipoDescuento1] FOREIGN KEY([TipoDescuento_idTipoDescuento])
REFERENCES [proximagen].[tipodescuento] ([idTipoDescuento])
GO
ALTER TABLE [proximagen].[descuentos] CHECK CONSTRAINT [descuentos$fk_Descuentos_TipoDescuento1]
GO
ALTER TABLE [proximagen].[entregables]  WITH CHECK ADD  CONSTRAINT [entregables$fk_Entregables_Asignaciones1] FOREIGN KEY([Asignaciones_idAsignacion])
REFERENCES [proximagen].[asignaciones] ([idAsignacion])
GO
ALTER TABLE [proximagen].[entregables] CHECK CONSTRAINT [entregables$fk_Entregables_Asignaciones1]
GO
ALTER TABLE [proximagen].[facturacion]  WITH CHECK ADD  CONSTRAINT [facturacion$fk_Facturacion_MetodoPago1] FOREIGN KEY([MetodoPago_idMetodoPago])
REFERENCES [proximagen].[metodopago] ([idMetodoPago])
GO
ALTER TABLE [proximagen].[facturacion] CHECK CONSTRAINT [facturacion$fk_Facturacion_MetodoPago1]
GO
ALTER TABLE [proximagen].[facturacion]  WITH CHECK ADD  CONSTRAINT [facturacion$fk_Facturacion_Personas1] FOREIGN KEY([Personas_idPersona])
REFERENCES [proximagen].[personas] ([idPersona])
GO
ALTER TABLE [proximagen].[facturacion] CHECK CONSTRAINT [facturacion$fk_Facturacion_Personas1]
GO
ALTER TABLE [proximagen].[facturacion_has_descuentos]  WITH CHECK ADD  CONSTRAINT [facturacion_has_descuentos$fk_Facturacion_has_Descuentos_Descuentos1] FOREIGN KEY([Descuentos_idDescuento])
REFERENCES [proximagen].[descuentos] ([idDescuento])
GO
ALTER TABLE [proximagen].[facturacion_has_descuentos] CHECK CONSTRAINT [facturacion_has_descuentos$fk_Facturacion_has_Descuentos_Descuentos1]
GO
ALTER TABLE [proximagen].[facturacion_has_descuentos]  WITH CHECK ADD  CONSTRAINT [facturacion_has_descuentos$fk_Facturacion_has_Descuentos_Facturacion1] FOREIGN KEY([Facturacion_idFacturacion])
REFERENCES [proximagen].[facturacion] ([idFacturacion])
GO
ALTER TABLE [proximagen].[facturacion_has_descuentos] CHECK CONSTRAINT [facturacion_has_descuentos$fk_Facturacion_has_Descuentos_Facturacion1]
GO
ALTER TABLE [proximagen].[grupos]  WITH CHECK ADD  CONSTRAINT [grupos$fk_Grupos_Aulas1] FOREIGN KEY([Aulas_idAula])
REFERENCES [proximagen].[aulas] ([idAula])
GO
ALTER TABLE [proximagen].[grupos] CHECK CONSTRAINT [grupos$fk_Grupos_Aulas1]
GO
ALTER TABLE [proximagen].[grupos]  WITH CHECK ADD  CONSTRAINT [grupos$fk_Grupos_Cursos1] FOREIGN KEY([Cursos_idCurso])
REFERENCES [proximagen].[cursos] ([idCurso])
GO
ALTER TABLE [proximagen].[grupos] CHECK CONSTRAINT [grupos$fk_Grupos_Cursos1]
GO
ALTER TABLE [proximagen].[grupos]  WITH CHECK ADD  CONSTRAINT [grupos$fk_Grupos_Modalidades1] FOREIGN KEY([Modalidades_idModalidad])
REFERENCES [proximagen].[modalidades] ([idModalidad])
GO
ALTER TABLE [proximagen].[grupos] CHECK CONSTRAINT [grupos$fk_Grupos_Modalidades1]
GO
ALTER TABLE [proximagen].[horarios]  WITH CHECK ADD  CONSTRAINT [horarios$fk_Horarios_Dias1] FOREIGN KEY([Dias_idDia])
REFERENCES [proximagen].[dias] ([idDia])
GO
ALTER TABLE [proximagen].[horarios] CHECK CONSTRAINT [horarios$fk_Horarios_Dias1]
GO
ALTER TABLE [proximagen].[horarios]  WITH CHECK ADD  CONSTRAINT [horarios$fk_Horarios_Horas1] FOREIGN KEY([Horas_idHora])
REFERENCES [proximagen].[horas] ([idHora])
GO
ALTER TABLE [proximagen].[horarios] CHECK CONSTRAINT [horarios$fk_Horarios_Horas1]
GO
ALTER TABLE [proximagen].[personas]  WITH CHECK ADD  CONSTRAINT [personas$fk_Personas_Estados1] FOREIGN KEY([Estados_idEstado])
REFERENCES [proximagen].[estados] ([idEstado])
GO
ALTER TABLE [proximagen].[personas] CHECK CONSTRAINT [personas$fk_Personas_Estados1]
GO
ALTER TABLE [proximagen].[personas]  WITH CHECK ADD  CONSTRAINT [personas$fk_Personas_Generos] FOREIGN KEY([Generos_idGenero])
REFERENCES [proximagen].[generos] ([idGenero])
GO
ALTER TABLE [proximagen].[personas] CHECK CONSTRAINT [personas$fk_Personas_Generos]
GO
ALTER TABLE [proximagen].[roles_has_permisos]  WITH CHECK ADD  CONSTRAINT [roles_has_permisos$fk_Roles_has_Permisos_Permisos1] FOREIGN KEY([Permisos_idPermiso])
REFERENCES [proximagen].[permisos] ([idPermiso])
GO
ALTER TABLE [proximagen].[roles_has_permisos] CHECK CONSTRAINT [roles_has_permisos$fk_Roles_has_Permisos_Permisos1]
GO
ALTER TABLE [proximagen].[roles_has_permisos]  WITH CHECK ADD  CONSTRAINT [roles_has_permisos$fk_Roles_has_Permisos_Roles1] FOREIGN KEY([Roles_idRol])
REFERENCES [proximagen].[roles] ([idRol])
GO
ALTER TABLE [proximagen].[roles_has_permisos] CHECK CONSTRAINT [roles_has_permisos$fk_Roles_has_Permisos_Roles1]
GO
ALTER TABLE [proximagen].[tarjetas]  WITH CHECK ADD  CONSTRAINT [tarjetas$fk_Tarjetas_Estados1] FOREIGN KEY([Estados_idEstado])
REFERENCES [proximagen].[estados] ([idEstado])
GO
ALTER TABLE [proximagen].[tarjetas] CHECK CONSTRAINT [tarjetas$fk_Tarjetas_Estados1]
GO
ALTER TABLE [proximagen].[tarjetas]  WITH CHECK ADD  CONSTRAINT [tarjetas$fk_Tarjetas_Personas1] FOREIGN KEY([Personas_idPersona])
REFERENCES [proximagen].[personas] ([idPersona])
GO
ALTER TABLE [proximagen].[tarjetas] CHECK CONSTRAINT [tarjetas$fk_Tarjetas_Personas1]
GO
ALTER TABLE [proximagen].[usuarios]  WITH CHECK ADD  CONSTRAINT [usuarios$fk_Usuarios_Estados1] FOREIGN KEY([Estados_idEstado])
REFERENCES [proximagen].[estados] ([idEstado])
GO
ALTER TABLE [proximagen].[usuarios] CHECK CONSTRAINT [usuarios$fk_Usuarios_Estados1]
GO
ALTER TABLE [proximagen].[usuarios]  WITH CHECK ADD  CONSTRAINT [usuarios$fk_Usuarios_Personas1] FOREIGN KEY([Personas_idPersona])
REFERENCES [proximagen].[personas] ([idPersona])
GO
ALTER TABLE [proximagen].[usuarios] CHECK CONSTRAINT [usuarios$fk_Usuarios_Personas1]
GO
ALTER TABLE [proximagen].[usuarios]  WITH CHECK ADD  CONSTRAINT [usuarios$fk_Usuarios_Roles1] FOREIGN KEY([Roles_idRol])
REFERENCES [proximagen].[roles] ([idRol])
GO
ALTER TABLE [proximagen].[usuarios] CHECK CONSTRAINT [usuarios$fk_Usuarios_Roles1]
GO
ALTER TABLE [proximagen].[usuarios_has_grupos]  WITH CHECK ADD  CONSTRAINT [usuarios_has_grupos$fk_Usuarios_has_Grupos_Grupos1] FOREIGN KEY([Grupos_idGrupo])
REFERENCES [proximagen].[grupos] ([idGrupo])
GO
ALTER TABLE [proximagen].[usuarios_has_grupos] CHECK CONSTRAINT [usuarios_has_grupos$fk_Usuarios_has_Grupos_Grupos1]
GO
ALTER TABLE [proximagen].[usuarios_has_grupos]  WITH CHECK ADD  CONSTRAINT [usuarios_has_grupos$fk_Usuarios_has_Grupos_Usuarios1] FOREIGN KEY([Usuarios_idUsuario])
REFERENCES [proximagen].[usuarios] ([idUsuario])
GO
ALTER TABLE [proximagen].[usuarios_has_grupos] CHECK CONSTRAINT [usuarios_has_grupos$fk_Usuarios_has_Grupos_Usuarios1]
GO
ALTER TABLE [proximagen].[usuarios_has_grupos_has_entregables]  WITH CHECK ADD  CONSTRAINT [usuarios_has_grupos_has_entregables$fk_Usuarios_has_Grupos_has_Entregables_Entregables1] FOREIGN KEY([Entregables_idEntregable])
REFERENCES [proximagen].[entregables] ([idEntregable])
GO
ALTER TABLE [proximagen].[usuarios_has_grupos_has_entregables] CHECK CONSTRAINT [usuarios_has_grupos_has_entregables$fk_Usuarios_has_Grupos_has_Entregables_Entregables1]
GO
ALTER TABLE [proximagen].[usuarios_has_grupos_has_entregables]  WITH CHECK ADD  CONSTRAINT [usuarios_has_grupos_has_entregables$fk_Usuarios_has_Grupos_has_Entregables_Usuarios_has_Grupos1] FOREIGN KEY([Usuarios_has_Grupos_Usuarios_idUsuario], [Usuarios_has_Grupos_Grupos_idGrupo])
REFERENCES [proximagen].[usuarios_has_grupos] ([Usuarios_idUsuario], [Grupos_idGrupo])
GO
ALTER TABLE [proximagen].[usuarios_has_grupos_has_entregables] CHECK CONSTRAINT [usuarios_has_grupos_has_entregables$fk_Usuarios_has_Grupos_has_Entregables_Usuarios_has_Grupos1]
GO
/****** Object:  StoredProcedure [dbo].[CUD_Generos]    Script Date: 10/28/2023 1:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUD_Generos]
(
    @modo INT,
    @idGenero INT,
    @genero NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el género ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE genero = @genero)
        BEGIN
            -- Insertar un nuevo género
            INSERT INTO [ProximaGen].[proximagen].[generos] (genero)
            VALUES (@genero);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El género ya existe. No se ha creado un nuevo género.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de género existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE idGenero = @idGenero)
        BEGIN
            -- Actualizar un género existente
            UPDATE [ProximaGen].[proximagen].[generos]
            SET genero = @genero
            WHERE idGenero = @idGenero;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de género no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de género existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE idGenero = @idGenero)
        BEGIN
            -- Eliminar un género existente
            DELETE FROM [ProximaGen].[proximagen].[generos]
            WHERE idGenero = @idGenero;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de género no existe. No se ha realizado la eliminación.';
        END
    END
    ELSE
    BEGIN
        -- Manejar otros modos o valores de modo según sea necesario
        -- Puedes agregar más casos o manejar errores aquí si es necesario
        PRINT 'Modo no válido.';
    END

    IF @creado = 1
    BEGIN
        PRINT 'La operación se ha completado con éxito.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CUD_Personas]    Script Date: 10/28/2023 1:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CUD_Personas]
(
    @modo INT,
    @cedula NVARCHAR(15),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @apellido2 NVARCHAR(50),
    @fechaNacimiento DATE,
    @Generos_idGenero INT,
    @Estados_idEstado INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la cédula ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[ProximaGen].[personas] WHERE cedula = @cedula)
        BEGIN
            -- Insertar una nueva persona
            INSERT INTO [ProximaGen].[ProximaGen].[personas] (cedula, nombre, apellido, apellido2, fechaNacimiento, Generos_idGenero, Estados_idEstado)
            VALUES (@cedula, @nombre, @apellido, @apellido2, @fechaNacimiento, @Generos_idGenero, @Estados_idEstado);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La cédula ya existe. No se ha creado una nueva persona.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la cédula existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[ProximaGen].[personas] WHERE cedula = @cedula)
        BEGIN
            -- Actualizar una persona existente
            UPDATE [ProximaGen].[ProximaGen].[personas]
            SET nombre = @nombre, apellido = @apellido, apellido2 = @apellido2, fechaNacimiento = @fechaNacimiento, Generos_idGenero = @Generos_idGenero, Estados_idEstado = @Estados_idEstado
            WHERE cedula = @cedula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La cédula no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si la cédula existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[ProximaGen].[personas] WHERE cedula = @cedula)
        BEGIN
            -- Eliminar una persona existente
            DELETE FROM [ProximaGen].[ProximaGen].[personas]
            WHERE cedula = @cedula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La cédula no existe. No se ha realizado la eliminación.';
        END
    END
    ELSE
    BEGIN
        -- Manejar otros modos o valores de modo según sea necesario
        -- Puedes agregar más casos o manejar errores aquí si es necesario
        PRINT 'Modo no válido.';
    END

    IF @creado = 1
    BEGIN
        PRINT 'La operación se ha completado con éxito.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarEstado]    Script Date: 10/28/2023 1:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarEstado]
(
    @descripcionEstado NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO [ProximaGen].[ProximaGen].[estados] (descripcionEstado)
    VALUES (@descripcionEstado)
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarGenero]    Script Date: 10/28/2023 1:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[InsertarGenero]
(
    @descripcionGenero NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO [ProximaGen].[ProximaGen].[generos] (genero)
    VALUES (@descripcionGenero)
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.asignaciones' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'asignaciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.aulas' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'aulas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.carreras' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'carreras'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.carreras_has_tipogrado' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'carreras_has_tipogrado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.contacto' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'contacto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.cursos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'cursos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.cursos_has_carreras' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'cursos_has_carreras'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.cursos_has_horarios' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'cursos_has_horarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.descuentos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'descuentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.dias' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'dias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.entregables' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'entregables'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.estados' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'estados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.facturacion' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'facturacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.facturacion_has_descuentos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'facturacion_has_descuentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.generos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'generos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.grupos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'grupos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.horarios' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'horarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.horas' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'horas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.metodopago' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'metodopago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.modalidades' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'modalidades'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.permisos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'permisos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.personas' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'personas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.precios' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'precios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.roles' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.roles_has_permisos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'roles_has_permisos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.tarjetas' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'tarjetas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.tipocontactos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'tipocontactos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.tipodescuento' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'tipodescuento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.tipogrado' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'tipogrado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.usuarios' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'usuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.usuarios_has_grupos' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'usuarios_has_grupos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proximagen.usuarios_has_grupos_has_entregables' , @level0type=N'SCHEMA',@level0name=N'proximagen', @level1type=N'TABLE',@level1name=N'usuarios_has_grupos_has_entregables'
GO
USE [master]
GO
ALTER DATABASE [ProximaGen] SET  READ_WRITE 
GO
