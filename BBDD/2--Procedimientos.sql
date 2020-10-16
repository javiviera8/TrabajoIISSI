--Prodecimientos 
--Persona
CREATE OR REPLACE PROCEDURE inicializar_persona
IS BEGIN
  DELETE FROM Persona;
END;
/
CREATE OR REPLACE PROCEDURE insertar_persona
(v_DNI IN Persona.DNI%TYPE,
v_nombre IN Persona.Nombre%TYPE,
v_apellidos IN Persona.Apellidos%TYPE,
v_fechNacimiento IN Persona.FechNacimiento%TYPE,
v_email IN Persona.Email%TYPE,
v_telefono IN Persona.Telefono%TYPE,
v_direccion IN Persona.Direccion%TYPE) IS
BEGIN
  INSERT INTO Persona (idPersona,DNI,Nombre,Apellidos,FechNacimiento,Email,Telefono,Direccion)
  VALUES (SEC_idPersona.nextval,v_DNI,v_nombre,v_apellidos,v_fechNacimiento,v_email,v_telefono,v_direccion);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_persona
(v_idPersona IN Persona.idPersona%TYPE,
v_DNI IN Persona.DNI%TYPE,
v_nombre IN Persona.Nombre%TYPE,
v_apellidos IN Persona.Apellidos%TYPE,
v_fechNacimiento IN Persona.FechNacimiento%TYPE,
v_email IN Persona.Email%TYPE,
v_telefono IN Persona.Telefono%TYPE,
v_direccion IN Persona.Direccion%TYPE) IS
BEGIN
  UPDATE Persona SET DNI = v_DNI,Nombre = v_nombre, Apellidos = v_apellidos, FechNacimiento = v_fechNacimiento, Email = v_email, Telefono = v_telefono, Direccion = v_direccion
  WHERE idPersona = v_idPersona;
END;
/

CREATE OR REPLACE PROCEDURE eliminar_persona
(v_idPersona IN Persona.idPersona%TYPE) IS
BEGIN 
DELETE FROM Persona WHERE idPersona = v_idPersona;
END;
/
CREATE OR REPLACE PROCEDURE consultar_persona IS
CURSOR C IS
    SELECT * FROM persona;
        v_persona Persona%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_persona;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha Nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Telefono:', 25) ||   RPAD('Direccion:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_persona.DNI, 25) || RPAD(v_persona.Nombre, 25) || RPAD(v_persona.Apellidos, 25) || RPAD(v_persona.FechNacimiento, 25) || RPAD(v_persona.Email, 25) || RPAD(v_persona.Telefono, 25) || RPAD(v_persona.Direccion, 25));
    FETCH C INTO v_persona;
    END LOOP;
    CLOSE C;
  END consultar_persona;
/

--Usuario
CREATE OR REPLACE PROCEDURE inicializar_usuario
IS BEGIN
  DELETE FROM Usuario;
END;
/
CREATE OR REPLACE PROCEDURE insertar_usuario
(v_nombreUsuario IN Usuario.nombreUsuario%TYPE,
v_contrasenya IN Usuario.Contrasenya%TYPE,
v_campanyas IN Usuario.Campanyas%TYPE,
v_numCampanyas IN Usuario.NumCampanyas%TYPE,
v_donacionAnyo IN Usuario.DonacionAnyo%TYPE,
v_fechInicio IN Usuario.FechInicio%TYPE,
v_fechFin IN Usuario.FechFin%TYPE,
v_privilegioEdit IN Usuario.PrivilegioEdit%TYPE,
v_privilegioPub IN Usuario.PrivilegioPub%TYPE,
v_cargo IN Usuario.Cargo%TYPE,
v_idPersona IN Usuario.idPersona%TYPE) IS
BEGIN
  INSERT INTO Usuario (idUsuario,nombreUsuario,Contrasenya,Campanyas,NumCampanyas,DonacionAnyo,FechInicio,FechFin,PrivilegioEdit,PrivilegioPub,Cargo,idPersona)
  VALUES (SEC_idUsuario.nextval,v_nombreUsuario,v_contrasenya,v_campanyas,v_numCampanyas,v_donacionAnyo,v_fechInicio,v_fechFin,v_privilegioEdit,v_privilegioPub, v_cargo, v_idPersona);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_usuario
