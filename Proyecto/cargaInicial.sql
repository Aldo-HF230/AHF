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
-- Script: CargaInicial.sql
-- Descripción: Este script realizar una insercciones en la base de datos para tener registros con los cuales trabajar a la hora de hacer
--				las pruebas pertinentes de funcionalidad

-- Fecha de creación: Mayo 21, 2020.
-- Última actualización: Mayo 31, 2020.
-- Versión: 1.5
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se implementa la base de datos 'Tienda'.
USE Tienda
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se introducen datos en la tabla PERSONA.USUARIO
INSERT INTO PERSONA.USUARIO (NombreUsuario, Contraseña, CURP, Sexo, Nombre, Paterno, Materno, TipoPersona)
	VALUES  ('JEF_mx', '123jef_mx', 'FOGT350908HDFNNS05', 'H', 'Jesús', 'Falcón', 'Gomez', 'C'),
			('AHF123', '123ahf', 'HAGT350308HDFNNS04', 'H', 'Aldo', 'Herrera', 'Falcón', 'C'),
			('tacosuper', '123supertaco', 'TOTG420906HDFNNS07', 'H', 'Hernan', 'Zepeda', 'Medina', 'C'),
			('Mar123', '123mar123', 'AMGL330968HDFNNS00', 'M', 'Marissa Alexanda', 'Alcala', 'Granados', 'C'),
			('JEF', '123jef007', 'FOGA350607HDFNNS02', 'H', 'Jesús Eduardo', 'Flores', 'González', 'G'),
			('AHF', '123ahf', 'HOGA335091HDFNNS04', 'H', 'Aldo', 'Hernandez', 'Fontes', 'V'),
			('LMSL', '123lmsl', 'LOG3750918HDFNNS00', 'M', 'Lesly Mayte', 'Sandoval', 'Lara', 'G'),
			('HAFG', '123hafg', 'HOLA350918HDFNNS04', 'H', 'Hugo', 'Fernandez', 'Gutierrez', 'V'),
			('cob204','cob123','COLB350924HDFNNS01','M', 'Carolina','Belarde','Lopez', 'V'),
			('Paradox','par123dox','PMLA354118HDFNXS00', 'M', 'Patricia', 'Alcala', 'Luna', 'C'),
			('TSM_MR', 'MR123', 'HMLA30318HDFNNS12', 'H', 'Mario','Miranda', null, 'C'),
			('LOUD', 'Caballo123', 'LOUA230918HDFNNS14', 'M', 'Laura', 'Martinez', 'Zepeda', 'C'),
			('Atta_42', 'Atta_1989', 'AOLA330312HDFNNS94', 'H', 'Arturo', 'Jimenez', null, 'V'),
			('AnaLove', 'Ana123', 'ASLA530812HDFNNS04', 'M', 'Ana Maria', 'Luna', 'López', 'C'),
			('DarkSidius', 'SS123mx','ASLT789312HDFNNS99', 'H', 'Marco', 'Zaragosa', 'Silva', 'C'),
			('AleCAT','prometeo123', 'GOTA330312HDFNNS93', 'M', 'Alejandra', 'Gomez', 'Pliego', 'C'),
			('Calvo', 'Calvillo123', 'COTE330312HDFNNS90', 'H', 'Carlos', 'Calvillo', 'Guzman', 'G'),
			('Artrix', 'artCR7', 'YATA330312HDFNNS03', 'H', 'Yael', 'Marques', null, 'G'),
			('SaltosDoy','sdsd2442', 'SOTE370682HDFNXS90', 'M', 'Alma', 'Guevara', 'Guzman', 'G'),
			('FF90', 'cart9838HDL', 'SILO333239HDFNNS20', 'H', 'Fernando', 'Falcon', 'Franco', 'G'),
			('Carlitos99', 'cart293mx', 'COTE330312HDFNNS00', 'H', 'Carlos', 'Andrade', 'Torres', 'G'),
			('Arant', 'arantza99', 'AOTA330312HDFNNS28', 'M', 'Arantza', 'Andrade', 'Luna', 'G'),
			('MrC','Lilili99', 'LOTA330312HDFNNS93', 'H', 'Luis', 'Andreade', 'Guerra', 'G'),
			('AlvRk','rk123', 'AOLA330312HDFNNS91', 'H', 'Alvar', 'Jimenez', 'Cruz', 'G'),
			('Cars', 'c13323','LOTA330312HDFNNS90', 'M', 'Luisa', 'Santander', 'Castro', 'V')

