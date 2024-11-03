USE choice_in;

-- Inserción de datos en las tablas
-- Datos de CLIENTE_CATEGORIA
INSERT INTO CLIENTE_CATEGORIA (categoria_id, nombre_categoria, descripción, beneficios) VALUES
(1, 'Premium', 'Clientes premium con acceso a descuentos exclusivos.', 'Descuentos en vuelos y hoteles, acceso a actividades VIP.'),
(2, 'Estandar', 'Clientes estándar con beneficios básicos.', 'Acceso a ofertas estándar, servicios personalizados.'),
(3, 'Básico', 'Clientes con beneficios mínimos.', 'Acceso limitado a ofertas y servicios.');

-- Datos de CLIENTE(HAY UN ARCHIVO .CSV)
-- LOAD DATA LOCAL INFILE 'C:\\Users\\SONNY\\Desktop\\Curso de SQL\\primera_pre_entrega\\CLIENTE.csv'
-- INTO TABLE CLIENTE
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (cliente_id, nombre, apellido, documento_identidad, email, telefono, categoria_id);

-- Datos de CLIENTE
INSERT INTO CLIENTE (cliente_id, nombre, apellido, documento_identidad, email, teléfono, categoría_id) VALUES
(1, 'Benji', 'Robertshaw', 'Genderqueer', 'brobertshaw0@odnoklassniki.ru', '560-647-3621', 1),
(2, 'Erda', 'Cuxon', 'Female', 'ecuxon1@boston.com', '523-688-4175', 2),
(3, 'Terrance', 'Lissandrini', 'Male', 'tlissandrini3@yale.edu', '399-744-5095', 1);

-- Datos de PROVEEDOR
INSERT INTO PROVEEDOR (nombre_proveedor, tipo_servicio, contacto)
VALUES 
('Airways', 'Vuelo', 'contacto@airways.com'),
('Hotel Lux', 'Alojamiento', 'contacto@hotellux.com'),
('Tour Adventures', 'Actividad', 'contacto@touradventures.com');

-- Datos de PAQUETE_TURISTICO
INSERT INTO PAQUETE_TURISTICO (paquete_id, nombre_paquete, descripción, precio, disponibilidad)
VALUES 
(1, 'Paquete Aventura', 'Incluye actividades de aventura', 1500.00, 10),
(2, 'Paquete Relax', 'Incluye actividades de relajación', 1200.00, 8);

-- Datos de VUELO
INSERT INTO VUELO (proveedor_id, aerolínea, origen, destino, fecha, hora, precio, disponibilidad)
VALUES 
(1, 'Airways', 'Lima', 'Cusco', '2024-10-10', '08:00:00', 500.00, 50);

-- Datos de ALOJAMIENTO
INSERT INTO ALOJAMIENTO (proveedor_id, hotel, tipo_habitación, precio, disponibilidad)
VALUES 
(2, 'Hotel Lux', 'Suite', 300.00, 5);

-- Datos de ACTIVIDAD
INSERT INTO ACTIVIDAD (proveedor_id, nombre_actividad, descripción, precio, disponibilidad)
VALUES 
(3, 'Tour Machu Picchu', 'Visita guiada a Machu Picchu', 200.00, 30);

-- Datos de RESERVA
INSERT INTO RESERVA (cliente_id, paquete_id, fecha_reserva, estado) VALUES
(1, 1, '2024-09-15', 'Confirmada'),
(2, 2, '2024-09-18', 'Pendiente');

-- Datos de PAGO
INSERT INTO PAGO (reserva_id, método_pago, monto, estatus) VALUES
(1, 'Tarjeta de crédito', 1500.00, 'Completado'),
(2, 'Transferencia bancaria', 1200.00, 'Pendiente');

-- Datos de OPINION_CALIFICACION
INSERT INTO OPINION_CALIFICACION (cliente_id, entidad_id, tipo_entidad, comentario, calificación) VALUES
(1, 1, 'VUELO', 'Muy buen servicio, cómodo y puntual.', 5),
(2, 2, 'ALOJAMIENTO', 'Habitación cómoda, pero el servicio al cliente puede mejorar.', 3);