(v_idUsuario IN Usuario.idUsuario%TYPE,
v_nombreUsuario IN Usuario.nombreUsuario%TYPE,
v_contrasenya IN Usuario.Contrasenya%TYPE,
v_campanyas IN Usuario.Campanyas%TYPE,
v_numCampanyas IN Usuario.NumCampanyas%TYPE,
v_donacionAnyo IN Usuario.DonacionAnyo%TYPE,
v_fechInicio IN Usuario.FechInicio%TYPE,
v_fechFin IN Usuario.FechFin%TYPE,
v_privilegioEdit IN Usuario.PrivilegioEdit%TYPE,
v_privilegioPub IN Usuario.PrivilegioPub%TYPE,
v_cargo IN Usuario.Cargo%TYPE,
v_idPersona IN Usuario.idPersona%TYPE) IS
BEGIN
  UPDATE Usuario SET nombreUsuario = v_nombreUsuario, Contrasenya = v_contrasenya, Campanyas = v_campanyas, NumCampanyas = v_numCampanyas, DonacionAnyo = v_donacionAnyo, FechInicio = v_fechInicio, FechFin = v_fechFin,PrivilegioEdit = v_privilegioEdit, PrivilegioPub = v_privilegioPub, Cargo=v_cargo, idPersona = v_idPersona
  WHERE idUsuario = v_idUsuario;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_usuario
(v_idUsuario IN Usuario.idUsuario%TYPE) IS
BEGIN 
DELETE FROM Usuario WHERE idUsuario = v_idUsuario;
END;
/
CREATE OR REPLACE PROCEDURE consultar_usuario is
CURSOR C IS
    SELECT * FROM Usuario;
  v_usuario Usuario%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_usuario;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre Usuario:', 25) || RPAD('Contrasenya:', 25) || RPAD('Campanyas:', 25)|| RPAD('Numero Campanyas:', 25) || RPAD('Donacion Anyo:', 25) || RPAD('Fecha Inicio:', 25) || RPAD('Fecha Fin:', 25) || RPAD('Privilegio Editacion:', 25) || RPAD('Privilegio Publicacion:', 25) || RPAD('Cargo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_usuario.nombreUsuario, 25) || RPAD(v_usuario.Contrasenya, 25) || RPAD(v_usuario.Campanyas, 25) || RPAD(v_usuario.NumCampanyas, 25) || RPAD(v_usuario.DonacionAnyo, 25) || RPAD(v_usuario.FechInicio, 25) || RPAD(v_usuario.FechFin, 25)|| RPAD(v_usuario.PrivilegioEdit, 25) || RPAD(v_usuario.PrivilegioPub, 25)  || RPAD(v_usuario.Cargo, 25));
    FETCH C INTO v_usuario;
    END LOOP;
    CLOSE C;
  END consultar_usuario;
/

--Material
CREATE OR REPLACE PROCEDURE inicializar_material
IS BEGIN
  DELETE FROM Material;
END;
/
CREATE OR REPLACE PROCEDURE insertar_material
(v_cantidad IN Material.Cantidad%TYPE,
v_tipoDeMaterial IN Material.TipoDeMaterial%TYPE) IS
BEGIN
  INSERT INTO Material (idMaterial,Cantidad,TipoDeMaterial)
  VALUES (SEC_idMaterial.nextval,v_cantidad,v_tipoDeMaterial);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_material
(v_idMaterial IN Material.idMaterial%TYPE,
v_cantidad IN Material.Cantidad%TYPE,
v_tipoDeMaterial IN Material.TipoDeMaterial%TYPE) IS
BEGIN
  UPDATE Material SET Cantidad = v_cantidad, TipoDeMaterial = v_tipoDeMaterial
  WHERE idMaterial = v_idMaterial;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_material
