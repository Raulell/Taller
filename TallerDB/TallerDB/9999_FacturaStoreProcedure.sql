USE TallerDB; -- Asegúrate de usar la base de datos correcta
GO
CREATE PROCEDURE GenerarFactura (
    @ReparacionID INT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Declaración de variables
    DECLARE @VehiculoID INT;
    DECLARE @ClienteID INT;
    DECLARE @ValorMateriales DECIMAL(10, 2);
    DECLARE @HorasReparacion DECIMAL(10, 2);
    DECLARE @Importe DECIMAL(10, 2);

    -- Recuperar información de la reparación
    SELECT 
        @VehiculoID = VehiculoID,
        @ValorMateriales = ValorMateriales,
        @HorasReparacion = HorasReparacion
    FROM Reparaciones
    WHERE ReparacionID = @ReparacionID;

    -- Validación: Si la reparación no existe
    IF @VehiculoID IS NULL
    BEGIN
        RAISERROR ('La reparación especificada no existe.', 16, 1);
        RETURN;
    END;

    -- Recuperar información del cliente asociado al vehículo
    SELECT 
        @ClienteID = ClienteID
    FROM Vehiculos
    WHERE VehiculoID = @VehiculoID;

    -- Validación: Si el cliente asociado no existe
    IF @ClienteID IS NULL
    BEGIN
        RAISERROR ('El vehículo asociado no tiene un cliente asignado.', 16, 1);
        RETURN;
    END;

    -- Calcular importe total
    SET @Importe = (@HorasReparacion * 50) + @ValorMateriales;

    -- Insertar la factura
    INSERT INTO Facturas (NumFactura, FechaFactura, Importe, ClienteID, VehiculoID)
    VALUES (
    CAST(NEWID() AS VARCHAR(36)), -- Convierte el identificador único a texto
    GETDATE(), 
    @Importe, 
    @ClienteID, 
    @VehiculoID
);
END;
GO
