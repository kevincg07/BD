DROP TABLE CUSTOMERS
--crear tablas
DESCRIBE EMPLEADOS
CREATE TABLE CUSTOMERS( -- EF
CUSTOMER_ID NUMBER PRIMARY KEY,
NOMBRE NVARCHAR2(15),
FECHA_NAC DATE,
DOMICILIO NVARCHAR2(40)
);
DESCRIBE DEPARTAMENTO
DESCRIBE PRODUCTOS

CREATE TABLE EMPLEADOS( --EF
EMPLEADO_ID NUMBER PRIMARY KEY,
NOMBRE NVARCHAR2(15),
FECHA_INGRESO DATE,
SALARIO NUMBER(5,2)
);

CREATE TABLE PROVEEDOR( --EF
PROVEEDOR_ID NUMBER PRIMARY KEY,
NOMBRE NVARCHAR2(30),
TELEFONO NVARCHAR2(10),
CORREO NVARCHAR2(20)
);
CREATE SEQUENCE PRODUCTO_SEQ START WITH 24 INCREMENT BY 1;
DROP SEQUENCE PRODUCTO_SEQ
CREATE TABLE PRODUCTOS( -- ED
PRODUCTO_ID NUMBER PRIMARY KEY,
DEPTO_ID NUMBER,
NOMBRE NVARCHAR2(20),
FECHA_CAD DATE,
PRECIO_COMPRA NUMBER(5,2),
PRECIO_VENTA NUMBER(5,2),
REFRIGERADO CHAR(1)
);
COMMIT;
SELECT * FROM PRODUCTOS;
SELECT * FROM INVENTARIO;
CREATE TABLE VENTAS(  -- ED
VENTA_ID NUMBER PRIMARY KEY,
EMPLEADO_ID NUMBER,
CUSTOMER_ID NUMBER,
FECHA_VENTA DATE,
SUBTOTAL NUMBER(5,2),
TOTAL NUMBER(5,2)
);

CREATE TABLE INVENTARIO( --ED
INVENTARIO_ID NUMBER PRIMARY KEY,
PRODUCTO_ID NUMBER,
STOCK NUMBER,
FECHA DATE
);

CREATE TABLE PROD_PROV( --ED
PROD_PROV_ID NUMBER PRIMARY KEY,
PROVEEDOR_ID NUMBER,
PRODUCTO_ID NUMBER
);

CREATE TABLE DET_VENTA( --ED
DET_VENTA_ID NUMBER PRIMARY KEY,
VENTA_ID NUMBER,
PRODUCTO_ID NUMBER,
CANTIDAD NUMBER
);

CREATE TABLE DEPARTAMENTO( --ED
DEPTO_ID NUMBER PRIMARY KEY,
EMPLEADO_ID NUMBER,
NOMBRE NVARCHAR2(20)
);

--crear llaves

ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_CUSTOMER_ID
FOREIGN KEY (CUSTOMER_ID) 
REFERENCES CUSTOMERS(CUSTOMER_ID);


ALTER TABLE VENTAS ADD CONSTRAINT FK_VENTAS_EMPLEADO_ID
FOREIGN KEY (EMPLEADO_ID) 
REFERENCES EMPLEADOS(EMPLEADO_ID);

ALTER TABLE DET_VENTA ADD CONSTRAINT FK_DET_VENTA_VENTA_ID
FOREIGN KEY (VENTA_ID) 
REFERENCES VENTAS(VENTA_ID);

ALTER TABLE  PRODUCTOS  ADD CONSTRAINT FK__PRODUCTOS_DEPTO_ID
FOREIGN KEY (DEPTO_ID) 
REFERENCES DEPARTAMENTO(DEPTO_ID);

ALTER TABLE PROD_PROV ADD CONSTRAINT FK_PROD_PROV_PRODUCTO_ID
FOREIGN KEY (PRODUCTO_ID) 
REFERENCES PRODUCTOS(PRODUCTO_ID);


ALTER TABLE PROD_PROV ADD CONSTRAINT FK_PROD_PROV_PROVEEDOR_ID
FOREIGN KEY (PROVEEDOR_ID) 
REFERENCES PROVEEDOR(PROVEEDOR_ID);


