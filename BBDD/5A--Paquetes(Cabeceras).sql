--Cabeceras de paquetes
--Tabla Persona
CREATE OR REPLACE PACKAGE PCK_Persona
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Persona.DNI%TYPE, v_nombre IN Persona.Nombre%TYPE, v_apellidos IN Persona.Apellidos%TYPE, v_fechNacimiento IN Persona.FechNacimiento%TYPE, v_email IN Persona.Email%TYPE,v_telefono IN Persona.Telefono%TYPE,v_direccion IN Persona.Direccion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idPersona IN Persona.idPersona%TYPE, v_DNI IN Persona.DNI%TYPE, v_nombre IN Persona.Nombre%TYPE, v_apellidos IN Persona.Apellidos%TYPE, v_fechNacimiento IN Persona.FechNacimiento%TYPE, v_email IN Persona.Email%TYPE,v_telefono IN Persona.Telefono%TYPE,v_direccion IN Persona.Direccion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idPersona IN Persona.idPersona%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Usuario
CREATE OR REPLACE PACKAGE PCK_Usuario
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2,v_nombreUsuario IN Usuario.nombreUsuario%TYPE,v_contrasenya IN Usuario.Contrasenya%TYPE,v_campanyas IN Usuario.Campanyas%TYPE,v_numCampanyas IN Usuario.NumCampanyas%TYPE,v_donacionAnyo IN Usuario.DonacionAnyo%TYPE,v_fechInicio IN Usuario.FechInicio%TYPE,v_fechFin IN Usuario.FechFin%TYPE,v_privilegioEdit IN Usuario.PrivilegioEdit%TYPE,v_privilegioPub IN Usuario.PrivilegioPub%TYPE,v_cargo IN Usuario.Cargo%TYPE,v_idPersona IN Usuario.idPersona%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2,v_idUsuario IN Usuario.idUsuario%TYPE, v_nombreUsuario IN Usuario.nombreUsuario%TYPE,v_contrasenya IN Usuario.Contrasenya%TYPE,v_campanyas IN Usuario.Campanyas%TYPE,v_numCampanyas IN Usuario.NumCampanyas%TYPE,v_donacionAnyo IN Usuario.DonacionAnyo%TYPE,v_fechInicio IN Usuario.FechInicio%TYPE,v_fechFin IN Usuario.FechFin%TYPE,v_privilegioEdit IN Usuario.PrivilegioEdit%TYPE,v_privilegioPub IN Usuario.PrivilegioPub%TYPE,v_cargo IN Usuario.Cargo%TYPE,v_idPersona IN Usuario.idPersona%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idUsuario IN Usuario.idUsuario%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Material
CREATE OR REPLACE PACKAGE PCK_Material
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_cantidad IN Material.Cantidad%TYPE, v_tipoDeMaterial IN Material.TipoDeMaterial%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idMaterial IN Material.idMaterial%TYPE, v_cantidad IN Material.Cantidad%TYPE, v_tipoDeMaterial IN Material.TipoDeMaterial%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2,v_idMaterial IN Material.idMaterial%TYPE , salidaEsperada BOOLEAN);
END;
/

--Tabla Capital
CREATE OR REPLACE PACKAGE PCK_Capital
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_cantidad IN Capital.Cantidad%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idCapital IN Capital.idCapital%TYPE, v_cantidad IN Capital.Cantidad%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idCapital IN Capital.idCapital%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Anonimo
CREATE OR REPLACE PACKAGE PCK_Anonimo
IS
PROCEDURE Inicializar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idAnonimo IN Anonimo.idAnonimo%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Institucion
CREATE OR REPLACE PACKAGE PCK_Institucion
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_nombreEmpresa IN Institucion.NombreEmpresa%TYPE,salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idEmpresa IN Institucion.idEmpresa%TYPE,v_nombreEmpresa IN Institucion.NombreEmpresa%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2,v_idEmpresa IN Institucion.idEmpresa%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Donacion
CREATE OR REPLACE PACKAGE PCK_Donacion
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_tipoDonacion IN Donacion.TipoDonacion%TYPE, v_campanya IN Donacion.Campanya%TYPE,v_tipoDonante IN Donacion.TipoDonante%TYPE, v_idMaterial IN Donacion.idMaterial%TYPE, v_idCapital IN Donacion.idCapital%TYPE, v_idPersona IN Donacion.idPersona%TYPE, v_idAnonimo IN Donacion.idAnonimo%TYPE, v_idEmpresa IN Donacion.idEmpresa%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idDonacion IN Donacion.idDonacion%TYPE, v_tipoDonacion IN Donacion.TipoDonacion%TYPE, v_campanya IN Donacion.Campanya%TYPE,v_tipoDonante IN Donacion.TipoDonante%TYPE, v_idMaterial IN Donacion.idMaterial%TYPE, v_idCapital IN Donacion.idCapital%TYPE, v_idPersona IN Donacion.idPersona%TYPE, v_idAnonimo IN Donacion.idAnonimo%TYPE, v_idEmpresa IN Donacion.idEmpresa%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2,v_idDonacion IN Donacion.idDonacion%TYPE , salidaEsperada BOOLEAN);
END;
/

