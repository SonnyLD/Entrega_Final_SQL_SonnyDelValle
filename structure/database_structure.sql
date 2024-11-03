-- Active: 1730606472308@@127.0.0.1@3306@choice_in
DROP DATABASE IF EXISTS choice_in;
CREATE DATABASE choice_in;
USE choice_in;

CREATE TABLE CLIENTE_CATEGORIA(
categoria_id INT NOT NULL AUTO_INCREMENT,
nombre_categoria VARCHAR(100) NOT NULL,
descripción TEXT,
beneficios TEXT,
PRIMARY KEY (categoria_id)
) COMMENT 'INFORMACION DE LA CATEGORIA';

CREATE TABLE CLIENTE(
cliente_id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
apellido VARCHAR(100),
documento_identidad VARCHAR(30), 
email VARCHAR(200),
teléfono VARCHAR(50),
categoría_id INT,
PRIMARY KEY (cliente_id),
FOREIGN KEY (categoría_id) REFERENCES CLIENTE_CATEGORIA(categoria_id)
) COMMENT 'INFORMACION BASICA DEL CLIENTE';

CREATE TABLE PAQUETE_TURISTICO(
paquete_id INT NOT NULL AUTO_INCREMENT,
nombre_paquete VARCHAR(100) NOT NULL,
descripción TEXT,
precio DECIMAL(10, 2),
disponibilidad INT,
PRIMARY KEY (paquete_id)
) COMMENT 'INFORMACION DEL PAQUETE QUE ESTA ADQUIRIENDO';

CREATE TABLE RESERVA(
 reserva_id INT NOT NULL AUTO_INCREMENT,
cliente_id INT,
paquete_id INT,
fecha_reserva DATE,
estado VARCHAR(50),
PRIMARY KEY (reserva_id),
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id),
FOREIGN KEY (paquete_id) REFERENCES PAQUETE_TURISTICO(paquete_id)
) COMMENT 'INFORMACION DE LAS RESERVAS';

CREATE TABLE PAGO(
pago_id INT NOT NULL AUTO_INCREMENT,
reserva_id INT,
método_pago VARCHAR(50),
monto DECIMAL(10, 2),
fecha_pago DATE DEFAULT (CURRENT_DATE),
estatus VARCHAR(50),
PRIMARY KEY (pago_id),
FOREIGN KEY (reserva_id) REFERENCES RESERVA(reserva_id)
) COMMENT 'INFORMACION DEL DETALLE DE LOS PAGOS';

CREATE TABLE PROVEEDOR(
proveedor_id INT NOT NULL AUTO_INCREMENT,
nombre_proveedor VARCHAR(100) NOT NULL,
tipo_servicio VARCHAR(50),
contacto VARCHAR(100),
PRIMARY KEY (proveedor_id)
) COMMENT 'INFORMACION DEL PROVEEDOR DE LOS VUELOS, ALOJAMIENTO Y DE LAS ACTIVIDADES';

CREATE TABLE VUELO(
vuelo_id INT NOT NULL AUTO_INCREMENT,
proveedor_id INT,
aerolínea VARCHAR(100),
origen VARCHAR(100),
destino VARCHAR(100),
fecha DATE,
hora TIME,
precio DECIMAL(10, 2),
disponibilidad INT,
PRIMARY KEY (vuelo_id),
FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id)
) COMMENT 'INFORMACION DEL DETALLE DEL VUELO';

CREATE TABLE ALOJAMIENTO(
alojamiento_id INT NOT NULL AUTO_INCREMENT,
proveedor_id INT,
hotel VARCHAR(100),
tipo_habitación VARCHAR(50),
precio DECIMAL(10, 2),
disponibilidad INT,
PRIMARY KEY (alojamiento_id),
FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id)
) COMMENT 'INFORMACION DEL ALOJAMIENTO';

CREATE TABLE ACTIVIDAD(
actividad_id INT NOT NULL AUTO_INCREMENT,
proveedor_id INT,
nombre_actividad VARCHAR(100),
descripción TEXT,
precio DECIMAL(10, 2),
disponibilidad INT,
PRIMARY KEY (actividad_id),
FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id)
) COMMENT 'INFORMACION DE LAS ACTIVIDADES A REALIZAR';

