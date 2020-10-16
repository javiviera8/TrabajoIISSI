--BORRADO DE TABLAS

DROP TABLE Persona CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;
DROP TABLE Material CASCADE CONSTRAINTS;
DROP TABLE Capital CASCADE CONSTRAINTS;
DROP TABLE Anonimo CASCADE CONSTRAINTS;
DROP TABLE Institucion CASCADE CONSTRAINTS;
DROP TABLE Donacion CASCADE CONSTRAINTS;
DROP TABLE Campanya CASCADE CONSTRAINTS;
DROP TABLE AccionHumanitaria CASCADE CONSTRAINTS;
DROP TABLE Noticia CASCADE CONSTRAINTS;
DROP TABLE Comentario CASCADE CONSTRAINTS;
DROP TABLE AsociacionONG CASCADE CONSTRAINTS;


--CREACION DE TABLAS:
CREATE TABLE Persona(
idPersona NUMBER NOT NULL,
DNI CHAR(9) NOT NULL UNIQUE ,
Nombre VARCHAR2(50) NOT NULL,
Apellidos VARCHAR2(50) NOT NULL,
FechNacimiento DATE NOT NULL,
Email VARCHAR2(60) NOT NULL UNIQUE,
Telefono CHAR(9) NOT NULL UNIQUE,
Direccion VARCHAR2(50) NOT NULL,
Constraint CK_DNI CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')),
Constraint CK_Telefono CHECK (REGEXP_LIKE(Telefono, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
PRIMARY KEY(idPersona)
);



CREATE TABLE Usuario(
idUsuario NUMBER NOT NULL,
nombreUsuario VARCHAR2(50) UNIQUE NOT NULL,
Contrasenya VARCHAR2(20) NOT NULL,
Campanyas VARCHAR2(2000),
NumCampanyas INT NOT NULL,
DonacionAnyo INT NOT NULL,
FechInicio DATE NOT NULL,
FechFin DATE,
PrivilegioEdit CHAR(1) NOT NULL,
PrivilegioPub CHAR(1) NOT NULL,
Cargo VARCHAR2(17)NOT NULL,
idPersona NUMBER NOT NULL,
CONSTRAINT CK_Cargo CHECK (Cargo IN('Simpatizante','Voluntario','Director','Director Veterano','Administrador')),
PRIMARY KEY(idUsuario),
FOREIGN KEY(idPersona) REFERENCES Persona(idPersona)ON DELETE CASCADE
);

CREATE TABLE Material(
idMaterial NUMBER NOT NULL,
Cantidad INT NOT NULL,
TipoDeMaterial VARCHAR2(20) NOT NULL,
PRIMARY KEY(idMaterial)
);

CREATE TABLE Capital(
idCapital NUMBER NOT NULL,
Cantidad INT NOT NULL,
PRIMARY KEY(idCapital)

);

CREATE TABLE Anonimo(
idAnonimo NUMBER NOT NULL,
PRIMARY KEY(idAnonimo)
);


CREATE TABLE Institucion(
idEmpresa NUMBER NOT NULL,
NombreEmpresa VARCHAR2(50) NOT NULL,
PRIMARY KEY(idEmpresa));

CREATE TABLE Donacion(
idDonacion NUMBER NOT NULL,
TipoDonacion VARCHAR2(10) NOT NULL,
Campanya VARCHAR2(50),
TipoDonante VARCHAR2(15) NOT NULL,
idMaterial NUMBER,
idCapital NUMBER,
idPersona NUMBER,
idAnonimo NUMBER,
idEmpresa NUMBER,
PRIMARY KEY(idDonacion),
FOREIGN KEY(idMaterial) REFERENCES Material(idMaterial) ON DELETE CASCADE,
FOREIGN KEY(idCapital) REFERENCES Capital(idCapital) ON DELETE CASCADE,
FOREIGN KEY(idPersona) REFERENCES Persona(idPersona) ON DELETE CASCADE,
FOREIGN KEY(idAnonimo) REFERENCES Anonimo(idAnonimo) ON DELETE CASCADE,
FOREIGN KEY(idEmpresa) REFERENCES Institucion(idEmpresa) ON DELETE CASCADE
);

CREATE TABLE Campanya(
idCampanya NUMBER NOT NULL,
NombreCampanya VARCHAR2(50) NOT NULL,
FechInicio DATE NOT NULL,
FechFin DATE,
Presupuesto INT NOT NULL,
DNIDestinados VARCHAR2(500) NOT NULL,
DNIDirector CHAR(9) NOT NULL,
CapitalInvertido INT NOT NULL,
idDonacion NUMBER NOT NULL,
CONSTRAINT CK_Presupuesto CHECK (Presupuesto>=0),
CONSTRAINT CK_CapitalInvertido CHECK (CapitalInvertido>=0),
PRIMARY KEY(idCampanya),
FOREIGN KEY(idDonacion) REFERENCES Donacion(idDonacion) ON DELETE CASCADE
);

CREATE TABLE AccionHumanitaria(
idAccionHumanitaria NUMBER NOT NULL,
Pais VARCHAR2(15),
nombre VARCHAR2(50) NOT NULL,
Descripcion VARCHAR2(200) NOT NULL,
FechInicio DATE NOT NULL,
FechFin DATE,
idCampanya NUMBER NOT NULL,
PRIMARY KEY(idAccionHumanitaria),
FOREIGN KEY (idCampanya) REFERENCES Campanya(idCampanya) ON DELETE CASCADE
);

CREATE TABLE Noticia(
idNoticia NUMBER NOT NULL,
URL VARCHAR2(100) NOT NULL,
Titulo VARCHAR2(100) NOT NULL,
Descripcion VARCHAR2(2000) NOT NULL,
idUsuario NUMBER NOT NULL,
PRIMARY KEY(idNoticia),
FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Comentario(
idComentario NUMBER NOT NULL,
idUsuario NUMBER NOT NULL,
Titulo VARCHAR2(100) NOT NULL,
Descripcion VARCHAR2(2000) NOT NULL,
idNoticia NUMBER NOT NULL,
PRIMARY KEY(idComentario),
FOREIGN KEY(idNoticia) REFERENCES Noticia(idNoticia) ON DELETE CASCADE,
FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE AsociacionONG(
idAsociacionONG NUMBER NOT NULL,
ONG VARCHAR2(80) NOT NULL,
FondoDisponible INT NOT NULL,
NumVoluntarios INT NOT NULL,
NumDirectores INT NOT NULL,
NumDirectoresVet INT NOT NULL,
UltimaDonacion DATE NOT NULL,
UsuarioUltimaDonacion VARCHAR2(50),
idDonacion NUMBER NOT NULL,
idUsuario NUMBER NOT NULL,
PRIMARY KEY(idAsociacionONG),
FOREIGN KEY(idDonacion) REFERENCES Donacion(idDonacion) ON DELETE CASCADE,
FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

