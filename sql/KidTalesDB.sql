CREATE DATABASE KidTalesDB;
USE KidTalesDB;

CREATE TABLE Usuario (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(255),
  Correo VARCHAR(255),
  Contrasena VARCHAR(255)
);

INSERT INTO Usuario(Nombre, Correo, Contrasena) VALUES("Raul","raul.jimenez@kidtales.com", "765raul1234"), ("Sara","sara.sara@kidtales.com", "765sara1234");

CREATE TABLE Rol (
  RolID INT PRIMARY KEY,
  Nombre VARCHAR(255)
);

INSERT INTO Rol(RolID, Nombre) VALUES(1,"SoporteTecnico"), (2,"Padre");

CREATE TABLE UsuarioRol (
  UserID INT,
  RolID INT,
  PRIMARY KEY (UserID, RolID),
  FOREIGN KEY (UserID) REFERENCES Usuario(UserID),
  FOREIGN KEY (RolID) REFERENCES Rol(RolID)
);

INSERT INTO UsuarioRol(UserID, RolID) VALUES(1,1), (2,1);

CREATE TABLE Padre (
  UserID INT PRIMARY KEY,
  CodigoControlParental INT(4),
  FOREIGN KEY (UserID) REFERENCES Usuario(UserID)
);

CREATE TABLE SoporteTecnico (
  UserID INT PRIMARY KEY,
  FOREIGN KEY (UserID) REFERENCES Usuario(UserID)
);

INSERT INTO SoporteTecnico(UserID) VALUES(1), (2);

CREATE TABLE Nino (
  NinoID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT,
  Nickname VARCHAR(255),
  FOREIGN KEY (UserID) REFERENCES Padre(UserID)
);

CREATE TABLE Cuento (
  CuentoID INT AUTO_INCREMENT PRIMARY KEY,
  Titulo VARCHAR(255),
  Contenido TEXT,
  Imagen VARCHAR(255)
);

CREATE TABLE Chat (
  ChatID INT AUTO_INCREMENT PRIMARY KEY,
  PadreID INT,
  SoporteTecnicoID INT,
  FOREIGN KEY (PadreID) REFERENCES Padre(UserID),
  FOREIGN KEY (SoporteTecnicoID) REFERENCES SoporteTecnico(UserID)
);

CREATE TABLE Mensaje (
  MensajeID INT AUTO_INCREMENT PRIMARY KEY,
  ChatID INT,
  UserID INT,
  Contenido TEXT,
  FOREIGN KEY (ChatID) REFERENCES Chat(ChatID),
  FOREIGN KEY (UserID) REFERENCES Usuario(UserID)
);

CREATE TABLE ConfiguracionPadre (
  UserID INT PRIMARY KEY,
  TiempoPantalla INT,
  MetodoPago VARCHAR(255),
  Idioma VARCHAR(255),
  FOREIGN KEY (UserID) REFERENCES Padre(UserID)
);

CREATE TABLE Transaccion (
  TransaccionID INT AUTO_INCREMENT PRIMARY KEY,
  PadreID INT,
  Monto DECIMAL(10, 2),
  Estado VARCHAR(50),
  Fecha TIMESTAMP,
  FOREIGN KEY (PadreID) REFERENCES Padre(UserID)
);

CREATE TABLE GestionFavoritos (
  NinoID INT,
  CuentoID INT,
  PRIMARY KEY (NinoID, CuentoID),
  FOREIGN KEY (NinoID) REFERENCES Nino(NinoID),
  FOREIGN KEY (CuentoID) REFERENCES Cuento(CuentoID)
);

CREATE TABLE Auditoria(
  ID INT AUTO_INCREMENT PRIMARY KEY,
  DESCRIPCION VARCHAR(40),
  USUARIO VARCHAR(20),
  MOMENTO TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_insert_transaccion
AFTER INSERT ON Transaccion
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DESCRIPCION, USUARIO, MOMENTO) VALUES ('Se ha realizado una transaccion', USER(), NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_insert_soporte
AFTER INSERT ON SoporteTecnico
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DESCRIPCION, USUARIO, MOMENTO) VALUES ('Se ha añadido un soporte', USER(), NOW());
END //

DELIMITER ;