-- Se verifican las insercciones de 10 clientes
SELECT * FROM PERSONA.USUARIO
	WHERE TipoPersona = 'C'
	ORDER BY TipoPersona
--Se verifican las insercciones 10 gestores
SELECT * FROM PERSONA.USUARIO
	WHERE TipoPersona = 'G'
	ORDER BY TipoPersona
--Se verifican los insercciones de 5 vendedores
SELECT * FROM PERSONA.USUARIO
	WHERE TipoPersona = 'V'
	ORDER BY TipoPersona
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se introducen datos en la tabla PERSONA.GESTOR
INSERT INTO PERSONA.GESTOR (NombreUsuario, IdGestor, Escolaridad, FechaIncio, FechaFin)
	VALUES  ('LMSL', 1, 'Preparatoria', '2009-04-23', null),
			('JEF', 2, 'Preparatoria', '2020-05-30', '2020-12-31'),
			('AlvRk', 3, 'Licenciatura', '2019-05-06', null),
			('Arant', 4, 'Secundaria', '2017-05-03', null),
			('Calvo', 5, 'Preparatoria', '2020-09-02', '2021-12-15'),
			('Carlitos99', 6, 'Secundaria', '2020-05-03', '2020-12-31'),
			('FF90', 7, 'Licenciatura', '2019-03-12', null),
			('MrC', 8, 'Secundaria', '2013-02-19', null),
			('SaltosDoy',9, 'Secundaria', '2010-02-20', null),
			('Artrix', 10, 'Secundaria', '2010-04-21', null)
-- Se verifican las insercciones con una consulta simple
SELECT * FROM PERSONA.GESTOR
	ORDER BY IdGestor
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se introducen datos en la tabla PERSONA.GESTOR
INSERT INTO PERSONA.VENDEDOR(NombreUsuario, IdVendedor, Sueldo)
	VALUES ('AHF', 1, 6000),
		   ('Atta_42', 2, 7000),
		   ('cob204', 3, 5200),
		   ('HAFG', 4, 5300),
		   ('Atta_42', 5, 7000)
-- Se verifican las insercciones con una consulta simple
SELECT *FROM PERSONA.VENDEDOR
	ORDER BY IdVendedor
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se introducen datos en la tabla PERSONA.CLIENTE
INSERT INTO PERSONA.CLIENTE (NombreUsuario, IdCliente, FechaCumpleanos, Correo, Suscripcion)
	VALUES ('AHF123', 1, '1999-05-23', 'ahf@gmail.com', 'S'),
		   ('JEF_mx', 2, '1999-05-03', 'jef@gmail.com', 'N'),
		   ('LOUD', 3, '1990-05-24', 'loud.gatos@gmail.com', 'N'),
		   ('MAR123', 4, '1980-03-04', 'elmo.wou@yahoo.com.mx', 'N'),
		   ('Paradox', 5, '1996-03-04', 'sonic_paradox@gmail.com', 'S'),
		   ('tacosuper', 6, '1978-04-21', 'taqueroMX@hotmail.com', 'S'),
		   ('TSM_MR', 7, '1989-12-30', 'marioTSM@hotmail.com', 'S'),
		   ('AleCAT', 8, '1989-03-24', 'catlove@gmail.com', 'S'),
		   ('AnaLove', 9, '1990-02-14', 'loveana1990@gmail.com', 'S'),
		   ('DarkSidius', 10, '1999-03-04', 'darkSidius@gmail.com', 'S')
