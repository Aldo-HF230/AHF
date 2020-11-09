--------------------------------------------------------------------------------------------------------------------------------------------
-- Autor(es): Flores González, Jesús Eduardo.
--			  Hernández Fontes, Aldo.
--			  Sandoval Lara, Lesly Mayte.
--
-- Asignatura: Bases de Datos.
-- Profesor(a): Martha López Pelcastre.
-- Grupo: 02
-- Semestre: 2020 - 2
--
-- Script: seguridad.sql
-- Descripción: Este Scrip muestra la creacion de los usuarios involucrando los roles y privilegios que estos tienen dentro de la base de 
--				datos. 
--
-- Fecha de creación: Mayo 29, 2020.
-- Última actualización: Mayo 31, 2020.
-- Versión: 1.6
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se usa la base de datos llamada tienda.
USE TIENDA;
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se crean los roles a los cuales se les asignarán los ususarios creados. 
CREATE ROLE VISITANTE;
CREATE ROLE USUARIO; 
CREATE ROLE GESTOR;
CREATE ROLE VENDEDOR;  
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se asignan permisos para el rol de visitante.
	--CONSULTAR PRODUCTOS DISPONIBLES EN LA TIENDA
	GRANT SELECT  ON  INVENTARIO.CONSULTAR_PRODUCTO  TO VISITANTE
	--ALMACENA PRODUCTOS EN LA CESTA DE COMPRA
	GRANT SELECT,INSERT,UPDATE  ON CATALOGO.CESTA TO VISITANTE
	--PERMISO PARA QUE PUEDA REGISTRARSE EN LA BASE 
	GRANT INSERT ON PERSONA.USUARIO TO VISITANTE 
	--VACIAR Y AGREGAR LISTA DE COMPRA YA EXISTENTE 
	GRANT DELETE, INSERT,SELECT ON CATALOGO.LISTA_PRODUCTO TO VISITANTE
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se otorgan los permisos para los usuarios.
--CONSULTAR PRODUCTOS
	GRANT SELECT  ON  INVENTARIO.CONSULTAR_PRODUCTO TO USUARIO
	--ALMACENA PRODUCTOS EN LA CESTA DE COMPRA
	GRANT SELECT,INSERT,UPDATE  ON CATALOGO.CESTA TO USUARIO
	--PROCEDE CON LA COMPRA EN LA CESTA
	GRANT EXECUTE ON PA_COMPRAR_CESTA TO USUARIO 
	--AGREGAR UNA LISTA 
	GRANT INSERT, DELETE, UPDATE ON CATALOGO.LISTA TO USUARIO
	--AGREGAR PRODUCTOS A LA LISTA 
	GRANT SELECT,INSERT, DELETE,UPDATE ON CATALOGO.LISTA_PRODUCTO TO USUARIO
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se otorgan los permisos para los gestores.
---GESTIONAR OFERTAS
	GRANT INSERT, UPDATE, DELETE,SELECT ON INVENTARIO.OFERTA TO GESTOR
	--GESTIONAR LAS CATEGORIAS
	GRANT INSERT,UPDATE, DELETE,SELECT ON INVENTARIO.CATEGORIA TO GESTOR
	--GESTIONAR PRODUCTOS
	GRANT INSERT,UPDATE,DELETE,SELECT ON INVENTARIO.PRODUCTO TO GESTOR
	--PERIODO DE TIEMPO PARA GESTORES
	GRANT SELECT,UPDATE ON PERSONA.GESTOR TO GESTOR
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se asignan los permisos para vendedor.
GRANT INSERT, UPDATE, DELETE,SELECT ON TRANSACCION.FISICO TO VENDEDOR
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se crea el procedimiento almacenado para realizar los logins.
CREATE OR ALTER PROCEDURE DBO.CREACION_LOGIN (@Name varchar(15))
	AS 
	BEGIN 
		-- Variables para ejecutar el login
		DECLARE 
			@login varchar(200),
			@Usuario varchar(100),
			@Rol varchar(100),
			@Passwrd varchar(15);
		-- Se comprueba la existencia del usuario dentro de la base de datos
		IF EXISTS (SELECT *FROM PERSONA.USUARIO WHERE NombreUsuario =@Name)
		BEGIN
			SELECT @Passwrd=  CONTRASEÑA FROM PERSONA.USUARIO WHERE NombreUsuario = @Name
			-- Se utiliza CHAR(39) para las comillas que lleva la contraseña
			SET @login = 'CREATE LOGIN '+ @Name +' WITH PASSWORD = '+char(39)+@Passwrd+char(39)+',DEFAULT_DATABASE=Tienda,
			 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;'
			-- Se crea el login
			EXEC(@login)
			PRINT 'LOGIN CREADO'
			IF EXISTS (SELECT TipoPersona FROM PERSONA.USUARIO where(NombreUsuario =@Name AND TipoPersona = 'C'))
				BEGIN 
					SET @Usuario= 'CREATE USER '+@Name+' FOR LOGIN '+@Name+';'
					EXEC(@Usuario)
					SET @Rol= 'ALTER ROLE USUARIO ADD MEMBER '+@Name+';'
					EXEC(@Rol)
					PRINT 'USUARIO DE  CREADO'
				END
			IF EXISTS (SELECT TipoPersona FROM PERSONA.USUARIO where(NombreUsuario =@Name AND TipoPersona = 'G')) 
				BEGIN 
					SET @Usuario= 'CREATE USER '+@Name+' FOR LOGIN '+@Name+';'
					EXEC(@Usuario)
					SET @Rol= 'ALTER ROLE GESTOR ADD MEMBER '+@Name+';'
					EXEC(@Rol)
					PRINT 'USUARIO DE GESTOR CREADO'
				END
			IF EXISTS (SELECT TipoPersona FROM PERSONA.USUARIO where(NombreUsuario =@Name AND TipoPersona = 'V'))
				BEGIN 
					SET @Usuario= 'CREATE USER'+' '+@Name+' '+'FOR LOGIN'+' '+@Name+';'
					EXEC(@Usuario)
					SET @Rol= 'ALTER ROLE VENDEDOR ADD MEMBER'+' '+@Name+';'
					EXEC(@Rol)
					PRINT 'USUARIO DE VENDEDOR CREADO'
				END
		END
		-- En caso de no existir, la persona que accede es un visitante.
		ELSE 
			PRINT 'ERES VISITANTE, DEBES ACCEDER A LA BASE CON EL LOGIN: VISITANTE1 Y PASSWORD: 12345'		
	END;
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se comprueba el funcionamiento del procedimiento almacenado
SELECT NombreUsuario FROM PERSONA.USUARIO WHERE TipoPersona= 'C'
-- Se crea un vendedor
EXECUTE DBO.CREACION_LOGIN 'AHF' 
-- Se crea un gestor
EXECUTE DBO.CREACION_LOGIN 'Carlitos99'
-- Se crea un cliente
EXECUTE DBO.CREACION_LOGIN 'AleCat'
--------------------------------------------------------------------------------------------------------------------------------------------
-- Se crea el login y usuario para cualquier visitante.
USE master;
CREATE LOGIN VISITANTE1 WITH PASSWORD='12345', DEFAULT_DATABASE=TIENDA, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
USE Tienda;
CREATE USER VISITANTE1 FOR LOGIN VISITANTE1
ALTER ROLE VISITANTE ADD MEMBER VISITANTE1
--------------------------------------------------------------------------------------------------------------------------------------------
-- PROBANDO LOS PERMISOS DE GESTOR
-- GESTION DE OFERTAS
	-- AGREGAR OFERTA 
	INSERT INTO INVENTARIO.OFERTA (IdOferta, FechaInicioOferta, FechaFinOferta, DescripcionOferta, DescripcionOfertaDatallada)
		VALUES (6, '2020-05-25', '2020-06-01', 'BON 20%', 'BONIFICACION 20% EN TARJETAS BANAMEX')
	-- CONSULTAR LAS OFERTAS DISPONIBLES
		SELECT *FROM INVENTARIO.OFERTA 
	-- MODIFICAR OFERTA
		UPDATE  INVENTARIO.OFERTA
			SET FechaInicioOferta = '2020-05-30'
			WHERE IdOferta=6
	-- ELIMINAR OFERTA
		DELETE FROM INVENTARIO.OFERTA WHERE IdOferta=6