ALTER TABLE INVENTARIO ADD CONSTRAINT FK_INVENTARIO_PRODUCTO_ID
FOREIGN KEY (PRODUCTO_ID) 
REFERENCES PRODUCTOS(PRODUCTO_ID);


ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_DEPARTAMENTO_EMPLEADO_ID
FOREIGN KEY (EMPLEADO_ID) 
REFERENCES EMPLEADOS(EMPLEADO_ID);




ALTER TABLE DET_VENTA ADD CONSTRAINT FK_DET_VENTA_PRODUCTO_ID
FOREIGN KEY (PRODUCTO_ID) 
REFERENCES PRODUCTOS(PRODUCTO_ID);


--creacion de las secuencias

CREATE SEQUENCE SQ_EMPLEADO_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_CUSTUMER_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_VENTA_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_INVENTARIO_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_DET_VENTA_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_PRODUCTO_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_PROVEEDOR_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_DEPTO_ID STart with 1 INCREMENT BY 1;

CREATE SEQUENCE SQ_PROD_VENTA START WITH 1 INCREMENT BY 1;


-- creacion de los triggers 

CREATE OR REPLACE TRIGGER ON_INSERT_EMPLEADOS_ID BEFORE 
INSERT ON EMPLEADOS FOR EACH ROW BEGIN 
SELECT SQ_EMPLEADO_ID.NEXTVAL INTO :new.EMPLEADO_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_CUSTUMER BEFORE 
INSERT ON CUSTOMERS FOR EACH ROW BEGIN 
SELECT SQ_CUSTUMER_ID.NEXTVAL INTO :new.CUSTOMER_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_VENTAS_ID BEFORE 
INSERT ON VENTAS FOR EACH ROW BEGIN 
SELECT SQ_VENTA_ID.NEXTVAL INTO :new.VENTA_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_INVENTARIO BEFORE 
INSERT ON INVENTARIO FOR EACH ROW BEGIN 
SELECT SQ_INVENTARIO_ID.NEXTVAL INTO :new.INVENTARIO_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_DET_VENTA BEFORE 
INSERT ON DET_VENTA FOR EACH ROW BEGIN 
SELECT SQ_DET_VENTA_ID.NEXTVAL INTO :new.DET_VENTA_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_PRODUCTO BEFORE 
INSERT ON PRODUCTOS FOR EACH ROW BEGIN 
SELECT SQ_PRODUCTO_ID.NEXTVAL INTO :new.PRODUCTO_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_PROVEEDOR BEFORE 
INSERT ON PROVEEDOR FOR EACH ROW BEGIN 
SELECT SQ_PROVEEDOR_ID.NEXTVAL INTO :new.PROVEEDOR_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_DEPTO BEFORE 
INSERT ON DEPARTAMENTO FOR EACH ROW BEGIN 
SELECT SQ_DEPTO_ID.NEXTVAL INTO :new.DEPTO_ID FROM dual;
END;

CREATE OR REPLACE TRIGGER ON_INSERT_PROD_PROV BEFORE 
INSERT ON PROD_PROV FOR EACH ROW BEGIN 
SELECT SQ_PROD_VENTA.NEXTVAL INTO :new.PROD_PROV_ID FROM dual;
END;

-----------------------------------------------------------------
----------------------insercion de los datos --------------------
-----------------------------------------------------------------

DESCRIBE EMPLEADOS;

INSERT ALL
INTO EMPLEADOS(NOMBRE, FECHA_INGRESO, SALARIO)
VALUES ('Elias Campos', '15/02/2022', 150)
INTO EMPLEADOS(NOMBRE, FECHA_INGRESO, SALARIO)
VALUES ('Juan Flores', '30/03/2022', 130)
INTO EMPLEADOS(NOMBRE, FECHA_INGRESO, SALARIO)
VALUES ('Karina Gomez', '15-01-2022', 150)
INTO EMPLEADOS(NOMBRE, FECHA_INGRESO, SALARIO)
VALUES ('Ana Tellez', '15-04-2022', 120)
INTO EMPLEADOS(NOMBRE, FECHA_INGRESO, SALARIO)
VALUES ('Juan Hernandez', '15-01-2022', 190)
INTO EMPLEADOS(NOMBRE, FECHA_INGRESO, SALARIO)
VALUES ('Reyna Lopez', '15-03-2022', 140)
SELECT * FROM DUAL;