(v_idMaterial IN Material.idMaterial%TYPE) IS
BEGIN 
DELETE FROM Material WHERE idMaterial = v_idMaterial;
END;
/
CREATE OR REPLACE PROCEDURE consultar_material is
CURSOR C IS
    SELECT * FROM Material;
  v_material Material%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_material;
    DBMS_OUTPUT.PUT_LINE(RPAD('Cantidad:', 25) || RPAD('Tipo de material:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_material.Cantidad, 25) || RPAD(v_material.TipoDeMaterial, 25));
    FETCH C INTO v_material;
    END LOOP;
    CLOSE C;
  END consultar_material;
/

--Capital
CREATE OR REPLACE PROCEDURE inicializar_capital
IS BEGIN
  DELETE FROM Capital;
END;
/
CREATE OR REPLACE PROCEDURE insertar_capital
(v_cantidad IN Capital.Cantidad%TYPE) IS
BEGIN
  INSERT INTO Capital (idCapital,Cantidad)
  VALUES (SEC_idCapital.nextval,v_cantidad);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_capital
(v_idCapital IN Capital.idCapital%TYPE,
v_cantidad IN Capital.Cantidad%TYPE) IS
BEGIN
  UPDATE Capital SET Cantidad = v_cantidad
  WHERE idCapital = v_idCapital;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_capital
(v_idCapital IN Capital.idCapital%TYPE) IS
BEGIN 
DELETE FROM Capital WHERE idCapital = v_idCapital;
END;
/
CREATE OR REPLACE PROCEDURE consultar_capital is
CURSOR C IS
    SELECT * FROM Capital;
  v_capital Capital%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_capital;
    DBMS_OUTPUT.PUT_LINE(RPAD('Cantidad:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_capital.Cantidad, 25));
    FETCH C INTO v_capital;
    END LOOP;
    CLOSE C;
  END consultar_capital;
/

--Anonimo
CREATE OR REPLACE PROCEDURE inicializar_anonimo
IS BEGIN
  DELETE FROM Anonimo;
END;
/
CREATE OR REPLACE PROCEDURE insertar_anonimo
 IS
BEGIN
  INSERT INTO Anonimo (idAnonimo)
  VALUES (SEC_idAnonimo.nextval);
  COMMIT WORK;
END;
/

CREATE OR REPLACE PROCEDURE eliminar_anonimo
(v_idAnonimo IN Anonimo.idAnonimo%TYPE) IS
BEGIN 
DELETE FROM Anonimo WHERE idAnonimo = v_idAnonimo;
END;
/
CREATE OR REPLACE PROCEDURE consultar_anonimo is
CURSOR C IS
    SELECT * FROM Anonimo;
  v_anonimo Anonimo%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_anonimo;
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE('');
    FETCH C INTO v_anonimo;
    END LOOP;
    CLOSE C;
  END consultar_anonimo;
/

--Institucion
CREATE OR REPLACE PROCEDURE inicializar_institucion
IS BEGIN
  DELETE FROM Institucion;
END;
/
CREATE OR REPLACE PROCEDURE insertar_institucion
 (v_nombreEmpresa IN Institucion.NombreEmpresa%TYPE)IS
BEGIN
  INSERT INTO Institucion (idEmpresa, NombreEmpresa)
  VALUES(SEC_idEmpresa.nextval, v_nombreEmpresa);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_institucion
(v_idEmpresa IN Institucion.idEmpresa%TYPE,
v_nombreEmpresa IN Institucion.NombreEmpresa%TYPE) IS
BEGIN
  UPDATE Institucion SET NombreEmpresa = v_nombreEmpresa
  WHERE idEmpresa = v_idEmpresa;
END;
/

CREATE OR REPLACE PROCEDURE eliminar_institucion
(v_idEmpresa IN Institucion.idEmpresa%TYPE) IS
BEGIN 
DELETE FROM Institucion WHERE idEmpresa = v_idEmpresa;
END;
/
CREATE OR REPLACE PROCEDURE consultar_institucion is
CURSOR C IS
    SELECT * FROM Institucion;
  v_institucion Institucion%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_institucion;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre Empresa:', 50));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_institucion.NombreEmpresa, 50));
    FETCH C INTO v_institucion;
    END LOOP;
    CLOSE C;
  END consultar_institucion;
/

-- Donacion:
CREATE OR REPLACE PROCEDURE inicializar_donacion
IS BEGIN
    DELETE FROM Donacion;
END;
/

CREATE OR REPLACE PROCEDURE insertar_donacion
(v_tipoDonacion IN Donacion.TipoDonacion%TYPE,
v_campanya IN Donacion.Campanya%TYPE,
v_tipoDonante IN Donacion.TipoDonante%TYPE,
v_idMaterial IN Donacion.idMaterial%TYPE,
v_idCapital IN Donacion.idCapital%TYPE,
v_idPersona IN Donacion.idPersona%TYPE,
v_idAnonimo IN Donacion.idAnonimo%TYPE,
v_idEmpresa IN Donacion.idEmpresa%TYPE) IS
BEGIN
    INSERT INTO Donacion (idDonacion, TipoDonacion, Campanya, TipoDonante,idMaterial,idCapital, idPersona,idAnonimo, idEmpresa)
    VALUES (SEC_idDonacion.nextval, v_tipoDonacion, v_campanya, v_tipoDonante,v_idMaterial, v_idCapital, v_idPersona, v_idAnonimo, v_idEmpresa);
    COMMIT WORK;
END;
/

CREATE OR REPLACE PROCEDURE actualizar_donacion
(v_idDonacion IN Donacion.idDonacion%TYPE,
v_tipoDonacion IN Donacion.TipoDonacion%TYPE,
v_campanya IN Donacion.Campanya%TYPE,
v_tipoDonante IN Donacion.TipoDonante%TYPE,
v_idMaterial IN Donacion.idMaterial%TYPE,
v_idCapital IN Donacion.idCapital%TYPE,
v_idPersona IN Donacion.idPersona%TYPE,
v_idAnonimo IN Donacion.idAnonimo%TYPE,
v_idEmpresa IN Donacion.idEmpresa%TYPE) IS
BEGIN
    UPDATE Donacion  SET TipoDonacion = v_tipoDonacion, Campanya = v_campanya,TipoDonante = v_tipoDonante, idMaterial = v_idMaterial, idCapital = v_idCapital, idPersona = v_idPersona, idAnonimo = v_idAnonimo, idEmpresa = v_idEmpresa
    WHERE idDonacion = v_idDonacion;
END;
/

CREATE OR REPLACE PROCEDURE eliminar_donacion
(v_idDonacion IN Donacion.idDonacion%TYPE) IS
BEGIN
    DELETE FROM Donacion WHERE idDonacion = v_idDonacion;
END;
/

CREATE OR REPLACE PROCEDURE consultar_donacion IS
CURSOR C IS 
        SELECT * FROM Donacion;
    v_donacion Donacion%ROWTYPE;
BEGIN
OPEN C;
        FETCH C INTO v_donacion;
        DBMS_OUTPUT.PUT_LINE(RPAD('Tipo de Donacion:', 25) || RPAD('Campanya:', 25) || RPAD('Tipo de donante:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_donacion.TipoDonacion, 25) || RPAD(v_donacion.Campanya, 25) || RPAD(v_donacion.TipoDonante, 25));
        FETCH C INTO v_donacion;
    END LOOP;
    CLOSE C;
  END consultar_donacion;
/

--Campanya
CREATE OR REPLACE PROCEDURE inicializar_campanya
IS BEGIN
  DELETE FROM Campanya;
END;
/
CREATE OR REPLACE PROCEDURE insertar_campanya
(v_nombreCampanya IN Campanya.NombreCampanya%TYPE,
v_fechInicio IN Campanya.FechInicio%TYPE,
v_fechFin IN Campanya.FechFin%TYPE,
v_presupuesto IN Campanya.Presupuesto%TYPE,
v_DNIDestinados IN Campanya.DNIDestinados%TYPE,
v_DNIDirector IN Campanya.DNIDirector%TYPE,
v_capitalInvertido IN Campanya.CapitalInvertido%TYPE,
v_idDonacion IN Campanya.idDonacion%TYPE) 
IS
BEGIN
  INSERT INTO Campanya (idCampanya,NombreCampanya,FechInicio,FechFin,Presupuesto,DNIDestinados,DNIDirector,CapitalInvertido, idDonacion)
  VALUES (SEC_idCampanya.nextval,v_nombreCampanya,v_fechInicio,v_fechFin,v_presupuesto,v_DNIDestinados,v_DNIDirector,v_capitalInvertido, v_idDonacion);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_campanya
(v_idCampanya IN Campanya.idCampanya%TYPE,
v_nombreCampanya IN Campanya.NombreCampanya%TYPE,
v_fechInicio IN Campanya.FechInicio%TYPE,
v_fechFin IN Campanya.FechFin%TYPE,
v_presupuesto IN Campanya.Presupuesto%TYPE,
v_DNIDestinados IN Campanya.DNIDestinados%TYPE,
v_DNIDirector IN Campanya.DNIDirector%TYPE,
v_capitalInvertido IN Campanya.CapitalInvertido%TYPE,
v_idDonacion IN Campanya.idDonacion%TYPE) IS
BEGIN
  UPDATE Campanya SET NombreCampanya = v_nombreCampanya, FechInicio = v_fechInicio, FechFin = v_fechFin, Presupuesto = v_presupuesto, DNIDestinados = v_DNIDestinados, DNIDirector = v_DNIDirector, CapitalInvertido = v_capitalInvertido, idDonacion = v_idDonacion
  WHERE idCampanya = v_idCampanya;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_campanya
(v_idCampanya IN Campanya.idCampanya%TYPE) IS
BEGIN 
DELETE FROM Campanya WHERE idCampanya = v_idCampanya;
END;
/
CREATE OR REPLACE PROCEDURE consultar_campanya is
CURSOR C IS
    SELECT * FROM Campanya;
  v_campanya Campanya%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_campanya;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre Campanya:', 25) || RPAD('Fecha Inicio:', 25) || RPAD('Fecha Fin:', 25) || RPAD('Presupuesto:', 25) || RPAD('DNI destinados:', 25) || RPAD('DNI director:', 25) || RPAD('Capital invertido:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_campanya.NombreCampanya, 25) || RPAD(v_campanya.FechInicio, 25) || RPAD(v_campanya.FechFin, 25) || RPAD(v_campanya.Presupuesto, 25) || RPAD(v_campanya.DNIDestinados, 25) || RPAD(v_campanya.DNIDirector, 25) || RPAD(v_campanya.CapitalInvertido, 25));
    FETCH C INTO v_campanya;
    END LOOP;
    CLOSE C;
  END consultar_campanya;
/

--AccionHumanitaria
CREATE OR REPLACE PROCEDURE inicializar_accionHumanitaria
IS BEGIN
  DELETE FROM AccionHumanitaria;
END;
/
CREATE OR REPLACE PROCEDURE insertar_accionHumanitaria
(v_pais IN AccionHumanitaria.Pais%TYPE,
v_nombre IN AccionHumanitaria.nombre%TYPE,
v_descripcion IN AccionHumanitaria.Descripcion%TYPE,
v_fechInicio IN AccionHumanitaria.FechInicio%TYPE,
v_fechFin IN AccionHumanitaria.FechFin%TYPE,
v_idCampanya IN AccionHumanitaria.idCampanya%TYPE) IS
BEGIN
  INSERT INTO AccionHumanitaria (idAccionHumanitaria,nombre,Pais,Descripcion,FechInicio,FechFin,idCampanya)
  VALUES (SEC_idAccionHumanitaria.nextval,v_nombre,v_pais,v_descripcion,v_fechInicio,v_fechFin,v_idCampanya);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_accionHumanitaria
(v_idAccionHumanitaria IN AccionHumanitaria.idAccionHumanitaria%TYPE,
v_nombre IN AccionHumanitaria.nombre%TYPE,
v_pais IN AccionHumanitaria.Pais%TYPE,
v_descripcion IN AccionHumanitaria.Descripcion%TYPE,
v_fechInicio IN AccionHumanitaria.FechInicio%TYPE,
v_fechFin IN AccionHumanitaria.FechFin%TYPE,
v_idCampanya IN AccionHumanitaria.idCampanya%TYPE) IS
BEGIN
  UPDATE AccionHumanitaria SET Pais = v_pais,nombre = v_nombre, Descripcion = v_descripcion, FechInicio = v_fechInicio, FechFin = v_fechFin,  idCampanya = v_idCampanya
  WHERE idAccionHumanitaria = v_idAccionHumanitaria;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_accionHumanitaria
(v_idAccionHumanitaria IN AccionHumanitaria.idAccionHumanitaria%TYPE) IS
BEGIN 
DELETE FROM AccionHumanitaria WHERE idAccionHumanitaria  = v_idAccionHumanitaria;
END;
/
CREATE OR REPLACE PROCEDURE consultar_accionHumanitaria is
CURSOR C IS
    SELECT * FROM AccionHumanitaria;
  v_accionHumanitaria AccionHumanitaria%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_accionHumanitaria;
    DBMS_OUTPUT.PUT_LINE(RPAD('Pais:', 25)|| RPAD('Nombre:', 25)|| RPAD('Descripcion:', 25) || RPAD('Fecha Inicio:', 25) || RPAD('Fecha Fin:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_accionHumanitaria.Pais, 25) || RPAD(v_accionHumanitaria.nombre, 25) || RPAD(v_accionHumanitaria.Descripcion, 25) || RPAD(v_accionHumanitaria.FechInicio, 25) || RPAD(v_accionHumanitaria.FechFin, 25));
    FETCH C INTO v_accionHumanitaria;
    END LOOP;
    CLOSE C;
  END consultar_accionHumanitaria;
/

--Noticia
CREATE OR REPLACE PROCEDURE inicializar_noticia
IS BEGIN
  DELETE FROM Noticia;
END;
/
CREATE OR REPLACE PROCEDURE insertar_noticia
(v_URL IN Noticia.URL%TYPE,
v_titulo IN Noticia.Titulo%TYPE,
v_descripcion IN Noticia.Descripcion%TYPE,
v_idUsuario IN Noticia.idUsuario%TYPE) IS
BEGIN
  INSERT INTO Noticia (idNoticia,URL,Titulo,Descripcion, idUsuario)
  VALUES (SEC_idNoticia.nextval,v_URL,v_titulo,v_descripcion, v_idUsuario);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_noticia
(v_idNoticia IN Noticia.idNoticia%TYPE,
v_URL IN Noticia.URL%TYPE,
v_titulo IN Noticia.Titulo%TYPE,
v_descripcion IN Noticia.Descripcion%TYPE,
v_idUsuario IN Noticia.idUsuario%TYPE) IS
BEGIN
  UPDATE Noticia SET URL = v_URL, Titulo = v_titulo, Descripcion = v_descripcion, idUsuario = v_idUsuario
  WHERE idNoticia = v_idNoticia;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_noticia
(v_idNoticia IN Noticia.idNoticia%TYPE) IS
BEGIN 
DELETE FROM Noticia WHERE idNoticia = v_idNoticia;
END;
/
CREATE OR REPLACE PROCEDURE consultar_noticia is
CURSOR C IS
    SELECT * FROM Noticia;
  v_noticia Noticia%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_noticia;
    DBMS_OUTPUT.PUT_LINE(RPAD('URL:', 25) || RPAD('Titulo:', 25) || RPAD('Descripcion:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_noticia.URL, 25) || RPAD(v_noticia.Titulo,25) || RPAD(v_noticia.Descripcion, 25));
    FETCH C INTO v_noticia;
    END LOOP;
    CLOSE C;
  END consultar_noticia;
/

--Comentario
CREATE OR REPLACE PROCEDURE inicializar_comentario
IS BEGIN
  DELETE FROM Comentario;
END;
/
CREATE OR REPLACE PROCEDURE insertar_comentario
(v_idUsuario IN Comentario.idUsuario%TYPE,
v_titulo IN Comentario.Titulo%TYPE,
v_descripcion IN Comentario.Descripcion%TYPE, 
v_idNoticia IN Comentario.idNoticia%TYPE) IS
BEGIN
  INSERT INTO Comentario (idComentario,idUsuario,Titulo,Descripcion, idNoticia)
  VALUES (SEC_idComentario.nextval,v_idUsuario,v_titulo,v_descripcion,v_idNoticia);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_comentario
(v_idComentario IN Comentario.idComentario%TYPE,
v_idUsuario IN Comentario.idUsuario%TYPE,
v_titulo IN Comentario.Titulo%TYPE,
v_descripcion IN Comentario.Descripcion%TYPE,
v_idNoticia IN Comentario.idNoticia%TYPE) IS
BEGIN
  UPDATE Comentario SET idUsuario = v_idUsuario, Titulo = v_titulo, Descripcion = v_descripcion, idNoticia = v_idNoticia
  WHERE idComentario = v_idComentario;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_comentario
(v_idComentario IN Comentario.idComentario%TYPE) IS
BEGIN 
DELETE FROM Comentario WHERE idComentario = v_idComentario;
END;
/
CREATE OR REPLACE PROCEDURE consultar_comentario is
CURSOR C IS
    SELECT * FROM Comentario;
  v_comentario Comentario%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_comentario;
        DBMS_OUTPUT.PUT_LINE(RPAD('Titulo:', 25) || RPAD('Descripcion:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_comentario.Titulo, 25) || RPAD(v_comentario.Descripcion, 25));
    FETCH C INTO v_comentario;
    END LOOP;
    CLOSE C;
  END consultar_comentario;
/

--AsociacionONG
CREATE OR REPLACE PROCEDURE inicializar_asociacionONG
IS BEGIN
  DELETE FROM AsociacionONG;
END;
/
CREATE OR REPLACE PROCEDURE insertar_asociacionONG
(v_ONG IN AsociacionONG.ONG%TYPE,
v_fondoDisponible IN AsociacionONG.FondoDisponible%TYPE,
v_numVoluntarios IN AsociacionONG.NumVoluntarios%TYPE,
v_numDirectores IN AsociacionONG.NumDirectores%TYPE,
v_numDirectoresVet IN AsociacionONG.NumDirectoresVet%TYPE,
v_ultimaDonacion IN AsociacionONG.UltimaDonacion%TYPE,
v_usuarioUltimaDonacion IN AsociacionONG.UsuarioUltimaDonacion%TYPE,
v_idDonacion IN AsociacionONG.idDonacion%TYPE,
v_idUsuario IN AsociacionONG.idUsuario%TYPE) IS
BEGIN
  INSERT INTO AsociacionONG (idAsociacionONG,ONG,FondoDisponible,NumVoluntarios,NumDirectores,NumDirectoresVet,Ultimadonacion,UsuarioUltimaDonacion,idDonacion, idUsuario)
  VALUES (SEC_idAsociacionONG.nextval,v_ONG,v_fondoDisponible,v_numVoluntarios,v_numDirectores,v_numDirectoresVet,v_ultimaDonacion,v_usuarioUltimaDonacion,v_idDonacion, v_idUsuario);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_asociacionONG
(v_idAsociacionONG IN AsociacionONG.idAsociacionONG%TYPE,
v_ONG IN AsociacionONG.ONG%TYPE,
v_fondoDisponible IN AsociacionONG.FondoDisponible%TYPE,
v_numVoluntarios IN AsociacionONG.NumVoluntarios%TYPE,
v_numDirectores IN AsociacionONG.NumDirectores%TYPE,
v_numDirectoresVet IN AsociacionONG.NumDirectoresVet%TYPE,
v_ultimaDonacion IN AsociacionONG.UltimaDonacion%TYPE,
v_usuarioUltimaDonacion IN AsociacionONG.UsuarioUltimaDonacion%TYPE,
v_idDonacion IN AsociacionONG.idDonacion%TYPE,
v_idUsuario IN AsociacionONG.idUsuario%TYPE) IS
BEGIN
  UPDATE AsociacionONG SET ONG = v_ONG, FondoDisponible = v_fondoDisponible, NumVoluntarios = v_numVoluntarios, NumDirectores = v_numDirectores, NumDirectoresVet = v_numDirectoresVet, UltimaDonacion = v_ultimaDonacion,UsuarioUltimaDonacion = v_usuarioUltimaDonacion, idDonacion = v_idDonacion, idUsuario = v_idUsuario
  WHERE idAsociacionONG = v_idAsociacionONG;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_asociacionONG
(v_idAsociacionONG IN AsociacionONG.idAsociacionONG%TYPE) IS
BEGIN 
DELETE FROM AsociacionONG WHERE idAsociacionONG = v_idAsociacionONG;
END;
/
CREATE OR REPLACE PROCEDURE consultar_asociacionONG is
CURSOR C IS
    SELECT * FROM AsociacionONG;
  v_asociacionONG AsociacionONG%ROWTYPE;
BEGIN
OPEN C;
    FETCH C INTO v_asociacionONG;
    DBMS_OUTPUT.PUT_LINE(RPAD('ONG:', 25) || RPAD('Fondo disponible:', 25) || RPAD('Numero voluntarios:', 25) || RPAD('Numero directores:', 25) || RPAD('Numero directores veteranos:', 25) || RPAD('Ultima donacion:', 25) || RPAD('Usuario ultima donacion:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
      DBMS_OUTPUT.PUT_LINE(RPAD(v_asociacionONG.ONG, 25) || RPAD(v_asociacionONG.FondoDisponible, 25) || RPAD(v_asociacionONG.NumVoluntarios, 25) || RPAD(v_asociacionONG.NumDirectores, 25) || RPAD(v_asociacionONG.NumDirectoresVet, 25) || RPAD(v_asociacionONG.UltimaDonacion, 25) || RPAD(v_asociacionONG.UsuarioUltimaDonacion, 25));
    FETCH C INTO v_asociacionONG;
    END LOOP;
    CLOSE C;
  END consultar_asociacionONG;
/