--------------------------------------------------------------------------------------------------------------------------------------------
-- GESTION DE CATEGORIAS
	SELECT *FROM INVENTARIO.CATEGORIA 
	-- AGREGAR CATEGORIA
		INSERT INTO INVENTARIO.CATEGORIA (NivelCategoria, Nombre)
			VALUES (1,'CUIDADOPER')
	-- MODIFICAR CATEGORIO
		UPDATE INVENTARIO.CATEGORIA
		SET Nombre = 'CUIDADO'
		WHERE Nombre='CUIDADOPER'
	-- ELIMINAR CATEGORIA 
		DELETE FROM INVENTARIO.OFERTA WHERE Nombre = 'CUIDADO'
--------------------------------------------------------------------------------------------------------------------------------------------
-- GESTION DE LOS PRODUCTOS
	SELECT *FROM INVENTARIO.PRODUCTO
	-- AGREGAR PRODUCTO
		INSERT INTO INVENTARIO.PRODUCTO (IdProducto, Descripción, DescripciónDetallada, Precio, IdCategoria, Disponible)
			VALUES (26, 'PESCADO', 'CORTE DE PESCADO 50GR', 250, 19, 20)
	-- MODIFICAR PRODUCTOS
		UPDATE INVENTARIO.PRODUCTO
			SET Descripción = 'PESCADIRIQUI'
			WHERE IdProducto=26
	-- ELIMINAR PRODUCTOS
		DELETE FROM INVENTARIO.PRODUCTO WHERE IdProducto = 26
