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
-- Script: READ_ME.txt
-- Descripción: Este script es informativo para el usuario que quiera hacer uso de la base de datos
--				
-- Fecha de creación: Mayo 31, 2020.
-- Última actualización: Mayo 31, 2020.
-- Versión: 1.1
--------------------------------------------------------------------------------------------------------------------------------------------------------
INFORMACIÓN

Antes de comenzar con el uso de los scripts para la creación, manipulación y consulta de la base de datos, es muy importante que como usuario tome las
precausiones necesarias así mismo se deben de realizar los siguientes pasos:

1. Verifique que los siguientes archivos se encuentre en la carpeta actual denominada 'Proyecto':
	- Carpeta 'FotosProducto' (con 25 archivos de imágenes cuyo formato es .jpg)
	- cargaInicial.sql
	- crearBase.sql
	- DML.sql
	- informes.sql
	- Proyecto Bases de Datos.docx
	- Proyecto Bases de Datos.pdf
	- READ_ME.txt
	- ValidaTrigger.sql


2. Tras verificar que estos archivos se encuentren, proceda a realizar una copia de la carpeta 'FotosProducto' en la dirección en memoria 'C:'. de tal
   manera que la dirección de consulta de los imágenes quede con el siguiente formato 'C:\FotosProductos\'.
   Este paso es indispensable para tener un uso correcto de la base de datos a implementar.

3. Tras realizar el paso 2, verifique que cuente y tenga disponibles los siguientes software para el manejo de bases de datos:
	- SQL Server (versiones iguales o posteriores a 2014)
	- SQL Server Management Studio
   En caso de no contar con este tipo de herramientas, verifique si tiene disponible un Sistema de Gestión de Bases de Datos correspondiente a SQL server.

4. Haga la apertura de los 5 archivos con extensión .sql, realice la conexión con su servidor de preferencia y, posteriormente, realice los siguientes pasos:
	4.1. Colóquese en el archivo crearBase.sql, realice la creación de la base de datos nombrada Tienda, haga uso de dicha base, cree los esquemas y, finalmente, cree
	     las tablas correspondientes.
	4.2. Colóquese en el archivo DML.sql, haga uso de la base de datos 'Tienda', proceda a realizar la creación de vistas, procedimientos almacenados, funciones
	     y disparadores.
	4.3. Colóquese en el archivo cargaInicial.sql, haga uso de la base de datos 'Tienda', proceda a realizar la carga incial de la base de datos que contiene 
	     información que corresponde a cada una de las tablas creadas en el archivo crearBase.sql.
	4.4. Colóquese en el archivo validarTrigger.sql, haga uso de la base de datos 'Tienda', proceda a hacer la validación del funcionamiento adecaduado de cada uno de
	     los disparadores a implementar en la base de datos.
	4.5. Colóquese en el archivo informes.sql, haga uso de la base de datos 'Tienda', proceda a realizar la creación de las vistas así como de los procedimientos 
	     almacenados para posteriormente relizar la prueba de los mismos. Estos informes contienen el mejor vendedor, las epocas donde mayor número de ventas hay,
	     que medio de venta se utiliza más (internet o físico, entre otros.
	4.6. Colóquese en el archivo Seguridad.sql, haga uso de la base de datos 'Tienda', proceda a realizar la creación de usuarios así como la asignación de roles
	     y privilegios dentre de la base de datos.


	Una vez que se realicen estos pasos, se tiene una Base de Datos para administrar una tienda que tenga ventas en línea y en físico, se puede manipular así como 
agregar la información correspondiente y necesaria para tener un sistema eficiente y eficaz de administración.

	En caso de tener duda con las variables definidas e implementadas dentro de los diferentes scripts así como la estructura de los modelos (entidad-relación y 
lógicos) de los cuales parte esta base de datos, puede consultar esta información en el archivo 'Proyecto Bases de datos.docx' o 'Proyecto Bases de Datos.pdf'.