--Tabla Campanya
CREATE OR REPLACE PACKAGE PCK_Campanya
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_nombreCampanya IN Campanya.NombreCampanya%TYPE,v_fechInicio IN Campanya.FechInicio%TYPE ,v_fechFin IN Campanya.FechFin%TYPE, v_presupuesto IN Campanya.Presupuesto%TYPE, v_DNIDestinados IN Campanya.DNIDestinados%TYPE, v_DNIDirector IN Campanya.DNIDirector%TYPE, v_capitalInvertido IN Campanya.CapitalInvertido%TYPE, v_idDonacion IN Campanya.idDonacion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idCampanya IN Campanya.idCampanya%TYPE, v_NombreCampanya IN Campanya.NombreCampanya%TYPE,v_fechInicio IN Campanya.FechInicio%TYPE ,v_fechFin IN Campanya.FechFin%TYPE, v_presupuesto IN Campanya.Presupuesto%TYPE, v_DNIDestinados IN Campanya.DNIDestinados%TYPE, v_DNIDirector IN Campanya.DNIDirector%TYPE, v_capitalInvertido IN Campanya.CapitalInvertido%TYPE, v_idDonacion IN Campanya.idDonacion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2,v_idCampanya IN Campanya.idCampanya%TYPE , salidaEsperada BOOLEAN);
END;
/

--Tabla AccionHumanitaria
CREATE OR REPLACE PACKAGE PCK_AccionHumanitaria
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_pais IN AccionHumanitaria.Pais%TYPE,v_nombre IN AccionHumanitaria.nombre%TYPE,v_descripcion IN AccionHumanitaria.Descripcion%TYPE,v_fechInicio IN AccionHumanitaria.FechInicio%TYPE,v_fechFin IN AccionHumanitaria.FechFin%TYPE,v_idCampanya IN AccionHumanitaria.idCampanya%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idAccionHumanitaria IN AccionHumanitaria.idAccionHumanitaria%TYPE, v_pais IN AccionHumanitaria.Pais%TYPE,v_nombre IN AccionHumanitaria.Nombre%TYPE,v_descripcion IN AccionHumanitaria.Descripcion%TYPE,v_fechInicio IN AccionHumanitaria.FechInicio%TYPE,v_fechFin IN AccionHumanitaria.FechFin%TYPE,v_idCampanya IN AccionHumanitaria.idCampanya%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idAccionHumanitaria  IN AccionHumanitaria.idAccionHumanitaria%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Noticia
CREATE OR REPLACE PACKAGE PCK_Noticia
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2,  v_URL IN Noticia.URL%TYPE,v_titulo IN Noticia.Titulo%TYPE, v_descripcion IN Noticia.Descripcion%TYPE,v_idUsuario IN Noticia.idUsuario%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idNoticia IN Noticia.idNoticia%TYPE,v_URL IN Noticia.URL%TYPE, v_titulo IN Noticia.Titulo%TYPE, v_descripcion IN Noticia.Descripcion%TYPE, v_idUsuario IN Noticia.idUsuario%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idNoticia IN Noticia.idNoticia%TYPE , salidaEsperada BOOLEAN);
END;
/

--Tabla Comentario
CREATE OR REPLACE PACKAGE PCK_Comentario
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_idUsuario IN Comentario.idUsuario%TYPE, v_titulo IN Comentario.Titulo%TYPE, v_descripcion IN Comentario.Descripcion%TYPE, v_idNoticia IN Comentario.idNoticia%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idComentario IN Comentario.idComentario%TYPE,v_idUsuario IN Comentario.idUsuario%TYPE, v_titulo IN Comentario.Titulo%TYPE, v_descripcion IN Comentario.Descripcion%TYPE, v_idNoticia IN Comentario.idNoticia%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idComentario IN Comentario.idComentario%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla AsociacionONG
CREATE OR REPLACE PACKAGE PCK_AsociacionONG
IS
PROCEDURE Inicializar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_ONG IN AsociacionONG.ONG%TYPE, v_fondoDisponible IN AsociacionONG.FondoDisponible%TYPE, v_numVoluntarios IN AsociacionONG.NumVoluntarios%TYPE, v_numDirectores IN AsociacionONG.NumDirectores%TYPE, v_numDirectoresVet IN AsociacionONG.NumDirectoresVet%TYPE, v_ultimaDonacion IN AsociacionONG.UltimaDonacion%TYPE, v_usuarioUltimaDonacion IN AsociacionONG.UsuarioUltimaDonacion%TYPE, v_idDonacion IN AsociacionONG.idDonacion%TYPE, v_idUsuario IN AsociacionONG.idUsuario%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_idAsociacionONG IN AsociacionONG.idAsociacionONG%TYPE, v_ONG IN AsociacionONG.ONG%TYPE, v_fondoDisponible IN AsociacionONG.FondoDisponible%TYPE, v_numVoluntarios IN AsociacionONG.NumVoluntarios%TYPE, v_numDirectores IN AsociacionONG.NumDirectores%TYPE, v_numDirectoresVet IN AsociacionONG.NumDirectoresVet%TYPE, v_ultimaDonacion IN AsociacionONG.UltimaDonacion%TYPE, v_usuarioUltimaDonacion IN AsociacionONG.UsuarioUltimaDonacion%TYPE, v_idDonacion IN AsociacionONG.idDonacion%TYPE, v_idUsuario IN AsociacionONG.idUsuario%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_idAsociacionONG IN AsociacionONG.idAsociacionONG%TYPE, salidaEsperada BOOLEAN);
END;
/


