
USE TallerDB;

-- Elimina las restricciones de claves foráneas primero
DECLARE @sql NVARCHAR(MAX) = N'';
SELECT @sql += 'ALTER TABLE ' + QUOTENAME(TABLE_NAME) + ' DROP CONSTRAINT ' + QUOTENAME(CONSTRAINT_NAME) + ';'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY';

EXEC sp_executesql @sql;

-- Elimina todas las tablas
DECLARE @table NVARCHAR(MAX) = N'';
SELECT @table += 'DROP TABLE ' + QUOTENAME(TABLE_NAME) + ';'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

EXEC sp_executesql @table;

-- Elimina los tipos definidos por el usuario
DECLARE @type NVARCHAR(MAX) = N'';
SELECT @type += 'DROP TYPE ' + QUOTENAME(name) + ';'
FROM sys.types
WHERE is_user_defined = 1;

EXEC sp_executesql @type;