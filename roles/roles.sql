
USE choice_in;

-- Crear los roles básicos
CREATE ROLE IF NOT EXISTS db_admin;
CREATE ROLE IF NOT EXISTS db_read_write;
CREATE ROLE IF NOT EXISTS db_read_only;
CREATE ROLE IF NOT EXISTS db_audit;

-- Asignar permisos a cada rol

-- 1. Rol db_admin: Administración total de la base de datos
GRANT ALL PRIVILEGES ON choice_in.* TO db_admin;
GRANT ALL PRIVILEGES ON *.* TO db_admin WITH GRANT OPTION;

-- 2. Rol db_read_write: Permisos para leer y escribir datos, pero sin administración de usuarios
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON choice_in.* TO db_read_write;

-- 3. Rol db_read_only: Permisos solo para lectura de datos
GRANT SELECT ON choice_in.* TO db_read_only;

-- 4. Rol db_audit: Permisos para lectura y auditoría (revisar logs o tablas específicas para auditoría)
GRANT SELECT ON choice_in.* TO db_audit;

-- Aplicar los privilegios
FLUSH PRIVILEGES;