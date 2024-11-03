USE choice_in;

-- Creación de triggers (ejemplo)
DELIMITER $$
CREATE TRIGGER before_insert_reserva
BEFORE INSERT ON RESERVA
FOR EACH ROW
BEGIN
    IF NEW.fecha_reserva < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de reserva no puede ser en el pasado.';
    END IF;
END $$
DELIMITER ;

-- Trigger para actualizar la disponibilidad del paquete turístico tras una reserva
DELIMITER //
CREATE TRIGGER ActualizarDisponibilidadPaquete
AFTER INSERT ON RESERVA
FOR EACH ROW
BEGIN
    UPDATE PAQUETE_TURISTICO 
    SET disponibilidad = disponibilidad - 1 
    WHERE paquete_id = NEW.paquete_id;
END //
DELIMITER ;