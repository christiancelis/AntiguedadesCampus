
INSERT INTO TipoUsuario (id, Nombre) VALUES
(1, 'Cliente'),
(2, 'Coleccionista');

INSERT INTO Rol (id, nombre) VALUES
(1, 'Comprador'),
(2, 'Vendedor'),
(3, 'Administrador');

INSERT INTO Permiso (id, Nombre) VALUES
(1, 'Crear usuario'),
(2, 'Editar usuario'),
(3, 'Eliminar usuario'),
(4, 'Crear antigüedad'),
(5, 'Editar antigüedad'),
(6, 'Eliminar antigüedad');

INSERT INTO PermisoRol (idRol, idPermiso) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6);

INSERT INTO Usuario (id, idTipoUsuario, email, contraseña, fechaRegistro, Nombre, idRol) VALUES
(1, 1, 'ashu@example.com', 'password123', '2022-01-01', 'Juan Perez', 1),
(2, 2, 'esooo@example.com', 'yoyo123', '2022-01-01', 'Pipe pelaez', 2),
(3, 2, 'admin@example.com', 'pejelagarto2000', '2022-01-01', 'Cañizales santaclaus', 3);

INSERT INTO Notificacion (id, idUsuario, fechaNotifficacion, descripcion) VALUES
(1, 1, '2022-01-01', 'Compra realizada'),
(2, 2, '2022-01-02', 'Venta Realizada'),
(3, 3, '2022-01-03', 'Actualizacion Exitosa');

INSERT INTO Categoria (id, nombre, descripcion) VALUES
(1, 'Muebles', 'exotico mueble del renacimiento'),
(2, 'Muebles', 'mueble de oro golfi bañado en diamante'),
(3, 'Pinturas', 'Obra de salvador dali');

INSERT INTO estadoconservacion (id, nombre) VALUES
(1, 'Excelente'),
(2, 'Bueno'),
(3, 'Regular');

INSERT INTO estadoAntiguedad (id, nombre) VALUES
(1, 'Disponible'),
(2, 'Vendido'),
(3, 'Retirado');

INSERT INTO Antiguedad (id, nombre, idCategoria, idEstadoConservacion, epoca, precio, idEstado) VALUES
(1, 'mueble bernioli', 1, 1, '1000-01-01', 1000.00, 1),
(2, 'mueble de seda fina', 2, 2, '1999-01-01', 500.00, 2),
(3, 'la yoconda', 3, 3, '1897-03-01', 200.00, 3);


INSERT INTO HistorialPrecios (id, IdAntiguedad, precioActual, PrecioCambio, fechaModificacion) VALUES
(1, 1, 1000.00, 500.00, '2022-01-01'),
(2, 2, 500.00, 200.00, '2022-01-02'),
(3, 3, 200.00, 100.00, '2022-01-03');


INSERT INTO Inventario (id, idAntiguedad, Cantidad) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 2);

INSERT INTO EstadoTransaccion (id, Estado) VALUES
(1, 'Pendiente'),
(2, 'Aprobada'),
(3, 'Rechazada');


INSERT INTO EstadoEntrega (id, estadoEntrega) VALUES
(1, 'Pendiente'),
(2, 'Entregado'),
(3, 'Cancelada');

INSERT INTO Transaccion (id, idComprador, idVendedor, idAntiguedad, fechaTransaccion, idEstado) VALUES
(1, 1, 2, 1, '2022-01-01', 1),
(2, 2, 3, 2, '2022-01-02', 2),
(3, 3, 1, 3, '2022-01-03', 3);

INSERT INTO Pago (id, idTransaccion, fechaPágo, Monto, idEstadoEntrega) VALUES
(1, 1, '2022-01-01', 1000.00, 1), 
(2, 2, '2022-01-02', 500.00, 2),  
(3, 3, '2022-01-03', 200.00, 1); 