-- Se verifican las insercciones con una consulta simple
SELECT * FROM PERSONA.CLIENTE
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se introducen datos en la tabla TEL.CLIENTE
INSERT INTO PERSONA.TEL_CLIENTE (NombreUsuario, Telefono)
	VALUES ('AHF', 5526510329),
		   ('AHF123', 5122011329),
		   ('AleCAT', 3423201038),
		   ('AleCAT', 3930193913),
		   ('AlvRk', 2320103948),
		   ('AlvRk', 2329861083),
		   ('AnaLove', 52938129811),
		   ('Arant', 2338109201),
		   ('Arant', 3490194769),
		   ('Artrix', 2912960194),
		   ('Atta_42', 523985001),
		   ('Calvo', 2319571046),
		   ('Carlitos99', 5639201683),
		   ('Cars', 2739502968),
		   ('cob204', 9271937490),
		   ('DarkSidius', 0271538592),
		   ('FF90', 1927495019),
		   ('HAFG', 5573829840),
		   ('JEF', 2810482658),
		   ('JEF_mx', 2619472920),
		   ('JEF_mx', 5588992290),
		   ('LMSL', 5588112231),
		   ('LMSL', 1194920034),
		   ('LOUD', 3487342332),
		   ('Mar123', 232312948),
		   ('MrC', 2343217597),
		   ('MrC',5528102012),
		   ('Paradox', 5421929483),
		   ('Paradox', 2234234231),
		   ('Paradox', 3492937463),
		   ('SaltosDoy', 4623492933),
		   ('tacosuper', 3432388575),
		   ('tacosuper', 5539374040),
		   ('tacosuper', 4838347200),
		   ('tacosuper', 4332393982),
		   ('TSM_MR', 3848293060)
-- Se verifican las insercciones con una consulta simple
SELECT * FROM PERSONA.TEL_CLIENTE
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se introducen datos en la tabla PERSONA.CLIENTE
INSERT INTO PERSONA.DOMICILIO_CLIENTE (NombreUsuario, Estado, Calle, Colonia, Alcaldia, CodPostal, NumExt, NumInt, DomicilioPrincipal)
	VALUES ('AHF', 'CDMX','Odontologia', 'Copilco','Coyoacan', 01134, 345, 23, 'S'),
		   ('AHF', 'CDMX','Av. Chapultepec', 'San Miguel Chapultepec', 'Miguel Hidalgo', 01230, 200, null, 'N'),
		   ('AHF123', 'CDMX', 'Av. Universidad', 'Napoles Sur', 'Benito Juarez', 12030, 2303, 345, 'S'),
		   ('AleCAT', 'CDMX', 'Av. Nuevoleon', 'Condesa', 'Cuauhtémoc', 12300, 12, 23, 'S'),
		   ('AlvRk', 'Tamaulipas', 'Norte', 'Caudillos Patria', 'Reynosa', 88201, 232,2, 'S'),
		   ('AnaLove', 'Puebla', 'Benito Juarez', 'Celebres', 'Cholula', 23930, 73, 8, 'S'),
		   ('Arant', 'CDMX', 'Pabellon Sur', 'Pabellones', 'Miguel Hidalgo', 29310, 48, null, 'S'),
		   ('Artrix', 'Baja California Norte', 'Mirador 98', 'Miradores', 'Tijuana', 12311, 23, null, 'S'),
		   ('Atta_42', 'CDMX', 'Calle 7', 'San Pedro', 'Álvaro Obregon', 23163, 230, null, 'S'),
		   ('Calvo', 'Baja California Sur', 'Santo Domingos', 'Deidades', 'La Paz', 08009, 43, null, 'S'),
		   ('Carlitos99', 'Tlaxcala', 'Trigre de Vengala', 'Animalia', 'Tlaxcala', 90000 ,234, 3, 'S'),
		   ('Cars', 'CDMX', 'Presidente Masarik', 'Polanco', 'Miguel Hidalgo', 23220, 3, null, 'S'),
		   ('cob204', 'CDMX', 'Aldea Norte', 'Acuedutos', 'Venustiano Carranza', 23203, 230, null, 'S'),
		   ('DarkSidius', 'Estado de México', 'Paris', 'Paises', 'Naucalpal', 89890, 235, null, 'S'),
		   ('FF90', 'Guerrero', 'Sur 123', 'Playa Azul', 'Acapulco', 12121 ,443, null, 'S'),
		   ('HAFG', 'Estado de México', 'Miguel de Savedra', 'Jardines de Savedra', 'Naucalpal', 03123, 34, 234, 'S'),
		   ('JEF', 'CDMX', 'Artificios', 'Acueduto', 'Álvaro Obregon', 01120,14, null, 'S'),
		   ('JEF_mx', 'Veracruz', 'Chamizal', 'Zona Petrolera', 'Tuxpan', 01200, 345, null , 'S'),
		   ('LMSL', 'CDMX','La bolsa', 'Santo Thomas', 'Álvaro Obregon', 23829, 232, null, 'S'),
		   ('LOUD', 'Veracruz', 'Santa Elena', 'Santos', 'Naranjos', 02020, 23, null, 'S'),
		   ('Mar123', 'CDMX', 'Poniente 23', 'America', 'Miguel Hidalgo', 02301, 232, 2, 'S'),
		   ('MrC', 'CDMX', 'Tamaulipas', 'Condesa', 'Miguel Hidalgo', 02320, 321, 221, 'S'),
		   ('Paradox', 'CDMX', 'Alfonso Reyes', 'Condesa', 'Miguel Hidalgo', 23210, 2322,null, 'S'),
		   ('SaltosDoy', 'Chiapas', 'Almas', 'Deidades','Tuxtla Gutierrez', 90392, 232, null, 'S'),
		   ('tacosuper', 'Durango', 'Salma', 'Campos', 'Durango', 23280, 21, null, 'S'),
		   ('TSM_MR', 'Nayarit', 'Azul del Mar' ,'Colores', 'Compostela', 23901, 34, 2,  'S')
