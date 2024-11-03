USE choice_in;

-- Función para obtener el total de pagos por reserva
DELIMITER //
CREATE FUNCTION TotalPagosPorReserva(reservaId INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(monto) INTO total 
    FROM PAGO 
    WHERE reserva_id = reservaId;
    RETURN IFNULL(total, 0);
END //
DELIMITER ;

-- Funcion para la calificacion promedio del cliente
DELIMITER //
CREATE FUNCTION CalificacionPromedioCliente(clienteId INT) 
RETURNS DECIMAL(3, 2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(3, 2);
    SELECT AVG(calificación) INTO promedio 
    FROM OPINION_CALIFICACION 
    WHERE cliente_id = clienteId;
    RETURN IFNULL(promedio, 0);
END //
DELIMITER ;