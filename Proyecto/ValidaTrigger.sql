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
-- Script: ValidaTrigger.sql
-- Descripción: Este script realizar una insercciones en la base de datos en aquellas estructuras o tablas las cuales están asociads con un disparador, 
--				esto con el fin de corroborar que los disparadores funcionen correctamente
--
-- Fecha de creación: Mayo 31, 2020.
-- Última actualización: Mayo 31, 2020.
-- Versión: 1.1
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se implementa la base de datos 'Tienda'.
USE Tienda
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se valida el disparador 'TRANSACCION.TR_PRODUCTO_COMPRA'.
-- Se consultan las tablas relacionadas con este trigger.
SELECT * FROM TRANSACCION.COMPRA;
SELECT * FROM TRANSACCION.PRODUCTO_COMPRA;
SELECT * FROM INVENTARIO.PRODUCTO;
-- Se comienza una transaccón que no afecta los atrbutos previamente almacenados.
BEGIN TRAN
	INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
		VALUES ('AHF123','I', '2020-06-30');
	-- Compra dentro de la disponibilidad
	INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
		VALUES (21, 'AHF123', 2, 2);
	-- Compra fuera de la disponibilidad
	INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
		VALUES (21, 'AHF123', 8, 5);
	-- Se consultan las tablas resultantes de la inserción y validación del trigger
	SELECT * FROM TRANSACCION.COMPRA;
	SELECT * FROM TRANSACCION.PRODUCTO_COMPRA;
	SELECT * FROM INVENTARIO.PRODUCTO;
ROLLBACK TRAN
-- Se reincia el contado de ID Compra
DBCC CHECKIDENT('TRANSACCION.COMPRA',RESEED,20);
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se valida el disparador 'TRANSACCION.COMISION_VENDEDOR'.
-- Se consulta la tabla relacionada con este disparador.
SELECT * FROM PERSONA.VENDEDOR;
-- Se comienza una transaccón que no afecta los atrbutos previamente almacenados.
BEGIN TRAN
	INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
		VALUES ('JEF_mx','F', '2020-06-30');
	-- Compra que da una comisión al vendedor.
	INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
		VALUES (21, 'JEF_mx', 2, 2);
	-- Se le asigna la venta a un vendedor, en este caso, con ID Vendedor = 2.
	INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
		VALUES ('JEF_mx',21,2)
	-- Se consultan en la tabla de vendedor que se le agregue una comisión.
	SELECT * FROM PERSONA.VENDEDOR;
ROLLBACK TRAN
-- Se reincia el contado de ID Compra
DBCC CHECKIDENT('TRANSACCION.COMPRA',RESEED,20);
DBCC CHECKIDENT('TRANSACCION.FISICO',RESEED,10);
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se valida el disparador 'CATALOGO.TR_CANCELACION_CESTA'.
-- Se consulta la tabla que esté relacionada con este disparador.
SELECT * FROM CATALOGO.CESTA;
BEGIN TRAN
	-- Se agrega un atributo nuevo a la lista
	INSERT INTO CATALOGO.LISTA (IdLista, NombreUsuario)
		VALUES (6,'AHF123');
	-- Se intenta agregar a la cesta sin una fecha posible de compra
	INSERT INTO CATALOGO.CESTA(IdLista)
		VALUES (6);
	-- Se intenta agregar a la cesta con una fecha posible de compra antes de la fecha actual
	INSERT INTO CATALOGO.CESTA(IdLista,FechaPosible)
		VALUES(6,'2020-05-30');
	-- Se inserta a la cesta con una fecha posible posterior a la actual
	INSERT INTO CATALOGO.CESTA(IdLista,FechaPosible)
		VALUES(6,'2020-06-10');
	-- Se consulta el resultado del disparador
	SELECT * FROM CATALOGO.CESTA;
ROLLBACK TRAN
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se valida el procedimiento almacenado 'PA_COMPRAR_CESTA'.
SELECT * FROM CATALOGO.CESTA;
SELECT * FROM CATALOGO.LISTA_PRODUCTO;
SELECT * FROM INVENTARIO.PRODUCTO;
BEGIN TRAN
	EXECUTE PA_COMPRAR_CESTA 3,'2020-05-31','Express';
	SELECT * FROM CATALOGO.CESTA;
	SELECT * FROM CATALOGO.LISTA_PRODUCTO;
	SELECT * FROM TRANSACCION.INTERNET ORDER BY IdInternet;
	SELECT * FROM TRANSACCION.COMPRA;
	SELECT * FROM TRANSACCION.PRODUCTO_COMPRA;
	SELECT * FROM INVENTARIO.PRODUCTO;
ROLLBACK TRAN
--------------------------------------------------------------------------------------------------------------------------------------------------------