--------------------------------------------------------------------------------------------------------------------------------------------
-- CAMBIO EN EL REGISTRO DE GESTORES
	SELECT *FROM PERSONA.GESTOR
	-- CAMBIAR LA FECHA FIN DEL GESTOR LMSL
		UPDATE PERSONA.GESTOR
			SET FechaFin='2020-03-30'
			WHERE IdGestor=1 
--------------------------------------------------------------------------------------------------------------------------------------------
-- PROBANDO LOS PRIVILEGIOS PARA UN VENDEDOR
-- GESTION DE LA TABLA PARA VENTAS EN FISICO
	SELECT *FROM TRANSACCION.FISICO
	-- AGREGAMOS VENTA
		INSERT INTO TRANSACCION.FISICO VALUES ('AHF123',20,2)
	-- MODIFICAMOS VENTA
	UPDATE TRANSACCION.FISICO 
		SET IdVendedor=3
		WHERE IdFisico=12
	-- ELIMINAR VENTA
	DELETE FROM TRANSACCION.FISICO WHERE IdFisico=12
--------------------------------------------------------------------------------------------------------------------------------------------
-- PROBANDO PRIVILEGIOS PARA UN USUARIO
-- CONSULTAR PRODUCTOS
	SELECT *FROM INVENTARIO.CONSULTAR_PRODUCTO 
	SELECT *FROM CATALOGO.LISTA_PRODUCTO where IdLista=4
	SELECT *FROM CATALOGO.CESTA
	-- AGREGAR PRODUCTOS A LA LISTA 
		INSERT INTO CATALOGO.LISTA_PRODUCTO VALUES(4,10,3)
	-- PROCEDER A LA COMPRA CON LO QUE ESTA EN CESTA
		EXECUTE PA_COMPRAR_CESTA 4,'2020-06-02','EXPRESS'
--------------------------------------------------------------------------------------------------------------------------------------------
-- PROBANDO PRIVILEGIOS PARA UN VISITANTE
-- CONSULTAR PRODUCTOS EN TIENDA
	SELECT *FROM INVENTARIO.CONSULTAR_PRODUCTO
	-- ALMACENAR PRODUCTOS EN UNA CESTA
	SELECT *FROM CATALOGO.CESTA
	-- CON UN IDLISTA YA EXISTENTE
	INSERT INTO CATALOGO.CESTA VALUES(1,'2020-06-05')
	-- AGREGAR PRODUCTOS A ESTA LISTA
	INSERT INTO CATALOGO.LISTA_PRODUCTO VALUES(1,4,2)
	-- REGISTRARSE COMO USUARIO 
	INSERT INTO PERSONA.USUARIO (NombreUsuario, Contraseña, CURP, Sexo, Nombre, Paterno, Materno, TipoPersona)
		VALUES  ('ENT_mx', '123entmx', 'EMT350908HDFNNS05', 'H', 'Emilio', 'Falcón', 'Gomez', 'C')
