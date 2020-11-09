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
-- Script: DML.sql
-- Descripción: Este script presenta el lenguaje de manipulación de datos que se implementa para la base de datos.
--
-- Fecha de creación: Mayo 27, 2020.
-- Última actualización: Mayo 31, 2020.
-- Versión: 1.5
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se usa la base de datos llamada 'Tienda'
USE TIENDA
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- VISTAS
-- Descripción: Se crean todos las vistas que se requieran dentro de la base de datos para brindar un funcionamiento eficiente de la misma.
-- Vista 'INVENTARIO.CONSULTAR_PRODUCTO'. Se hace una consulta que contenga toda la información correspondiente a un producto
CREATE VIEW INVENTARIO.CONSULTAR_PRODUCTO 
	AS
		-- Expresión en álgebra relacional:
		-- Π P.IdProducto, P.Descripción, P.DescripciónDetallada, P.Precio, P.IdCategoria, C.Nombre, C.NivelCategoria, C.CatSup, Imp.Imagen 
		-- ( σ P.IdCategoria = C.IdCategoria (σ P.IdProducto = ImP.IdProducto ( INVENTARIO.PRODUCTO P X INVENTARIO.IMG_PRODUCTO ImP) ) X INVENTARIO.PRODUCTO P )
		SELECT P.IdProducto, P.Descripción, P.DescripciónDetallada, P.Precio, P.IdCategoria, C.Nombre, C.NivelCategoria, C.CatSup, Imp.Imagen
			FROM INVENTARIO.PRODUCTO P
			LEFT JOIN INVENTARIO.IMG_PRODUCTO ImP
				ON P.IdProducto = ImP.IdProducto
			LEFT JOIN INVENTARIO.CATEGORIA C
				ON P.IdCategoria = C.IdCategoria;
-- Se corrobora el funcionamiento de la vista 'INVENTARIO.CONSULTAR_PRODUCTO'
SELECT * FROM INVENTARIO.CONSULTAR_PRODUCTO;

-- Vista 'INVENTARIO.CONSULTAR_OFERTA'
CREATE VIEW INVENTARIO.CONSULTAR_OFERTA
	AS
		-- Expresión en álgebra relacional:
		-- Π O.IdOferta,O.DescripcionOferta,PO.IdProducto,P.Descripción,O.FechaInicioOferta,O.FechaFinOferta,O.DescripcionOfertaDatallada
		-- ( σ PO.IdOferta = O.IdOferta ( INVENTARIO.OFERTA O X ( σ P.IdProducto = PO.IdProducto ( INVENTARIO.PRODUCTO_OFERTA PO X INVENTARIO.PRODUCTO P ) ) ) )
		SELECT O.IdOferta,O.DescripcionOferta,PO.IdProducto,P.Descripción,O.FechaInicioOferta,O.FechaFinOferta,O.DescripcionOfertaDatallada 
			FROM INVENTARIO.OFERTA O
			INNER JOIN INVENTARIO.PRODUCTO_OFERTA PO
			ON PO.IdOferta = O.IdOferta
			LEFT JOIN INVENTARIO.PRODUCTO P
			ON P.IdProducto = PO.IdProducto