CREATE TABLE OPINION_CALIFICACION(
opinion_id INT NOT NULL AUTO_INCREMENT,
cliente_id INT,
entidad_id INT,
tipo_entidad ENUM('VUELO', 'ALOJAMIENTO', 'ACTIVIDAD'),
comentario TEXT,
calificación INT,
PRIMARY KEY (opinion_id),
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id),
-- No direct FK for entidad_id due to multiple possible table references
CHECK (tipo_entidad IN ('VUELO', 'ALOJAMIENTO', 'ACTIVIDAD'))
) COMMENT 'INFORMACION DE LA CALIFICACION Y OPINIONES DEL SERVICIO';

-- Crear tablas intermedias para gestionar las relaciones entre paquetes turísticos, vuelos, alojamientos y actividades

-- Paquete-Turístico y Vuelos
CREATE TABLE PAQUETE_VUELO(
    paquete_id INT,
    vuelo_id INT,
    PRIMARY KEY (paquete_id, vuelo_id),
    FOREIGN KEY (paquete_id) REFERENCES PAQUETE_TURISTICO(paquete_id),
    FOREIGN KEY (vuelo_id) REFERENCES VUELO(vuelo_id)
) COMMENT 'RELACION ENTRE PAQUETE TURISTICO Y VUELOS';

-- Paquete-Turístico y Alojamientos
CREATE TABLE PAQUETE_ALOJAMIENTO(
    paquete_id INT,
    alojamiento_id INT,
    PRIMARY KEY (paquete_id, alojamiento_id),
    FOREIGN KEY (paquete_id) REFERENCES PAQUETE_TURISTICO(paquete_id),
    FOREIGN KEY (alojamiento_id) REFERENCES ALOJAMIENTO(alojamiento_id)
) COMMENT 'RELACION ENTRE PAQUETE TURISTICO Y ALOJAMIENTOS';

-- Paquete-Turístico y Actividades
CREATE TABLE PAQUETE_ACTIVIDAD(
    paquete_id INT,
    actividad_id INT,
    PRIMARY KEY (paquete_id, actividad_id),
    FOREIGN KEY (paquete_id) REFERENCES PAQUETE_TURISTICO(paquete_id),
    FOREIGN KEY (actividad_id) REFERENCES ACTIVIDAD(actividad_id)
) COMMENT 'RELACION ENTRE PAQUETE TURISTICO Y ACTIVIDADES';

-- ALTER

-- Agregar clave foránea a la tabla CLIENTE para referenciar CLIENTE_CATEGORIA
ALTER TABLE CLIENTE 
ADD CONSTRAINT FK_CLIENTE_CATEGORIA
FOREIGN KEY (categoría_id) REFERENCES CLIENTE_CATEGORIA(categoria_id);

-- Agregar clave foránea a la tabla PAGO para referenciar RESERVA
ALTER TABLE PAGO 
ADD CONSTRAINT FK_PAGO_RESERVA
FOREIGN KEY (reserva_id) REFERENCES RESERVA(reserva_id);

-- Agregar claves foráneas a la tabla RESERVA para referenciar CLIENTE y PAQUETE_TURISTICO
ALTER TABLE RESERVA 
ADD CONSTRAINT FK_RESERVA_CLIENTE
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id),
ADD CONSTRAINT FK_RESERVA_PAQUETE
FOREIGN KEY (paquete_id) REFERENCES PAQUETE_TURISTICO(paquete_id);

-- Agregar clave foránea a la tabla VUELO para referenciar PROVEEDOR
ALTER TABLE VUELO 
ADD CONSTRAINT FK_VUELO_PROVEEDOR
FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id);

-- Agregar clave foránea a la tabla ALOJAMIENTO para referenciar PROVEEDOR
ALTER TABLE ALOJAMIENTO 
ADD CONSTRAINT FK_ALOJAMIENTO_PROVEEDOR
FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id);

-- Agregar clave foránea a la tabla ACTIVIDAD para referenciar PROVEEDOR
ALTER TABLE ACTIVIDAD 
ADD CONSTRAINT FK_ACTIVIDAD_PROVEEDOR
FOREIGN KEY (proveedor_id) REFERENCES PROVEEDOR(proveedor_id);

-- Agregar clave foránea a la tabla OPINION_CALIFICACION para referenciar CLIENTE
ALTER TABLE OPINION_CALIFICACION 
ADD CONSTRAINT FK_OPINION_CALIFICACION_CLIENTE
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id);