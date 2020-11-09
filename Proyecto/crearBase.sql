--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Autor(es): Flores González, Jesús Eduardo.
--			  Hernández Fontes, Aldo.
--			  Sandoval Lara, Lesly Mayte.
--
-- Asignatura: Bases de Datos.
-- Profesor(a): Martha López Pelcastre.
-- Grupo: 02
-- Semestre: 2020 - 2
--
-- Script: crearBase.sql
-- Descripción: Este script presenta la creación de la base de datos así como las estructuras y tablas de las cuales está compuesta dicha base.
--
-- Fecha de creación: Mayo 18, 2020.
-- Última actualización: Mayo 30, 2020.
-- Versión: 1.10
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- BASE DE DATOS
-- Descripción: Se crea la bases de datos y se implementa.
-- Se crea la base de datos nombrada 'Tienda'.
CREATE DATABASE Tienda;
-- Se implementa la base de datos.
USE Tienda;
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- ESQUEMAS
-- Descripción: Se crean los esquemas necesarios para el desarrolo de la base de datos así como para mantener a las tablas dentro de un mismo concepto.
-- Se crea el esquema 'Persona'. (Este sirve para mantener a los ususaris y lo relacionado con ellos dentro de un mismo esquema)
CREATE SCHEMA PERSONA;
-- Se crea el esquema 'Inventario'. (Este sirve para mantener a los productos y lo relacionado con ellos dentro de un mismo esquema)
CREATE SCHEMA INVENTARIO;
-- Se crea el esquema 'Catálogo'. (Este sirve para mantener las listas de los usuarios y lo relacionado con ellas dentro de un mismo esquema)
CREATE SCHEMA CATALOGO;
-- Se crea el esquema 'Transacción'. (Este sirve para mantener la compra de productos y lo relacionado con ello dentro de un mismo esquema)
CREATE SCHEMA TRANSACCION;
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- TABLAS
-- Descripción: Se crean las tablas basadas en el modelo lógico, se almacenan dentro de  un esquema o catálogo para tener una mejor administración de la 
-- 				base de datos.
-- Tabla 'Usuario'.
CREATE TABLE PERSONA.USUARIO
(
	NombreUsuario VARCHAR(15) NOT NULL CONSTRAINT PK_NombreUsuario PRIMARY KEY,
	Contraseña VARCHAR(15) NOT NULL,
	CURP VARCHAR(18) NOT NULL CONSTRAINT U_Curp UNIQUE(CURP),
	Sexo CHAR(1) NOT NULL CONSTRAINT CK_Sexo CHECK(Sexo IN('H','M')),
	Nombre VARCHAR(30) NOT NULL,
	Paterno VARCHAR(30) NOT NULL,
	Materno VARCHAR(30) NULL,
	TipoPersona CHAR(1) NOT NULL CONSTRAINT CK_TipoPersona CHECK(TipoPersona IN('G','C','V'))
);

-- Tabla 'Gestor'.
CREATE TABLE PERSONA.GESTOR
(
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IdGestor INT NOT NULL CONSTRAINT U_IdGestor UNIQUE(IdGestor),
	Escolaridad VARCHAR(15) NOT NULL,
	FechaIncio DATE NOT NULL,
	FechaFin DATE NULL
);

-- Tabla 'Vendedor'.
CREATE TABLE PERSONA.VENDEDOR
(
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IdVendedor INT NOT NULL CONSTRAINT U_IdVendedor UNIQUE(IdVendedor),
	Sueldo MONEY NOT NULL CONSTRAINT CH_Sueldo CHECK(Sueldo > 5000),
	Comision MONEY CONSTRAINT DF_SubTotal DEFAULT(0)
);

-- Tabla 'Cliente'.
CREATE TABLE PERSONA.CLIENTE
(
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IdCliente SMALLINT NOT NULL CONSTRAINT U_IdCliente UNIQUE(IdCliente),
	FechaCumpleanos DATE NOT NULL,
	Correo VARCHAR(30) NOT NULL,
	Suscripcion CHAR(1) NOT NULL CONSTRAINT CH_Suscripcion CHECK(Suscripcion IN('S','N'))
);

-- Tabla 'Tel_Cliente'.
CREATE TABLE PERSONA.TEL_CLIENTE
(
	Telefono NUMERIC(13) NOT NULL,
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	CONSTRAINT PK_TEL_CLIENTE PRIMARY KEY (Telefono,NombreUsuario)
);

-- Tabla 'Domicilio_cliente'.
CREATE TABLE PERSONA.DOMICILIO_CLIENTE
(
	IdDomicilio INT IDENTITY(1,1),
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	Estado VARCHAR(30) NOT NULL,
	Calle VARCHAR(30) NOT NULL,
	Colonia VARCHAR(30) NOT NULL,
	Alcaldia VARCHAR(30) NOT NULL,
	CodPostal NUMERIC(5) NOT NULL,
	NumExt INT NOT NULL,
	NumInt INT NULL,
	DomicilioPrincipal CHAR(1) NOT NULL CONSTRAINT CH_DomicilioPrincipal CHECK(DomicilioPrincipal IN('S','N')),
	CONSTRAINT PK_DOMICILIO_CLIENTE PRIMARY KEY (NombreUsuario,IdDomicilio)
);

-- Tabla 'Compra'.
CREATE TABLE TRANSACCION.COMPRA
(
	IdCompra INT IDENTITY(1,1) PRIMARY KEY,
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IVA FLOAT CONSTRAINT DF_IVA DEFAULT(0.167),
	SubTotal MONEY CONSTRAINT DF_SubTotal DEFAULT(0),
	TipoCompra CHAR(1) NOT NULL CONSTRAINT CK_TipoCompra CHECK(TipoCompra IN('I','F')),
	MontoTotal AS SubTotal + (SubTotal * IVA),
	FechaCompra DATE NOT NULL
);

