-- 1
SELECT a.id, a.nombre, c.nombre AS Categoria, a.precio, ec.nombre AS EstadoConservacion
FROM Antiguedad a
JOIN Categoria c ON a.idCategoria = c.id
JOIN estadoconservacion ec ON a.idEstadoConservacion = ec.id
WHERE a.idEstado = 1;

-- 2 
SELECT a.id, a.nombre, c.nombre AS Categoria, a.precio, ec.nombre AS EstadoConservacion
FROM Antiguedad a
JOIN Categoria c ON a.idCategoria = c.id
JOIN estadoconservacion ec ON a.idEstadoConservacion = ec.id
WHERE c.nombre = 'Muebles' AND a.precio BETWEEN 500 AND 2000;

-- 3 
SELECT t.id, c.Nombre as Cliente, t.fechaTransaccion, a.nombre AS Antiguedad, u.Nombre As Comprador
FROM Transaccion t
JOIN Antiguedad a ON t.idAntiguedad = a.id
JOIN usuario c ON t.idVendedor = c.id
JOIN Usuario u ON t.idComprador = u.id
WHERE t.idVendedor = 3;

-- 4
SELECT SUM(p.Monto) AS TotalVentas
FROM Pago p
WHERE p.fechaPágo BETWEEN '2022-01-01' AND '2022-01-31';

-- 5
SELECT u.id, u.Nombre, COUNT(t.idComprador) AS NumeroCompras
FROM Transaccion t
JOIN Usuario u ON t.idComprador = u.id
GROUP BY u.id, u.Nombre
ORDER BY NumeroCompras DESC;

-- 6
SELECT a.id, a.nombre, COUNT(hp.id) AS NumeroVisitas
FROM Antiguedad a
JOIN HistorialPrecios hp ON a.id = hp.IdAntiguedad
GROUP BY a.id, a.nombre
ORDER BY NumeroVisitas DESC;

-- 7
SELECT t.id, t.fechaTransaccion, a.nombre AS Antiguedad, u.Nombre AS Vendedor, u2.Nombre AS Comprador
FROM Transaccion t
JOIN Antiguedad a ON t.idAntiguedad = a.id
JOIN Usuario u ON t.idVendedor = u.id
JOIN Usuario u2 ON t.idComprador = u2.id
WHERE t.fechaTransaccion BETWEEN '2022-01-01' AND '2022-01-31';

-- 8
SELECT p.Nombre, i.Cantidad
FROM Inventario i
JOIN Antiguedad p ON i.idAntiguedad = p.id;