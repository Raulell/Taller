USE TallerDB

--Consulta para saber el valor de todas las reparaciones de un vehículo
SELECT Matricula, SUM(ValorMateriales + (HorasReparacion * 50)) AS TotalReparaciones
FROM Reparaciones
WHERE Matricula = '1111AAA'
GROUP BY Matricula;

--Una vez creado y ejecutado el store procedure deberia haber 0 reparaciones pendientes de facturar
--Consulta para saber las reparaciones pendientes de facturar
SELECT r.*
FROM Reparaciones r
LEFT JOIN Facturas f ON r.VehiculoID = f.VehiculoID
WHERE f.FacturaID IS NULL;

--Consulta para saber qué vehículos aún no han sido reparados
SELECT v.*
FROM Vehiculos v
LEFT JOIN Reparaciones r ON v.VehiculoID = r.VehiculoID
WHERE r.ReparacionID IS NULL;