-- Se verifican las insercciones con una consulta simple
SELECT *FROM PERSONA.DOMICILIO_CLIENTE
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan las categorias principales en la tabla INVENTARIO.CATEGORIA
INSERT INTO INVENTARIO.CATEGORIA (NivelCategoria, Nombre)
	VALUES (1,'Electronica'),
		   (1,'Mascotas'),
		   (1,'Bebidas'),
		   (1,'Ropa'),
		   (1,'Alimentos')
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan las categorias secundarias (SUBCATEGORIAS) en la tabla INVENTARIO.CATEGORIA
INSERT INTO INVENTARIO.CATEGORIA (NivelCategoria, Nombre, CatSup)
	VALUES (2, 'Televisiones', 1),
		   (2, 'Videojuegos', 1),
		   (2, 'Gatos', 2),
		   (2, 'Perros', 2),
		   (2, 'Alcholicas', 2),
		   (3, 'Vinos', 3),
		   (2, 'Refrescos', 3),
		   (2, 'Jugos', 3),
		   (2, 'Dama', 4),
		   (2, 'Caballero', 4),
		   (2, 'Cereales', 5),
		   (2, 'Frutas', 5),
		   (2, 'Verduras', 5),
		   (2, 'Carnes', 5)
-- Se verifican las insercciones con una consulta simple
-- NOTA. cuando una categoria tiene CatSup indica que esa categoria es principal
SELECT *FROM INVENTARIO.CATEGORIA
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 5 productos unicamente para la categoria de Electronica
INSERT INTO INVENTARIO.PRODUCTO (IdProducto, Descripción, DescripciónDetallada, Precio, IdCategoria, Disponible)
	VALUES (1, 'Playstation 4', 'Consola de Videojuegos de Sony', 7500, 7, 20),
	       (2, 'XBOX One', 'Consola de Videojuegos de Microsoft', 4500, 7, 10),
		   (3, 'Nintendo Switch', 'Consola de Videojuegos de Nintendo', 8000, 7, 15),
		   (4, 'TV Samsung', 'Smart TV 59 pulgadas 4K de Samsung', 17000, 6, 30),
		   (5, 'TV Hisense', 'Television de 32 pulgadas fullHD de Hisense', 8000, 6, 10)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 5 productos unicamente para la categoria de Mascotas
INSERT INTO INVENTARIO.PRODUCTO (IdProducto, Descripción, DescripciónDetallada, Precio, IdCategoria, Disponible)
	VALUES (6, 'Collar Azul', 'Collar con cadena de color azul para perro', 100, 9, 10),
	       (7, 'Campeon', 'Alimento para perros razas medianas 15kg', 450, 9, 20),
		   (8, 'Minino Plus', 'Alimento para gatos con proteinas 3.2 kg', 200,8, 5),
		   (9, 'Plato cat', 'Plato de metal para gatos', 100, 8, 10),
		   (10, 'Plato dog', 'Plato de metal para perros', 200, 9, 10)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 5 productos unicamente para la categoria de BEBIDAS
