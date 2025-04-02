USE TallerDB; -- Aseg�rate de usar la base de datos correcta
GO
CREATE PROCEDURE GenerarFactura (
    @ReparacionID INT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Declaraci�n de variables
    DECLARE @VehiculoID INT;
    DECLARE @ClienteID INT;
    DECLARE @ValorMateriales DECIMAL(10, 2);
    DECLARE @HorasReparacion DECIMAL(10, 2);
    DECLARE @Importe DECIMAL(10, 2);

    -- Recuperar informaci�n de la reparaci�n
    SELECT 
        @VehiculoID = VehiculoID,
        @ValorMateriales = ValorMateriales,
        @HorasReparacion = HorasReparacion
    FROM Reparaciones
    WHERE ReparacionID = @ReparacionID;

    -- Validaci�n: Si la reparaci�n no existe
    IF @VehiculoID IS NULL
    BEGIN
        RAISERROR ('La reparaci�n especificada no existe.', 16, 1);
        RETURN;
    END;

    -- Recuperar informaci�n del cliente asociado al veh�culo
    SELECT 
        @ClienteID = ClienteID
    FROM Vehiculos
    WHERE VehiculoID = @VehiculoID;

    -- Validaci�n: Si el cliente asociado no existe
    IF @ClienteID IS NULL
    BEGIN
        RAISERROR ('El veh�culo asociado no tiene un cliente asignado.', 16, 1);
        RETURN;
    END;

    -- Calcular importe total
    SET @Importe = (@HorasReparacion * 50) + @ValorMateriales;

    -- Insertar la factura
    INSERT INTO Facturas (NumFactura, FechaFactura, Importe, ClienteID, VehiculoID)
    VALUES (
    CAST(NEWID() AS VARCHAR(36)), -- Convierte el identificador �nico a texto
    GETDATE(), 
    @Importe, 
    @ClienteID, 
    @VehiculoID
);
END;
GO
