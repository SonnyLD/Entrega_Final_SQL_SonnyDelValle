USE choice_in;

-- -- Crear Stored Procedure 
DELIMITER //
CREATE PROCEDURE CrearReserva(
    IN clienteId INT, 
    IN paqueteId INT,
    IN fechaReserva DATE)
BEGIN
    INSERT INTO RESERVA (cliente_id, paquete_id, fecha_reserva, estado) 
    VALUES (clienteId, paqueteId, fechaReserva, 'Pendiente');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarEstadoReserva(
    IN reservaId INT,
    IN nuevoEstado VARCHAR(50))
BEGIN
    UPDATE RESERVA 
    SET estado = nuevoEstado 
    WHERE reserva_id = reservaId;
END //
DELIMITER ;

-- Stored Procedure para procesar un pago
DELIMITER //
CREATE PROCEDURE ProcesarPago(
    IN p_reserva_id INT,
    IN p_metodo_pago VARCHAR(50),
    IN p_monto DECIMAL(10, 2)
)
BEGIN
    INSERT INTO PAGO(reserva_id, metodo_pago, monto, estatus)
    VALUES (p_reserva_id, p_metodo_pago, p_monto, 'Completado');
END //
DELIMITER ;