INSERT INTO INVENTARIO.PRODUCTO (IdProducto, Descripción, DescripciónDetallada, Precio, IdCategoria, Disponible)
	VALUES (11, 'Fraixenet', 'Vino tinto de Queretaro', 250, 11, 50),
	       (12, 'Riunite', 'Vino tinto Lambrusco', 179, 11, 50),
		   (13, 'Riunite Rosa', 'Vino Rosado', 133, 11, 50),
		   (14, 'Sprite', 'Refresco de 3L', 30, 12, 100),
		   (15, 'Fanta', 'Refresco de 3L', 30, 12, 100)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 5 productos unicamente para la categoria de ROPA
INSERT INTO INVENTARIO.PRODUCTO (IdProducto, Descripción, DescripciónDetallada, Precio, IdCategoria, Disponible)
	VALUES (16, 'Camisa B', 'Camisa Blanca', 250, 15, 20),
	       (17, 'Pantalo N', 'Pantalon de vestir negro', 300, 15, 20),
		   (18, 'Pantalon NF', 'Pantalon de vestir negro dama', 400, 14, 40),
		   (19, 'Saco', 'Saco de color negro', 1500, 15, 30),
		   (20, 'Saco F', 'Saco de color negro Dama', 1000, 14, 10)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 5 productos unicamente para la categoria de ALIMENTOS