-- Se corrobora el funcionamiento de la vista 'INVENTARIO.CONSULTAR_PRODUCTO'
SELECT * FROM INVENTARIO.CONSULTAR_OFERTA
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS
-- Descripción: Se crean todos los procedimientos almacenados que se requieran dentro de la base de datos para brindar un funcionamiento eficiente de la
-- 				misma.
-- Procedimiento almacenado 'PA_COMPRAR_CESTA'
-- Este procedimiento realiza la compra de la cesta del usuario, se eliminan los productos de la lista de cesta 
CREATE OR ALTER PROCEDURE PA_COMPRAR_CESTA(@IdLista INT,@FechaCompra DATE,@ModoDeEnvio VARCHAR(15))
	AS
	BEGIN
		DECLARE
			@V_NombreUsuario VARCHAR(15),
			@V_IdProducto INT,
			@V_Cantidad INT,
			@V_IdLista INT,
			@V_IdCompra INT;
		-- Se corrobora que el ID de la lista se encuentre dentro de las cestas de compra
		IF (EXISTS(SELECT IdLista FROM CATALOGO.CESTA WHERE IdLista = @IdLista))
		BEGIN
			-- Se obtiene el nombre de usuario
			SELECT @V_NombreUsuario = NombreUsuario 
				FROM CATALOGO.LISTA
				WHERE IdLista = @IdLista
			-- Se genera el registro de compra
			INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra,FechaCompra)
				VALUES(@V_NombreUsuario,'I',@FechaCompra)
			-- Se obtiene el ID de la compra previamente generada
			SELECT @V_IdCompra = IdCompra 
				FROM TRANSACCION.COMPRA
				WHERE ((NombreUsuario = @V_NombreUsuario AND FechaCompra = @FechaCompra) AND TipoCompra = 'I')
			-- Se agrega el registro de compra en internet
			INSERT INTO TRANSACCION.INTERNET (NombreUsuario,IdCompra,ModoDeEnvio) 
				VALUES(@V_NombreUsuario,@V_IdCompra,@ModoDeEnvio)
			-- Se agregan los producto de la compra
			DECLARE C_LISTA_PRODUCTO CURSOR	
			FOR
				SELECT LP.IdLista, LP.IdProducto, LP.CantidadProducto, L.NombreUsuario 
					FROM CATALOGO.LISTA_PRODUCTO AS LP
					INNER JOIN CATALOGO.LISTA AS L
						ON LP.IdLista = L.IdLista
			OPEN C_LISTA_PRODUCTO;
			FETCH C_LISTA_PRODUCTO INTO @V_IdLista, @V_IdProducto, @V_Cantidad,  @V_NombreUsuario
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF(@V_IdLista = @IdLista)
				BEGIN 
					INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
						VALUES(@V_IdCompra,@V_NombreUsuario,@V_IdProducto,@V_Cantidad)
				END
				FETCH C_LISTA_PRODUCTO INTO @V_IdLista, @V_IdProducto, @V_Cantidad,  @V_NombreUsuario
			END
			CLOSE C_LISTA_PRODUCTO;
			DEALLOCATE C_LISTA_PRODUCTO;
			DELETE FROM CATALOGO.LISTA_PRODUCTO
				WHERE IdLista = @IdLista
			DELETE FROM CATALOGO.CESTA
				WHERE IdLista = @IdLista
		END	
		ELSE
			PRINT 'No existe la cesta de compra'
	END
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCIONES
-- Descripción: Se crean todas las funciones que se requieran dentro de la base de datos para brindar un funcionamiento eficiente de la misma.
-- Función 'total_Ventas'
-- Esta función obtiene el total de ventas realizadas por un vendedor solo con ingresar su ID.
CREATE OR ALTER FUNCTION TRANSACCION.TOTAL_VENTAS(@IdVendedor INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE 
			@Total INT;
		-- Se corrobora que el ID de vendedor esté dentro de la tabla de transacciones fisicas.
		-- En caso de encontrase el ID, se obtiene el número total de ventas que este tenga
		IF(EXISTS(SELECT IdVendedor FROM TRANSACCION.FISICO WHERE IdVendedor = @IdVendedor))
		BEGIN
			SELECT @Total = COUNT(IdVendedor) 
				FROM TRANSACCION.FISICO
				WHERE IdVendedor = @IdVendedor;
		END
		-- En caso de no encontrarse el ID, se pone cero ventas totales.
		ELSE
		BEGIN
			SET @Total = 0;
		END
		-- Se retorna el número de ventas que el usuario o vendedor realizó.
		RETURN @Total
	END
-- Funciones 'Transacción.Producto_caro'
-- Esta función obtiene el producto más caro de la categoría que se indique.
CREATE OR ALTER FUNCTION INVENTARIO.PRODUCTO_CARO(@IdCategoria INT)
	RETURNS TABLE 
	AS 
	-- Se retorna una tabla con toda la información de un producto
	RETURN 
	(
		-- Se obtiene la información de la vista consultar producto, debido a que cuenta con todas las características necesarias
		-- para realizar un consulta con información detallada de los productos.
		SELECT * FROM INVENTARIO.CONSULTAR_PRODUCTO 
			WHERE 
			(
				-- Se realiza una subconsulta que obtenga el precio máximo de los productos dentro de una categoría
				PRECIO = ( SELECT MAX(Precio) FROM INVENTARIO.PRODUCTO WHERE IdCategoria = @IdCategoria )
				AND
				-- Además debe de corresponder a la categoría deseada
				IdCategoria = @IdCategoria
			)
	)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- DISPARADORES / TRIGGERS
-- Descripción: Se crean todos los disparadores que se requieran dentro de la base de datos para brindar un funcionamiento eficiente de la misma.
-- Disparador 'TRANSACCION.TR_PRODUCTO_COMPRA'. 
-- Este disparador obtiene el subtotal de la compra que haga el usuario, relacionando los productos sus precios y las cantidas, a la par, se modifica el
-- monto total de la compra relacionada a este id de compra.
CREATE OR ALTER TRIGGER TRANSACCION.TR_PRODUCTO_COMPRA
	ON TRANSACCION.PRODUCTO_COMPRA
	INSTEAD OF INSERT
	AS
	BEGIN
		-- Se declaran las variables que se requieren para consultas y cálculos posteriores.
		DECLARE
			@V_IdCompra INT,
			@V_NombreUsuario VARCHAR(15),
			@V_IdProducto INT,
			@V_Cantidad INT,
			@V_SubTotal MONEY,
			@V_Disponible INT;
		-- Se almacenan los datos insertados en las variables.
		SELECT @V_IdCompra = IdCompra, @V_NombreUsuario = NombreUsuario, @V_IdProducto = IdProducto, @V_Cantidad = cantidad
			FROM INSERTED;
		-- Se almacena la cantidad disponible de los productos en tienda.
		SELECT @V_Disponible = Disponible 
			FROM INVENTARIO.PRODUCTO
			WHERE IdProducto = @V_IdProducto;
		-- Se valida que la se tenga la cantidad de productos suficiente para realizar la compra del producto.
		IF (@V_Disponible - @V_Cantidad >= 0)
		BEGIN
			-- Se hace una consulta para saber el precio del producto y obtener el subtotal.
			SELECT @V_SubTotal = @V_Cantidad * precio FROM INVENTARIO.PRODUCTO
				WHERE IdProducto = @V_IdProducto;
			-- Se hace la actualización de los datos dentro de la tabla.
			INSERT TRANSACCION.PRODUCTO_COMPRA(IdCompra,NombreUsuario,IdProducto,cantidad,ProductoSubTotal)
				VALUES (@V_IdCompra,@V_NombreUsuario,@V_IdProducto,@V_Cantidad,@V_SubTotal)
			UPDATE TRANSACCION.COMPRA
				SET SubTotal = SubTotal + @V_SubTotal
				WHERE IdCompra = @V_IdCompra;
			UPDATE INVENTARIO.PRODUCTO
				SET Disponible = Disponible - @V_Cantidad
				WHERE IdProducto = @V_IdProducto
		END
		ELSE
			PRINT 'No se cuenta con el inventario suficiente para realizar la compra'
	END
-- Disparador 'TRANSACCION.COMISION_VENDEDOR'.
-- Se realiza un disparador con base a la compra en físico para darle una comisión al vendedor del 10%.
CREATE OR ALTER TRIGGER TRANSACCION.TR_COMISION_VENDEDOR
	ON TRANSACCION.FISICO
	FOR INSERT
	AS
	BEGIN
		DECLARE
			@V_NombreUsuario VARCHAR(15),
			@V_IdCompra INT,
			@V_IdVendedor INT,
			@V_Comision MONEY
		-- Se obtienen los datos de la inserción realizada.
		SELECT @V_NombreUsuario = NombreUsuario, @V_IdCompra = IdCompra, @V_IdVendedor = IdVendedor 
			FROM INSERTED;
		-- Se obtiene el monto total de la compra realizada con los datos previamente obtenidos.
		SELECT @V_Comision = MontoTotal 
			FROM TRANSACCION.COMPRA
			WHERE 
			(
				IdCompra = @V_IdCompra
				AND
				NombreUsuario = @V_NombreUsuario
			)
		-- Se actualiza la comisión del vendedor.
		UPDATE PERSONA.VENDEDOR
			SET Comision = Comision + @V_Comision * 0.10
			WHERE IdVendedor = @V_IdVendedor
	END
-- Disparador 'CATALOGO.TR_CANCELACION_CESTA'.
-- Este disparador realiza la cancelación de la inserción en cesta si no se tiene una fecha estimada de compra al momento de guardarse.
CREATE OR ALTER TRIGGER CATALOGO.TR_CANELACION_CESTA
	ON CATALOGO.CESTA
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE
			@V_FechaPosible DATE,
			@V_FechaActual DATE,
			@V_IdLista INT;
		-- Se obtiene la información a insertar.
		SELECT @V_IdLista = IdLista, @V_FechaPosible = FechaPosible 
			FROM INSERTED;
		-- Se obtiene la fecha actual
		SELECT @V_FechaActual = CONVERT(DATE,GETDATE());
		-- Si no se ingresó fecha posible de compra, no se realiza la inserción mostrando un mensaje en pantalla.
		IF (@V_FechaPosible IS NULL)
		BEGIN
			PRINT'La lista no puede ingresarse a la cesta, ingrese una fecha de compra';
		END
		-- Si se ingreso una fecha posible de compra realiza las siguientes instrucciones.
		ELSE
		BEGIN
			-- Se determina si la fecha posible de compra es el mismo día o después de la fecha actual.
			-- En caso de ser verdadero, se ingresa la lista a la cesta.
			IF (@V_FechaPosible >= @V_FechaActual)
			BEGIN
				INSERT INTO CATALOGO.CESTA VALUES(@V_IdLista,@V_FechaPosible);
			END
			-- En caso contrario, no se realiza la inserción y se muestra un mensaje en pantalla.
			ELSE
				PRINT'Fecha de compra inválida';
		END
	END
--------------------------------------------------------------------------------------------------------------------------------------------------------