DESCRIBE CUSTOMERS;

INSERT ALL
INTO CUSTOMERS (NOMBRE, FECHA_NAC, DOMICILIO)
VALUES('Alan Garcia', '10/01/1990', 'Calle Revolucion Norte #1233')
INTO CUSTOMERS (NOMBRE, FECHA_NAC, DOMICILIO)
VALUES('Alin Juarez','23/09/2000','Calle Independencia Sur #2098')
INTO CUSTOMERS (NOMBRE, FECHA_NAC, DOMICILIO)
VALUES('Julian Flores','13/02/1995','Calle 5 de Mayo #3001')
INTO CUSTOMERS (NOMBRE, FECHA_NAC, DOMICILIO)
VALUES('Lucia Lopez','14/09/2001','Calle 5 de Mato #3011')
INTO CUSTOMERS (NOMBRE, FECHA_NAC, DOMICILIO)
VALUES('Yareli Casas','16/10/1998','Calle 1 de Mayo #2099')
SELECT * FROM DUAL;

SELECT * FROM CUSTOMERS;

DESCRIBE PROVEEDOR;

INSERT ALL
INTO PROVEEDOR(NOMBRE, TELEFONO, CORREO)
VALUES('LALA','12288484','lala@lala.com')
INTO PROVEEDOR(NOMBRE, TELEFONO, CORREO)
VALUES('FOOD','98788484','food@food.com')
INTO PROVEEDOR(NOMBRE, TELEFONO, CORREO)
VALUES('LG','56288484','LG@lg.com')
INTO PROVEEDOR(NOMBRE, TELEFONO, CORREO)
VALUES('SABRITAS','23233484','sa@sabritas.com')
INTO PROVEEDOR(NOMBRE, TELEFONO, CORREO)
VALUES('LA MODERNA','09288484','mod@moderna.com')
SELECT * FROM DUAL;


DESCRIBE DEPARTAMENTO;
INSERT ALL
INTO DEPARTAMENTO(EMPLEADO_ID, NOMBRE)
VALUES (1,'SALCHICHONERIA')
INTO DEPARTAMENTO(EMPLEADO_ID, NOMBRE)
VALUES (2,'SOPAS')
INTO DEPARTAMENTO(EMPLEADO_ID, NOMBRE)
VALUES (3,'LINEA BLANCA')
INTO DEPARTAMENTO(EMPLEADO_ID, NOMBRE)
VALUES (4,'FRITURAS')
INTO DEPARTAMENTO(EMPLEADO_ID, NOMBRE)
VALUES (5,'CREMERIA')
SELECT * FROM DUAL;


DESCRIBE PRODUCTOS;
SELECT * FROM DEPARTAMENTO;