INSERT INTO INVENTARIO.PRODUCTO (IdProducto, Descripción, DescripciónDetallada, Precio, IdCategoria, Disponible)
	VALUES (21, 'Froot Loops', 'Cereal de la marca Kellogs', 40, 16, 50),
	       (22, 'Melon', 'Melon chino por pieza', 30, 17, 50),
		   (23, 'Lechuga', 'Lecguga desinfectada Romana', 30, 18, 30),
		   (24, 'Salmon', 'Carne de pescado Salmon rosa', 150, 19, 15),
		   (25, 'Pollo P', 'Pechugas de Pollo empanizadas', 100, 19, 20)

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se verifican las insercciones con una consulta 
SELECT P.IdProducto, P.Descripción, P.Descripción, P.DescripciónDetallada, P.Precio,P.IdCategoria, C.Nombre  FROM INVENTARIO.PRODUCTO P
INNER JOIN INVENTARIO.CATEGORIA C
ON P.IdCategoria = C.IdCategoria
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan las imagenes de los productos
-- NOTA. Para estos comandos se debe de tener la carpeta de 'FotosProductos' dentro de la siguiente ubicación en memoria 'C:' para que estos comandos
-- funcionen correctamente.
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 1,* FROM Openrowset(Bulk 'C:\FotosProductos\ps4.png', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 2,* FROM Openrowset(Bulk 'C:\FotosProductos\Xbox.webp', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 3,* FROM Openrowset(Bulk 'C:\FotosProductos\nintendo.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 4,* FROM Openrowset(Bulk 'C:\FotosProductos\tvSamsung.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 5,* FROM Openrowset(Bulk 'C:\FotosProductos\tvHisense.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 6,* FROM Openrowset(Bulk 'C:\FotosProductos\CollarP.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 7,* FROM Openrowset(Bulk 'C:\FotosProductos\Campeon.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 8,* FROM Openrowset(Bulk 'C:\FotosProductos\Minino.webp', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 9,* FROM Openrowset(Bulk 'C:\FotosProductos\PlatoCat.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 10,* FROM Openrowset(Bulk 'C:\FotosProductos\PlatoPerrro.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 11,* FROM Openrowset(Bulk 'C:\FotosProductos\Freixenet.webp', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 12,* FROM Openrowset(Bulk 'C:\FotosProductos\Riu.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 13,* FROM Openrowset(Bulk 'C:\FotosProductos\RiuRosa.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 14,* FROM Openrowset(Bulk 'C:\FotosProductos\Sprite.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 15,* FROM Openrowset(Bulk 'C:\FotosProductos\Fanta.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 16,* FROM Openrowset(Bulk 'C:\FotosProductos\CamisaB.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 17,* FROM Openrowset(Bulk 'C:\FotosProductos\PantalonN.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 18,* FROM Openrowset(Bulk 'C:\FotosProductos\PantalonNDama.webp', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 19,* FROM Openrowset(Bulk 'C:\FotosProductos\Saco.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 20,* FROM Openrowset(Bulk 'C:\FotosProductos\SacoD.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 21,* FROM Openrowset(Bulk 'C:\FotosProductos\Froot.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 22,* FROM Openrowset(Bulk 'C:\FotosProductos\Melon.jpeg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 23,* FROM Openrowset(Bulk 'C:\FotosProductos\Lechuga.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 24,* FROM Openrowset(Bulk 'C:\FotosProductos\Salmon.jpg', Single_Blob) as Imagen
INSERT INTO INVENTARIO.IMG_PRODUCTO (IdProducto, Imagen)  
	SELECT 25,* FROM Openrowset(Bulk 'C:\FotosProductos\Pollo.jpg', Single_Blob) as Imagen
-- Se verifica la inserccion de imagenes
SELECT * FROM INVENTARIO.IMG_PRODUCTO
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan las ofestas en INVENTARIO.OFERTA
INSERT INTO INVENTARIO.OFERTA (IdOferta, FechaInicioOferta, FechaFinOferta, DescripcionOferta, DescripcionOfertaDatallada)
	VALUES (1, '2020-05-27', '2020-06-03', '2x1', '2x1 En alimento para mascotas selecionados'),
		   (2, '2020-05-25', '2020-06-10', '12 msi', '12 meses sin intereses pagando con BBVA'),
		   (3, '2020-05-28', '2020-06-15', '3x1', '3x1 En refrescos seleccionados'),
		   (4, '2020-05-28', '2020-06-16', '6 msi', '6 meses sin intereses todas las TVs'),
		   (5, '2020-05-28', '2020-06-14', 'cupones', '1000 pesos en cupones fisicos en compra de vinos')
-- Se verifica que las ofertas se hayan registrado
SELECT * FROM INVENTARIO.OFERTA
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan o mejor dicho se asignan las ofertas con los productos
INSERT INTO INVENTARIO.PRODUCTO_OFERTA (IdOferta, IdProducto)
	VALUES (2, 1),(2,2),(2,3),(5,11),(5,12)
-- Se verifica la asignación de las ofertas
SELECT * FROM INVENTARIO.PRODUCTO_OFERTA
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 10 compras/venta por INTERNET
-- VENTA 1
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('AHF123','I', '2020-05-30')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (1, 'AHF123', 1, 1);
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (1, 'AHF123', 2, 1);
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (1, 'AHF123', 3, 3);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (1, 'AHF123', 'Express');

-- VENTA 2
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('JEF_mx','I', '2020-05-28')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (2, 'JEF_mx', 3, 1);
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (2, 'JEF_mx', 1, 1);
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (2, 'JEF_mx', 23, 3);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (2, 'JEF_mx', 'Estandar');

-- VENTA 3
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('LOUD','I', '2020-05-29')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (3, 'LOUD', 23, 3);
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (3, 'LOUD', 14, 2);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (3, 'LOUD', 'Estandar');

-- VENTA 4
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('LOUD','I', '2020-05-30')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (4, 'LOUD', 3, 1);
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (4, 'LOUD', 5, 2);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (4, 'LOUD', 'Express');

-- VENTA 5
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('MAR123','I', '2020-05-30')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (5, 'MAR123', 3, 1);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (5, 'MAR123', 'Express');

-- VENTA 6
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('Paradox','I', '2020-05-30')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (6, 'Paradox', 24, 1);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (6, 'Paradox', 'Express');

-- VENTA 7
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('Paradox','I', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (7, 'Paradox', 24, 1);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (7, 'Paradox', 'Express');

-- VENTA 8
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('TSM_MR','I', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (8, 'TSM_MR', 25, 1)
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (8, 'TSM_MR', 1, 1);
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (8, 'TSM_MR', 'Estandar');

-- VENTA 9
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('TSM_MR','I', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (9, 'TSM_MR', 14, 1)
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (9, 'TSM_MR', 'Estandar');

-- VENTA 10
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('AleCat','I', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (10, 'AleCat', 9, 3)
INSERT INTO TRANSACCION.INTERNET (IdCompra ,NombreUsuario, ModoDeEnvio)
	VALUES (10, 'AleCat', 'Estandar');
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan 10 compras/ventas por FISICAS
-- VENTA 11
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('AnaLove','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (11, 'AnaLove', 9, 1)
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (11, 'AnaLove', 11, 8)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('AnaLove',11,4)

-- VENTA 12
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('DarkSidius','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (12, 'DarkSidius', 8, 1)
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (12, 'DarkSidius', 21, 5)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('DarkSidius',12,1)

-- VENTA 13
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('TSM_MR','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (13, 'TSM_MR', 5, 1)
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (13, 'TSM_MR', 1, 1)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('TSM_MR',13,1)

-- VENTA 14
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('tacosuper','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (14, 'tacosuper', 4, 1)
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (14, 'tacosuper', 10, 3)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('tacosuper',14,2)

-- VENTA 15
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('MAR123','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (15, 'MAR123', 7, 1)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('MAR123',15,5)

-- VENTA 16
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('MAR123','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (16, 'MAR123', 23, 4)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('MAR123',16,5)

-- VENTA 17
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('LOUD','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (17, 'LOUD', 2, 1)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('LOUD',17,3)

-- VENTA 18
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('AHF123','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (18, 'AHF123', 6, 3)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('AHF123',18,2)

-- VENTA 19
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('DarkSidius','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (19, 'DarkSidius', 12, 3)
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (19, 'DarkSidius', 13, 15)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('DarkSidius',19,3)

-- VENTA 20
INSERT INTO TRANSACCION.COMPRA (NombreUsuario,TipoCompra, FechaCompra)
	VALUES ('AleCAT','F', '2020-05-31')
INSERT INTO TRANSACCION.PRODUCTO_COMPRA (IdCompra, NombreUsuario, IdProducto, cantidad)
	VALUES (20, 'AleCAT', 22, 3)
INSERT INTO TRANSACCION.FISICO(NombreUsuario,IdCompra,IdVendedor)
	VALUES ('AleCAT',20,1)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se obsevan como quedan las tablas despues de meter los registros anteriores
SELECT * FROM TRANSACCION.COMPRA
SELECT * FROM TRANSACCION.PRODUCTO_COMPRA
SELECT * FROM INVENTARIO.PRODUCTO
SELECT * FROM TRANSACCION.INTERNET
SELECT * FROM TRANSACCION.FISICO
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan las listas pendientes de compra
INSERT INTO CATALOGO.LISTA (IdLista, NombreUsuario)
	VALUES (1,'AHF123'),(2,'JEF_mx'),(3,'LOUD'),(4,'AleCAT'),(5,'AnaLove')
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan las cestas con la fecha posible de compra
INSERT INTO CATALOGO.CESTA(IdLista, FechaPosible)
	VALUES  (1,'2020-06-15')
INSERT INTO CATALOGO.CESTA(IdLista, FechaPosible)
	VALUES	(2,'2020-06-14')
INSERT INTO CATALOGO.CESTA(IdLista, FechaPosible)
	VALUES	(3,'2020-06-01')
INSERT INTO CATALOGO.CESTA(IdLista, FechaPosible)
	VALUES	(4,'2020-06-02')
INSERT INTO CATALOGO.CESTA(IdLista, FechaPosible)
	VALUES	(5,'2020-06-05')
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se insertan lso productos a las listas junto con la cantidad deseada
INSERT INTO CATALOGO.LISTA_PRODUCTO(IdLista, IdProducto, CantidadProducto)
	VALUES (1,1,1), 
		   (1,24,3),
		   (2,14,3),
		   (2,11,2),
		   (2,4,1),
		   (3,12,1),
		   (3,11,5),
		   (3,10,4),
		   (4,25,3),
		   (5,19,7)
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se observa el contenido de la lista
SELECT * FROM CATALOGO.LISTA_PRODUCTO
--Se verifican las insercciones anteriores
SELECT * FROM CATALOGO.LISTA
SELECT * FROM CATALOGO.CESTA
-- Se verifica el funcionamiento del trigger y la actualización para las tablas correspondientes
SELECT * FROM TRANSACCION.PRODUCTO_COMPRA;
SELECT * FROM TRANSACCION.COMPRA;
SELECT * FROM PERSONA.VENDEDOR;
--------------------------------------------------------------------------------------------------------------------------------------------------------