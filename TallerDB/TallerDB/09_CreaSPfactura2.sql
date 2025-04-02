USE TallerDB; -- Asegúrate de usar la base de datos correcta
GO

CREATE PROCEDURE GenerarFactura2 (
    @ReparacionesID NVARCHAR(MAX) -- Lista de ReparacionID separados por comas
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Declaración de variables
    DECLARE @ClienteID INT;
    DECLARE @VehiculoID INT;
    DECLARE @TotalMateriales DECIMAL(10, 2) = 0;
    DECLARE @TotalHoras DECIMAL(10, 2) = 0;
    DECLARE @ImporteTotal DECIMAL(10, 2) = 0;

    -- Crear una tabla temporal para almacenar los ReparacionID
    CREATE TABLE #ReparacionesSeleccionadas (
        ReparacionID INT
    );

    -- Insertar los ReparacionID en la tabla temporal usando STRING_SPLIT
    INSERT INTO #ReparacionesSeleccionadas (ReparacionID)
    SELECT value
    FROM STRING_SPLIT(@ReparacionesID, ',');

    -- Validar y calcular totales: recuperar datos de las reparaciones seleccionadas
    SELECT 
        @VehiculoID = VehiculoID,
        @TotalMateriales = SUM(ValorMateriales),
        @TotalHoras = SUM(HorasReparacion)
    FROM Reparaciones
    WHERE ReparacionID IN (SELECT ReparacionID FROM #ReparacionesSeleccionadas)
    GROUP BY VehiculoID;

    -- Validación: Si el vehículo no existe
    IF @VehiculoID IS NULL
    BEGIN
        RAISERROR ('No se encontraron reparaciones válidas o el vehículo asociado no existe.', 16, 1);
        RETURN;
    END;

    -- Recuperar información del cliente asociado al vehículo
    SELECT @ClienteID = ClienteID
    FROM Vehiculos
    WHERE VehiculoID = @VehiculoID;

    -- Validación: Si el cliente asociado no existe
    IF @ClienteID IS NULL
    BEGIN
        RAISERROR ('El vehículo asociado no tiene un cliente asignado.', 16, 1);
        RETURN;
    END;

    -- Calcular importe total
    SET @ImporteTotal = (@TotalHoras * 50) + @TotalMateriales;

    -- Insertar la factura
    INSERT INTO Facturas (NumFactura, FechaFactura, Importe, ClienteID, VehiculoID)
    VALUES (
        CAST(NEWID() AS VARCHAR(36)), -- Genera un identificador único
        GETDATE(),
        @ImporteTotal,
        @ClienteID,
        @VehiculoID
    );

    -- Limpieza de tabla temporal
    DROP TABLE #ReparacionesSeleccionadas;
END;