INSERT ALL
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(1, 'SALCHICHA DE PAVO', '24/09/2023', 45, 60, 'S')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(1, 'JAMON DE PAVO', '24/09/2023', 35, 49, 'S')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(1, 'JAMON FOOD', '24/09/2023', 45, 60, 'S')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(2, 'FIDEOS MODERNA', '24/09/2024', 3, 6, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(2, 'PLUMA MODERNA', '24/09/2024', 4, 7, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(2, 'CODOS MODERNA', '24/09/2024', 2, 5, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(3, 'LAVADORA K-21', '24/09/2025', 600, 855, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(3, 'MICROONDAS LG', '24/09/2025', 400, 550, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(3, 'REFRIGERADOR', '24/09/2025', 765, 999, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(4, 'SABRITAS 45G', '24/09/2023', 15, 18, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(4, 'DORITOS 45G', '24/09/2023', 14, 17, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(4, 'FRITOS', '24/09/2023', 13, 16, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(5, 'CREMA LALA 250G', '24/10/2023', 14, 20, 'S')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(5, 'MEDIA CREMA 250G', '24/10/2023', 14, 20, 'S')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(5, 'CREMA LALA 1KG', '24/09/2023', 50, 70, 'S')
SELECT * FROM DUAL;

SELECT * FROM PRODUCTOS;
SELECT * FROM PROVEEDOR;
DESCRIBE PROD_PROV;
INSERT ALL
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(8, 7)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(8, 8)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(8, 9)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(11, 10)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(11, 11)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(11, 12)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(9, 13)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(9, 14)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(9, 15)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(10, 16)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(10, 17)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(10, 18)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(7, 19)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(7, 20)
INTO PROD_PROV(PROVEEDOR_ID,PRODUCTO_ID)VALUES(7, 21)
SELECT * FROM DUAL;

SELECT * FROM INVENTARIO;
DESCRIBE INVENTARIO;
SELECT * FROM PRODUCTOS;
INSERT ALL
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(1, 67, '05/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(2, 34, '06/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(3, 67, '10/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(4, 120, '10/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(5, 89, '10/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(6, 67, '12/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(7, 20, '03/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(8, 34, '05/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(9, 27, '06/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(10, 65, '15/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(11, 90, '15/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(12, 97, '12/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(13, 56, '12/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(14, 76, '09/04/2023')
INTO INVENTARIO(PRODUCTO_ID, STOCK, FECHA) VALUES(15, 45, '11/04/2023')
SELECT * FROM DUAL;

DESCRIBE VENTAS;

INSERT ALL
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(5,1, '24/08/2024', 200, 230)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(4,2, '24/08/2024', 300, 340)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(3,3, '24/08/2024', 250, 280)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(2,4, '24/08/2024', 350, 410)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(1,1, '24/08/2024', 200, 230)
SELECT * FROM DUAL;

COMMIT;

DESCRIBE DET_VENTA;
INSERT ALL
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(1,7,3)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(2,12,1)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(1,9,4)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(5,13,5)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(4,9,8)
SELECT * FROM DUAL;
SELECT * FROM DET_VENTA
--consultas
COMMIT;         --asegurar un estado guarda un cambio
ROLLBACK;       --RECUPERA EL ULTIMO ESTADO CONFIRMADO

UPDATE DEPARTAMENTO SET NOMBRE ='ELECTRONICA', EMPLEADO_ID = 3 WHERE DEPTO_ID = 2; 

SELECT * FROM DEPARTAMENTO;
SELECT * FROM PRODUCTOS;
DESCRIBE PRODUCTOS;
SELECT * FROM PRODUCTOS WHERE PRECIO_COMPRA > 100;
UPDATE PRODUCTOS SET PRECIO_VENTA = 950 WHERE PRECIO_COMPRA > 100;

--consulta con AND

SELECT NOMBRE, PRECIO_COMPRA, FECHA_CAD, DEPTO_ID, REFRIGERADO FROM PRODUCTOS 
WHERE DEPTO_ID = 3 AND REFRIGERADO = 'N';

--consulta con OR
SELECT NOMBRE, PRECIO_COMPRA, FECHA_CAD, DEPTO_ID, REFRIGERADO FROM PRODUCTOS 
WHERE DEPTO_ID = 3 OR REFRIGERADO = 'N';

SELECT NOMBRE, PRECIO_VENTA FROM PRODUCTOS 
WHERE PRECIO_VENTA >= 50 AND PRECIO_VENTA<=300;

--hacer busquedas con rangos TAMBIEN SIRVE PARA FECHAS
SELECT NOMBRE, PRECIO_VENTA FROM PRODUCTOS 
WHERE PRECIO_VENTA  BETWEEN 50  AND 300; 

SELECT * FROM INVENTARIO;
SELECT NOMBRE, PRECIO_VENTA FROM PRODUCTOS  --hacer consultas usando fechas
WHERE FECHA_CAD  BETWEEN 50  AND 300;-- FECHA_CAD BETWEEN '12/01/2000'  AND '30/12/2005';


INSERT ALL
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(5, 'CIGARROS', '12/07/2018', 14, 20, 'N')
INTO PRODUCTOS(DEPTO_ID, NOMBRE, FECHA_CAD, PRECIO_COMPRA,
PRECIO_VENTA, REFRIGERADO)
VALUES(5, 'TECATE LATA', '12/09/2019', 30, 35, 'S')
SELECT * FROM DUAL;

COMMIT;
ROLLBACK;
DELETE FROM PRODUCTOS WHERE PRODUCTO_ID>21;
DELETE FROM PRODUCTOS WHERE NOMBRE = 'CIGARROS' OR NOMBRE = 'TECATE LATA';

SELECT * FROM PRODUCTOS;

--eliminacion en tres niveles, a nivel de fila, a nivel de filas, a nivel de tabla
--DELETE FROM PRODUCTOS; --> a nivel de fila
--TRUNCATE TABLE PRODUCTOS; --> a nivel de filas
--DROP TABLE PRODUCTOS; --> a nivel de tabla
--despues de un TRUNCATE el ROLLBACK ya no funciona

--funciones de agregacion

SELECT * FROM VENTAS;
SELECT SUM(TOTAL) FROM VENTAS WHERE FECHA_VENTA = '24/08/2024';

SELECT COUNT(PROVEEDOR_ID) FROM PRODUCTOS;

--calacular el promedio de los productos no refrigerados

SELECT AVG(PRECIO_VENTA) FROM PRODUCTOS WHERE REFRIGERADO = 'N';

--buscar el producto mas barato
SELECT MIN(PRECIO_VENTA) FROM PRODUCTOS;
SELECT MIN(PRECIO_VENTA) FROM PRODUCTOS WHERE REFRIGERADO = 'S';
--buscar el precio mas alto de los productos refrigerados
SELECT MAX(PRECIO_VENTA) FROM PRODUCTOS WHERE REFRIGERADO = 'S';

--buscar informacion del producto mas barato
SELECT NOMBRE, DEPTO_ID, FECHA_CAD, PRECIO_VENTA FROM PRODUCTOS
WHERE PRECIO_VENTA = (SELECT MIN(PRECIO_VENTA) FROM PRODUCTOS); --una subconsulta

--buscar los prductos donde el precio de venta se mayor al promedio del precio de venta
SELECT * FROM PRODUCTOS
WHERE PRECIO_VENTA > (SELECT AVG(PRECIO_VENTA) FROM PRODUCTOS);

--buscar el departamento donde el producto sea el mas caro de todos los demas
SELECT * FROM DEPARTAMENTO
WHERE DEPTO_ID = (SELECT DEPTO_ID FROM PRODUCTOS
WHERE PRECIO_VENTA =(SELECT MAX(PRECIO_VENTA) FROM PRODUCTOS));

--buscar todos los departamentos en los que sus producto sean mayores a l promedio de venta

SELECT NOMBRE FROM DEPARTAMENTO WHERE DEPTO_ID IN (SELECT DEPTO_ID FROM PRODUCTOS 
WHERE PRECIO_VENTA < (SELECT AVG(PRECIO_VENTA) FROM PRODUCTOS));

--buscar los prodcutos que hayan sido comprados por 
INSERT ALL
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(5,5, '04/08/2018', 300, 360)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(4,5, '14/08/2018', 320, 390)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(3,5, '22/08/2018', 250, 280)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(2,5, '24/08/2022', 350, 410)
INTO VENTAS(EMPLEADO_ID, CUSTOMER_ID, FECHA_VENTA, SUBTOTAL,TOTAL)
VALUES(1,5, '24/08/2023', 200, 230)
SELECT * FROM DUAL;
COMMIT;
SELECT * FROM CUSTOMERS;
INSERT ALL
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(6,7,3)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(7,12,1)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(8,9,4)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(9,5,5)
INTO DET_VENTA(VENTA_ID, PRODUCTO_ID, CANTIDAD)VALUES(10,11,8)
SELECT * FROM DUAL;

SELECT * FROM CUSTOMERS;
SELECT * FROM DET_VENTA;
SELECT * FROM VENTAS;
SELECT * FROM DET_VENTA;

--buscar los prodcutos que hayan sido comprados por un cliente en especifico
SELECT NOMBRE, PRECIO_VENTA FROM PRODUCTOS WHERE PRODUCTO_ID
IN (SELECT PRODUCTO_ID FROM DET_VENTA WHERE VENTA_ID
IN(SELECT VENTA_ID FROM VENTAS WHERE CUSTOMER_ID 
IN(SELECT CUSTOMER_ID FROM CUSTOMERS WHERE NOMBRE = 'Yareli Casas')));

--consultas con joins
--productos p inventrio i

SELECT P.NOMBRE, P.PRECIO_VENTA, I.STOCK  --seleccionar las columnas, se asigna un alias
FROM PRODUCTOS P INNER JOIN INVENTARIO I  --union interna pegar una tabla con otra 
ON P.PRODUCTO_ID = I.PRODUCTO_ID;         --se unen con los datos en comun

--customer C ventas V det_venta DV productos P
--producto nombre y fecha de caducidad, venta fecha venta, detVenta cantidad
--producto
SELECT P.NOMBRE,P.FECHA_CAD, V.FECHA_VENTA, DT.CANTIDAD,C.NOMBRE AS CLIENTE
FROM PRODUCTOS P INNER JOIN DET_VENTA DT
ON P.PRODUCTO_ID = DT.PRODUCTO_ID
INNER JOIN VENTAS V ON V.VENTA_ID = DT.VENTA_ID
INNER JOIN CUSTOMERS C ON V.CUSTOMER_ID = C.CUSTOMER_ID 
WHERE C.NOMBRE = 'Yareli Casas';

SELECT DTO.NOMBRE AS DEPARTAMENTO, P.NOMBRE, P.REFRIGERADO, I.STOCK, P.PRECIO_VENTA * 0.85 AS PRECIO_DESCUENTO
FROM DEPARTAMENTO DTO INNER JOIN PRODUCTOS P
ON DTO.DEPTO_ID = P.DEPTO_ID
INNER JOIN INVENTARIO I
ON I.PRODUCTO_ID = P.PRODUCTO_ID
WHERE DTO.NOMBRE = 'CREMERIA';
DESCRIBE PRODUCTOS;
COMMIT;
SELECT * FROM CUSTOMERS
SELECT * FROM DEPARTAMENTO
SELECT * FROM DET_VENTA
SELECT * FROM EMPLEADOS
SELECT * FROM PROD_PROV
SELECT * FORM PRODUCTOS
SELECT * FROM PROVEEDOR
SELECT * FROM VENTAS
----------------------------------------
--------------AUTOS---------------------
----------------------------------------

---creacion de las tablas---------------
CREATE TABLE AUTOS(AUTO_ID NUMBER PRIMARY KEY,
MODELO NVARCHAR2(25),A�O NUMBER,
PRECIO NUMBER,MARCA_ID NUMBER
);
CREATE TABLE MARCA(
MARCA_ID NUMBER PRIMARY KEY,NOMBRE NVARCHAR2(25),
PAIS NVARCHAR2(25));


--CREAR UNA SECUENCIA
CREATE SEQUENCE AUTOS_SEQ;
---CREAR UN TRIGGER PARA AUTOMATIZAR LA GENERACION DE IDS
CREATE OR REPLACE TRIGGER ON_INSERT_AUTOS BEFORE
INSERT ON AUTOS FOR EACH ROW BEGIN  SELECT AUTOS_SEQ.NEXTVAL INTO :new.AUTO_ID FROM dual;
END;
CREATE SEQUENCE MARCA_SEQ;
-- CREAR UN TRIGGER PARA AUTOMATIZAR LA GENERACION DE IDS
CREATE OR REPLACE TRIGGER ON_INSERT_MARCA BEFORE
INSERT ON MARCA FOR EACH ROW BEGIN  SELECT MARCA_SEQ.NEXTVAL INTO :new.MARCA_ID FROM dual;
END;

--inseratr marcas
INSERT ALL 
INTO MARCA(NOMBRE, PAIS)VALUES('BMW','ALEMANIA')
INTO MARCA(NOMBRE, PAIS)VALUES('MERCEDES BENZ','ALEMANIA')
INTO MARCA(NOMBRE, PAIS)VALUES('FERRARI','ITALIA')
INTO MARCA(NOMBRE, PAIS)VALUES('TOYOTA','JAPON')
INTO MARCA(NOMBRE, PAIS)VALUES('HONDA','JAPON')
INTO MARCA(NOMBRE, PAIS)VALUES('LOTUS','ALEMANIA')
INTO MARCA(NOMBRE, PAIS)VALUES('CHEVROLET','ALEMANIA')
INTO MARCA(NOMBRE, PAIS)VALUES('ALFA ROMEO','ITALIA')
INTO MARCA(NOMBRE, PAIS)VALUES('NISSAN','JAPON')
SELECT * FROM DUAL;

--insert autos
INSERT ALL
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('M5',2009,80000,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('M4',2007,60000,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('M3',1990,60790,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('M2',1996,234000,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('X1',2004,83400,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('X2',2006,845600,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('X3',2010,80460,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('Z4',2023,803630,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLASE E',2002,45234,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLASE T',2006,63453,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLASE S',1995,475674,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLASE S',1999,56756,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLK GTR',1995,334563,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLK GTR',1995,334563,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('F50',2002,785685657,3)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('355',1996,45676567,3)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('FXX',2009,689687678,3)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('MARANELLO',2007,4567867,3)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('ENZO',2005,6785678,3)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('TACOMA',2008,8987,4)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('PRIUS',1997,6786,4)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('SUPRA',1998,678678,4)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('AVANZA',2013,324546,4)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CAMRY',1999,567567,4)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('PASSPORT',2009,90000,5)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('ODDYSEY',2012,7000,5)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CIVIC',1997,59000,5)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('POINTER',2008,90000,1)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('AVEO',2008,7000,2)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('JETTA',2008,59000,3)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CLIO',2008,90000,4)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('SORENTO',2017,200000,5)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('Q7',2008,90000,20)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('R8',2017,200000,20)
INTO AUTOS(MODELO, A�O, PRECIO,MARCA_ID)VALUES('CALLAWAY',2012,40000,20)
SELECT * FROM DUAL;

SELECT * FROM AUTOS;

---buscar valores similares---
--a la izquierda % trae los valores que comiencen, a la derecha los valores que terminen
SELECT * FROM AUTOS WHERE MODELO LIKE 'A%';

--ORDER BY solo los va a mostrar en la tabla virtual, solo los va a mostar no va a modificar
SELECT * FROM AUTOS ORDER BY MODELO; 

--mostrar la tabla con dos criterios para ordenar
SELECT * FROM AUTOS ORDER BY MODELO ASC, A�O DESC;

SELECT MARCA_ID FROM AUTOS GROUP BY MARCA_ID;

SELECT COUNT(A.AUTO_ID), M.NOMBRE FROM AUTOS A INNER JOIN MARCA M
ON A.MARCA_ID = M.MARCA_ID GROUP BY M.NOMBRE; 
--GROUP BY agrupa valores con algun dato en comun de un conjunto de valores

--
SELECT * FROM AUTOS;
SELECT * FROM MARCA;

SELECT * FROM AUTOS A INNER JOIN MARCA M
ON A.MARCA_ID = M.MARCA_ID;

-- LEFT JOIN 
--consulta cargada hacia la izquierda
SELECT * FROM AUTOS A LEFT JOIN  MARCA M
ON A.MARCA_ID = M.MARCA_ID;

-- RIGHT JOIN
SELECT * FROM AUTOS A RIGHT JOIN  MARCA M
ON A.MARCA_ID = M.MARCA_ID;

SELECT * FROM AUTOS A FULL JOIN  MARCA M
ON A.MARCA_ID = M.MARCA_ID;
SELECT * FROM MARCA;
SELECT * FROM AUTOS;

COMMIT