drop database antiguedadesAcme;
create database antiguedadesAcme;
use antiguedadesAcme;

CREATE TABLE TipoUsuario (
  id INT PRIMARY KEY,
  Nombre VARCHAR(255)
);

CREATE TABLE Rol (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Permiso (
  id INT PRIMARY KEY,
  Nombre VARCHAR(100)
);

CREATE TABLE PermisoRol (
  idRol INT,
  idPermiso INT,
  PRIMARY KEY (idRol, idPermiso),
  FOREIGN KEY (idRol) REFERENCES Rol(id),
  FOREIGN KEY (idPermiso) REFERENCES Permiso(id)
);


CREATE TABLE Usuario (
  id INT PRIMARY KEY,
  idTipoUsuario INT,
  email VARCHAR(100),
  contraseña VARCHAR(50),
  fechaRegistro DATE,
  Nombre VARCHAR(255),
  idRol INT,
  FOREIGN KEY (idTipoUsuario) REFERENCES TipoUsuario(id),
  FOREIGN KEY (idRol) REFERENCES Rol(id)
);




CREATE TABLE Notificacion (
  id INT PRIMARY KEY,
  idUsuario INT,
  fechaNotifficacion DATE,
  descripcion TEXT,
  FOREIGN KEY (idUsuario) REFERENCES Usuario(id)
);

CREATE TABLE Categoria (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion TEXT
);

CREATE TABLE estadoconservacion (
  id INT PRIMARY KEY,
  nombre VARCHAR(255)
);

CREATE TABLE estadoAntiguedad (
  id INT PRIMARY KEY,
  nombre VARCHAR(255)
);



CREATE TABLE Antiguedad (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  idCategoria INT,
  idEstadoConservacion INT,
  epoca DATE,
  precio DECIMAL,
  idEstado INT,
  FOREIGN KEY (idCategoria) REFERENCES Categoria(id),
  FOREIGN KEY (idEstadoConservacion) REFERENCES estadoconservacion(id),
  FOREIGN KEY (idEstado) REFERENCES estadoAntiguedad(id)
);

CREATE TABLE HistorialPrecios (
  id INT PRIMARY KEY,
  IdAntiguedad INT,
  precioActual DECIMAL,
  PrecioCambio DECIMAL,
  fechaModificacion DATE,
FOREIGN KEY (idAntiguedad) REFERENCES Antiguedad(id)
);

CREATE TABLE Inventario (
  id INT PRIMARY KEY,
  idAntiguedad INT,
  Cantidad INT,
  FOREIGN KEY (idAntiguedad) REFERENCES Antiguedad(id)
);


CREATE TABLE EstadoTransaccion (
  id INT PRIMARY KEY,
  Estado VARCHAR(100)
);


CREATE TABLE EstadoEntrega (
  id INT PRIMARY KEY,
  estadoEntrega VARCHAR(100)
);

CREATE TABLE Transaccion (
  id INT PRIMARY KEY,
  idComprador INT,
  idVendedor INT,
  idAntiguedad INT,
  fechaTransaccion DATE,
  idEstado INT,
  FOREIGN KEY (idComprador) REFERENCES Usuario(id),
  FOREIGN KEY (idVendedor) REFERENCES Usuario(id),
  FOREIGN KEY (idAntiguedad) REFERENCES Antiguedad(id),
  FOREIGN KEY (idEstado) REFERENCES EstadoTransaccion(id)
);


CREATE TABLE Pago (
  id INT PRIMARY KEY,
  idTransaccion INT,
  fechaPágo DATE,
  Monto DECIMAL,
  idEstadoEntrega INT,
  FOREIGN KEY (idTransaccion) REFERENCES Transaccion(id),
  FOREIGN KEY (idEstadoEntrega) REFERENCES EstadoEntrega(id)
);
