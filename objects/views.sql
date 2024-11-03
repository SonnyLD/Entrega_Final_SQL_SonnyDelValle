USE choice_in;

-- Crear vistas
CREATE VIEW ReservasActivas AS
SELECT r.reserva_id, c.nombre, c.apellido, p.nombre_paquete, r.fecha_reserva
FROM RESERVA r
JOIN CLIENTE c ON r.cliente_id = c.cliente_id
JOIN PAQUETE_TURISTICO p ON r.paquete_id = p.paquete_id
WHERE r.estado = 'Confirmada';

CREATE VIEW OpinionesPorCliente AS
SELECT o.opinion_id, c.nombre, c.apellido, o.tipo_entidad, o.comentario, o.calificación
FROM OPINION_CALIFICACION o
JOIN CLIENTE c ON o.cliente_id = c.cliente_id;