-- Tabla 'Físico'.
CREATE TABLE TRANSACCION.FISICO
(
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IdCompra INT NOT NULL FOREIGN KEY REFERENCES TRANSACCION.COMPRA(IdCompra),
	IdFisico INT IDENTITY(1,1) CONSTRAINT U_IdFisico UNIQUE(IdFisico),
	IdVendedor INT NOT NULL FOREIGN KEY REFERENCES PERSONA.VENDEDOR(IdVendedor),
	CONSTRAINT PK_FISICO PRIMARY KEY (NombreUsuario,IdCompra)
);

-- Tabla 'Internet'.
CREATE TABLE TRANSACCION.INTERNET
(
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IdCompra INT NOT NULL FOREIGN KEY REFERENCES TRANSACCION.COMPRA(IdCompra),
	IdInternet INT IDENTITY(1,1) CONSTRAINT U_IdInternet UNIQUE(IdInternet),
	ModoDeEnvio VARCHAR(15) NOT NULL,
	CONSTRAINT PK_INTERNET PRIMARY KEY (NombreUsuario,IdCompra)
);

-- Tabla 'Categoría'.
CREATE TABLE INVENTARIO.CATEGORIA
(
	IdCategoria INT IDENTITY(1,1) PRIMARY KEY,
	NivelCategoria INT NOT NULL,
	Nombre VARCHAR(15) NOT NULL
);

-- Se agrega la parte recursiva a la tabla 'Categoría'.
ALTER TABLE INVENTARIO.CATEGORIA
	ADD CatSup INT FOREIGN KEY REFERENCES INVENTARIO.CATEGORIA(IdCategoria);

-- Tabla 'Producto'.
CREATE TABLE INVENTARIO.PRODUCTO
(
	IdProducto INT NOT NULL CONSTRAINT PK_IdProduct PRIMARY KEY,
	Descripción VARCHAR(20) NOT NULL,
	DescripciónDetallada VARCHAR(50) NOT NULL,
	Precio MONEY NOT NULL,
	IdCategoria INT NOT NULL FOREIGN KEY REFERENCES INVENTARIO.CATEGORIA(IdCategoria),
	Disponible INT NOT NULL
);

-- Tabla 'Img_producto'.
CREATE TABLE INVENTARIO.IMG_PRODUCTO
(
	IdImagen INT IDENTITY(1,1),
	IdProducto INT NOT NULL FOREIGN KEY REFERENCES INVENTARIO.PRODUCTO(IdProducto),
	Imagen IMAGE NOT NULL,
	CONSTRAINT PK_IMG_PRODUCTO PRIMARY KEY(IdImagen,IdProducto)
);

-- Tabla 'Oferta'.
CREATE TABLE INVENTARIO.OFERTA
(
	IdOferta INT NOT NULL CONSTRAINT PK_IdOferta PRIMARY KEY,
	FechaInicioOferta DATE NOT NULL,
	FechaFinOferta DATE NOT NULL,
	DescripcionOferta VARCHAR(10) NOT NULL,
	DescripcionOfertaDatallada VARCHAR(50) NOT NULL
);

-- Tabla 'Producto_oferta'.
CREATE TABLE INVENTARIO.PRODUCTO_OFERTA
(
	IdOferta INT NOT NULL FOREIGN KEY REFERENCES INVENTARIO.OFERTA,
	IdProducto INT NOT NULL FOREIGN KEY REFERENCES INVENTARIO.PRODUCTO,
	CONSTRAINT PK_PRODUCTO_OFERTA PRIMARY KEY(IdOferta,IdProducto)
);

-- Tabla 'Producto_Compra'.
CREATE TABLE TRANSACCION.PRODUCTO_COMPRA
(
	IdCompra INT NOT NULL FOREIGN KEY REFERENCES TRANSACCION.COMPRA(IdCompra),
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario),
	IdProducto INT NOT NULL FOREIGN KEY REFERENCES INVENTARIO.PRODUCTO(IdProducto),
	cantidad INT NOT NULL,
	ProductoSubTotal MONEY,
	CONSTRAINT PK_PRODUCTO_COMPRA PRIMARY KEY (IdCompra,NombreUsuario,IdProducto)
);

-- Tabla 'Lista'.
CREATE TABLE CATALOGO.LISTA
(
	IdLista INT NOT NULL CONSTRAINT PK_IdLista PRIMARY KEY,
	NombreUsuario VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES PERSONA.USUARIO(NombreUsuario)
);

-- Tabla 'Cesta'.
CREATE TABLE CATALOGO.CESTA
(
	IdLista INT NOT NULL CONSTRAINT PK_IdLista_CESTA PRIMARY KEY FOREIGN KEY (IdLista) REFERENCES CATALOGO.LISTA(IdLista),
	FechaPosible DATE NULL,
);

-- Tabla 'Deseo'.
CREATE TABLE CATALOGO.DESEO
(
	IdLista INT NOT NULL CONSTRAINT PK_IdLista_DESEO PRIMARY KEY FOREIGN KEY (IdLista) REFERENCES CATALOGO.LISTA(IdLista),
);

-- Tabla 'Lista_producto'
CREATE TABLE CATALOGO.LISTA_PRODUCTO
(
	IdLista INT NOT NULL FOREIGN KEY REFERENCES CATALOGO.LISTA(IdLista),
	IdProducto INT NOT NULL FOREIGN KEY REFERENCES INVENTARIO.PRODUCTO(IdProducto),
	CantidadProducto INT NOT NULL,
	CONSTRAINT PK_ListaProducto PRIMARY KEY (IdLista,IdProducto)
);
--------------------------------------------------------------------------------------------------------------------------------------------------------