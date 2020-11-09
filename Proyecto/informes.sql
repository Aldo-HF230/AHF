--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Autor(es): Flores Gonz�lez, Jes�s Eduardo.
--			  Hern�ndez Fontes, Aldo.
--			  Sandoval Lara, Lesly Mayte.
--
-- Asignatura: Bases de Datos.
-- Profesor(a): Martha L�pez Pelcastre.
-- Grupo: 02
-- Semestre: 2020 - 2
--
-- Script: informes.sql
-- Descripci�n: Este script Realiza todas las estadisticas que se buscan dentro del esquema de base de datos que se est� empleando para administrar una
--				tienda en l�nea.

-- Fecha de creaci�n: Mayo 31, 2020.
-- �ltima actualizaci�n: Mayo 31, 2020.
-- Versi�n: 1.1
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se usa la abse de datos llamda 'Tienda'.
USE TIENDA;
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- ESTADISTICA 1
-- Que vendedor realiza mas ventas en un periodo de tiempo, recibe como parameto el a�o en el que se quiere el informe.
-- Se consulta que posteriormente servir� como vista.
SELECT V.idVendedor,V.NombreUsuario, COUNT(F.idCompra) AS 'NUM VENTAS',YEAR(C.fechaCompra)
	FROM PERSONA.VENDEDOR V
	INNER JOIN TRANSACCION.FISICO F
		ON F.idVendedor = V.idVendedor
	INNER JOIN TRANSACCION.COMPRA C
		ON C.IdCompra = F.idCompra
	GROUP BY V.NombreUsuario,V.idVendedor,YEAR(C.fechaCompra)
-- Se crea una vista 'TRANSACC�N.SUMA' de donde se puede obtener la suma de las ventas asociadas a los vendedores.
CREATE OR ALTER VIEW TRANSACCION.SUMA 
	AS 
		SELECT V.idVendedor AS idVendedor ,V.NombreUsuario AS Nombre,COUNT(F.idCompra) AS Suma , YEAR(C.fechaCompra) AS fecha 
			FROM PERSONA.VENDEDOR V
			INNER JOIN TRANSACCION.FISICO F
				ON F.idVendedor = V.idVendedor
			INNER JOIN TRANSACCION.COMPRA C
				ON C.IdCompra = F.idCompra
		GROUP BY V.NombreUsuario,V.idVendedor,YEAR(C.fechaCompra)
-- Se crea el procedimiento almacenado 'PA_MAS_VENTAS' que recibe como par�metros dos fechas, estas ser�n el periodo de tiempo.
CREATE OR ALTER PROCEDURE PA_MAS_VENTAS (@DateI INT, @DateF INT)
	AS
	BEGIN 
		DECLARE 
			@PromedioV INT;
		SELECT @PromedioV = AVG(suma) 
			FROM TRANSACCION.SUMA;
		SELECT * FROM TRANSACCION.SUMA
			WHERE((fecha BETWEEN @DateI AND @DateF) AND suma>= @PromedioV)
	END 
-- Se comprueba el funcionamiento del procedimiento almacenado 'PA_MAS_VENTAS'
EXECUTE PA_MAS_VENTAS 2019,2020
--------------------------------------------------------------------------------------------------------------------------------------------
-- ESTADISTICA 2
-- En qu� epocas se realizan m�s ventas
-- Se comprueban las consultas que se implementar�n. 
SELECT C.FECHACOMPRA, COUNT(C.IDCOMPRA) 
	FROM TRANSACCION.COMPRA AS C
	GROUP BY C.FECHACOMPRA
-- Se crea la vista 'TRANSACCION.FECHA' para acceder facilmente al total de compras en una fecha. 
CREATE OR ALTER VIEW TRANSACCION.FECHA 
	AS 
		SELECT C.FECHACOMPRA AS FECHA, COUNT(C.IDCOMPRA) AS NUMCOMPRAS 
			FROM TRANSACCION.COMPRA AS C
			GROUP BY C.FECHACOMPRA
-- Se crea el procedimiento almacenado 'PA_MASV'.
CREATE OR ALTER PROCEDURE PA_MASV
	AS
	BEGIN
		DECLARE @PromC int
		-- Se obtiene el promedio de compras se realizan.
		SELECT @PromC = AVG(NUMCOMPRAS) FROM TRANSACCION.FECHA
		-- Se muestran las commpras que son mayores o iguales al promedio de las mismas.
		SELECT *FROM TRANSACCION.FECHA WHERE NUMCOMPRAS>= @PromC
	END
-- Se comprueba el funcionamiento del procedimiento almacenado 'PA_MASV'.
EXECUTE PA_MASV
--------------------------------------------------------------------------------------------------------------------------------------------
-- ESTADISTICA 3
-- Qu� productos son los m�s comprados. 
-- Se comprueban las consultas que se implementar�n
SELECT P.IdProducto, COUNT(PC.IdProducto) AS 'NUM COMPRAS' FROM INVENTARIO.PRODUCTO AS P
	INNER JOIN TRANSACCION.PRODUCTO_COMPRA AS PC
		ON PC.IdProducto= P.IdProducto
	GROUP BY P.IDPRODUCTO
-- Se crea la vista 'TRANSACCION.NUMCOMP' para acceder facilmente al n�mero de compras.
CREATE OR ALTER VIEW TRANSACCION.NUMCOMP 
	AS 
		SELECT P.IdProducto AS IdProducto, P.descripci�n AS DESCRIPCION,COUNT(PC.IdProducto) AS NUMCOMPRAS 
			FROM INVENTARIO.PRODUCTO AS P
			INNER JOIN TRANSACCION.PRODUCTO_COMPRA AS PC
				ON PC.IdProducto= P.IdProducto
			GROUP BY P.IDPRODUCTO, P.descripci�n 
-- Se crea el prcedimiento almacenado 'PA_PRODUC_MAS'. 
CREATE OR ALTER PROCEDURE PA_PRODUC_MAS
	AS 
	BEGIN 
		DECLARE 
			@PromP INT;
		SELECT @PromP = MAX(NUMCOMPRAS) 
			FROM TRANSACCION.NUMCOMP
		SELECT * FROM TRANSACCION.NUMCOMP 
			WHERE NUMCOMPRAS >= @PromP
	END
-- Se comprueba el funcionamiento del procedimiento almacenado 'PA_PRODUC_MAS'.
EXECUTE PA_PRODUC_MAS
--------------------------------------------------------------------------------------------------------------------------------------------
-- ESTADISTICA 4
-- Por cual medio se realizan mas ventas
-- Se crea el procedimiento almacenado 'PA_VENTAS'.
CREATE OR ALTER PROCEDURE PA_VENTAS
	AS 
	BEGIN
		DECLARE 
			@Fisico INT, 
			@Internet INT;
		SELECT @Fisico = COUNT(*) 
			FROM TRANSACCION.FISICO;
		SELECT @Internet = COUNT(*) 
			FROM TRANSACCION.INTERNET;
		IF(@Fisico > @Internet)
			PRINT 'SE HAN REALIZADO MAS VENTAS EN FISICO';
		ELSE IF(@Fisico = @Internet)
			PRINT 'SE HAN REALIZADO EL MISMO N�MERO DE VENTAS MEDIANTE INTERNET Y F�SICO';
		ELSE 
			PRINT 'SE HAN REALIZADO MAS VENTAS POR INTERNET'; 
	END
-- Se comprueba el funcionamiento almacenado 'PA_VENTAS'.
EXECUTE PA_VENTAS;
--------------------------------------------------------------------------------------------------------------------------------------------