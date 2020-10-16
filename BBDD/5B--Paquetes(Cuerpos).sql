--Funcion Auxiliar
CREATE OR REPLACE FUNCTION ASSERT_EQUALS (salida BOOLEAN, salidaEsperada BOOLEAN)
RETURN VARCHAR2
IS
BEGIN
  IF salida = salidaEsperada THEN
    RETURN 'ÉXITO';
  ELSE
    RETURN 'FALLO';
  END IF;
END;
/

--Cuerpos de paquetes
--Persona
CREATE OR REPLACE PACKAGE BODY PCK_Persona IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Persona;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Persona.DNI%TYPE, v_nombre IN Persona.Nombre%TYPE, v_apellidos IN Persona.Apellidos%TYPE, v_fechNacimiento IN Persona.FechNacimiento%TYPE, v_email IN Persona.Email%TYPE,v_telefono IN Persona.Telefono%TYPE,v_direccion IN Persona.Direccion%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_persona Persona%ROWTYPE;  
    v_idPersona NUMBER;
    BEGIN
      /*Insertar PERSONA*/ 
      INSERT INTO Persona
      VALUES (SEC_idPersona.nextval,v_DNI,v_nombre,v_apellidos, v_fechNacimiento, v_email, v_telefono, v_direccion);
      /*Seleccionar persona y comprobar que los datos se insertaron correctamente*/
  v_idPersona := SEC_idPersona.currval;
  SELECT * INTO v_persona FROM Persona WHERE idPersona = v_idPersona;
  IF(v_persona.DNI<>v_DNI OR v_persona.Nombre<>v_nombre OR v_persona.Apellidos<>v_apellidos OR v_persona.FechNacimiento<>v_fechNacimiento OR v_persona.Email<>v_email OR v_persona.Telefono<>v_telefono OR v_persona.Direccion<>v_direccion) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idPersona IN Persona.idPersona%TYPE, v_DNI IN Persona.DNI%TYPE, v_nombre IN Persona.Nombre%TYPE, v_apellidos IN Persona.Apellidos%TYPE, v_fechNacimiento IN Persona.FechNacimiento%TYPE, v_email IN Persona.Email%TYPE, v_telefono IN Persona.Telefono%TYPE, v_direccion IN Persona.Direccion%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_persona Persona%ROWTYPE;
    BEGIN
      /*Actualizar persona*/
      UPDATE Persona SET DNI = v_DNI, Nombre = v_nombre, Apellidos = v_apellidos, FechNacimiento = v_fechNacimiento, Email = v_email, Telefono = v_telefono, Direccion = v_direccion
    WHERE idPersona = v_idPersona;
     /*Seleccionar persona y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_persona FROM Persona WHERE idPersona = v_idPersona;
      IF (v_persona.DNI<>v_DNI OR v_persona.Nombre<>v_nombre OR v_persona.Apellidos<>v_apellidos OR v_persona.FechNacimiento<>v_fechNacimiento OR v_persona.Email<>v_email OR v_persona.Telefono<>v_telefono OR v_persona.Direccion<>v_direccion) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idPersona IN Persona.idPersona%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Persona INTEGER;
    BEGIN
      /*Eliminar Persona*/
      DELETE FROM Persona WHERE idPersona = v_idPersona;
      /*Verificar que Persona no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Persona FROM Persona WHERE idPersona = v_idPersona;
      IF(n_Persona<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Persona;
/

--Usuario
CREATE OR REPLACE PACKAGE BODY PCK_Usuario IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Usuario;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_nombreUsuario IN Usuario.nombreUsuario%TYPE, v_contrasenya IN Usuario.Contrasenya%TYPE, v_campanyas IN Usuario.Campanyas%TYPE, v_numCampanyas IN Usuario.NumCampanyas%TYPE, v_donacionAnyo IN Usuario.DonacionAnyo%TYPE,v_fechInicio IN Usuario.FechInicio%TYPE,v_fechFin IN Usuario.FechFin%TYPE,v_privilegioEdit IN Usuario.PrivilegioEdit%TYPE,v_privilegioPub IN Usuario.PrivilegioPub%TYPE,v_cargo IN Usuario.Cargo%TYPE,v_idPersona IN Usuario.idPersona%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_usuario Usuario%ROWTYPE;  
    v_idUsuario NUMBER;
    BEGIN
      /*Insertar Usuario*/ 
      INSERT INTO Usuario
      VALUES (SEC_idUsuario.nextval,v_nombreUsuario,v_contrasenya,v_campanyas, v_numCampanyas, v_donacionAnyo, v_fechInicio, v_fechFin, v_privilegioEdit, v_privilegioPub, v_cargo,v_idPersona);
      /*Seleccionar Usuario y comprobar que los datos se insertaron correctamente*/
  v_idUsuario := SEC_idUsuario.currval;
  SELECT * INTO v_usuario FROM Usuario WHERE idUsuario = v_idUsuario;
  IF(v_usuario.nombreUsuario<>v_nombreUsuario OR v_usuario.Contrasenya<>v_contrasenya OR v_usuario.Campanyas<>v_campanyas OR v_usuario.NumCampanyas<>v_numCampanyas OR v_usuario.DonacionAnyo<>v_donacionAnyo OR v_usuario.FechInicio<>v_fechInicio OR v_usuario.FechFin<>v_fechFin OR v_usuario.PrivilegioEdit<>v_privilegioEdit OR v_usuario.PrivilegioPub<>v_privilegioPub OR v_usuario.Cargo<>v_cargo OR v_usuario.idPersona<>v_idPersona) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idUsuario IN Usuario.idUsuario%TYPE, v_nombreUsuario IN Usuario.nombreUsuario%TYPE, v_contrasenya IN Usuario.Contrasenya%TYPE, v_campanyas IN Usuario.Campanyas%TYPE, v_numCampanyas IN Usuario.NumCampanyas%TYPE, v_donacionAnyo IN Usuario.DonacionAnyo%TYPE, v_fechInicio IN Usuario.FechInicio%TYPE, v_fechFin IN Usuario.FechFin%TYPE,v_privilegioEdit IN Usuario.PrivilegioEdit%TYPE,v_privilegioPub IN Usuario.PrivilegioPub%TYPE,v_cargo IN Usuario.Cargo%TYPE,v_idPersona IN Usuario.idPersona%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_usuario Usuario%ROWTYPE;
    BEGIN
      /*Actualizar Usuario*/
      UPDATE Usuario SET nombreUsuario = v_nombreUsuario, Contrasenya = v_contrasenya, Campanyas = v_campanyas, NumCampanyas = v_numCampanyas, DonacionAnyo = v_donacionAnyo, FechInicio = v_fechInicio, FechFin = v_fechFin, PrivilegioEdit = v_privilegioEdit, PrivilegioPub = v_privilegioPub, Cargo = v_cargo, idPersona = v_idPersona
    WHERE idUsuario = v_idUsuario;
     /*Seleccionar Usuario y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_usuario FROM Usuario WHERE idUsuario = v_idUsuario;
      IF (v_usuario.nombreUsuario<>v_nombreUsuario OR v_usuario.Contrasenya<>v_contrasenya OR v_usuario.Campanyas<>v_campanyas OR v_usuario.NumCampanyas<>v_numCampanyas OR v_usuario.DonacionAnyo<>v_donacionAnyo OR v_usuario.FechInicio<>v_fechInicio OR v_usuario.FechFin<>v_fechFin  OR v_usuario.PrivilegioEdit<>v_privilegioEdit OR v_usuario.PrivilegioPub<>v_privilegioPub OR v_usuario.Cargo<>v_cargo OR v_usuario.idPersona<>v_idPersona) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idUsuario IN Usuario.idUsuario%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Usuario INTEGER;
    BEGIN
      /*Eliminar Usuario*/
      DELETE FROM Usuario WHERE idUsuario = v_idUsuario;
      /*Verificar que Usuario no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Usuario FROM Usuario WHERE idUsuario = v_idUsuario;
      IF(n_Usuario<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Usuario;
/


--Material
CREATE OR REPLACE PACKAGE BODY PCK_Material IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Material;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_cantidad IN Material.Cantidad%TYPE, v_tipoDeMaterial IN Material.TipoDeMaterial%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_material Material%ROWTYPE;  
    v_idMaterial NUMBER;
    BEGIN
      /*Insertar Material*/ 
      INSERT INTO Material
      VALUES (SEC_idMaterial.nextval,v_cantidad,v_tipoDeMaterial);
      /*Seleccionar material y comprobar que los datos se insertaron correctamente*/
  v_idMaterial := SEC_idMaterial.currval;
  SELECT * INTO v_material FROM Material WHERE idMaterial = v_idMaterial;
  IF(v_material.Cantidad<>v_cantidad OR v_material.TipoDeMaterial<>v_tipoDeMaterial) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idMaterial IN Material.idMaterial%TYPE, v_cantidad IN Material.Cantidad%TYPE, v_tipoDeMaterial IN Material.TipoDeMaterial%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_material Material%ROWTYPE;
    BEGIN
      /*Actualizar material*/
      UPDATE Material SET Cantidad = v_cantidad, TipoDeMaterial = v_tipoDeMaterial
      WHERE idMaterial = v_idMaterial;
     /*Seleccionar material y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_material FROM Material WHERE idMaterial = v_idMaterial;
      IF (v_material.Cantidad<>v_cantidad OR v_material.TipoDeMaterial<>v_tipoDeMaterial) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idMaterial IN Material.idMaterial%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Material INTEGER;
    BEGIN
      /*Eliminar Material*/
      DELETE FROM Material WHERE idMaterial = v_idMaterial;
      /*Verificar que material no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Material FROM Material WHERE idMaterial = v_idMaterial;
      IF(n_Material<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Material;
/


--Capital
CREATE OR REPLACE PACKAGE BODY PCK_Capital IS

PROCEDURE Inicializar 
IS BEGIN
 DELETE FROM Capital;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_cantidad IN Capital.Cantidad%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_capital Capital%ROWTYPE; 
    v_idCapital NUMBER;
    BEGIN
      /*Insertar Capital*/ 
      INSERT INTO Capital
      VALUES (SEC_idCapital.nextval,v_cantidad);
      /*Seleccionar Capital y comprobar que los datos se insertaron correctamente*/
 v_idCapital := SEC_idCapital.currval;
 SELECT * INTO v_capital FROM Capital WHERE idCapital = v_idCapital;
 IF(v_capital.Cantidad<>v_cantidad) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idCapital IN Capital.idCapital%TYPE, v_cantidad IN Capital.Cantidad%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_capital Capital%ROWTYPE;
    BEGIN
      /*Actualizar capital*/
      UPDATE Capital SET Cantidad = v_cantidad
      WHERE idCapital = v_idCapital;
     /*Seleccionar Capital y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_capital FROM Capital WHERE idCapital = v_idCapital;
      IF (v_capital.Cantidad<>v_cantidad) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idCapital IN Capital.idCapital%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Capital INTEGER;
    BEGIN
      /*Eliminar Capital*/
      DELETE FROM Capital WHERE idCapital = v_idCapital;
      /*Verificar que Capital no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Capital FROM Capital WHERE idCapital = v_idCapital;
      IF(n_Capital<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Capital;
/
--Institucion
CREATE OR REPLACE PACKAGE BODY PCK_Institucion IS

PROCEDURE Inicializar 
IS BEGIN
 DELETE FROM Institucion;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_nombreEmpresa IN Institucion.NombreEmpresa%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_institucion Institucion%ROWTYPE; 
    v_idEmpresa NUMBER;
    BEGIN
      /*Insertar Institucion*/ 
      INSERT INTO Institucion
      VALUES (SEC_idEmpresa.nextval,v_nombreEmpresa);
      /*Seleccionar Institucion y comprobar que los datos se insertaron correctamente*/
 v_idEmpresa := SEC_idEmpresa.currval;
 SELECT * INTO v_institucion FROM Institucion WHERE idEmpresa = v_idEmpresa;
 IF(v_institucion.NombreEmpresa<>v_nombreEmpresa) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idEmpresa IN Institucion.idEmpresa%TYPE, v_nombreEmpresa IN Institucion.NombreEmpresa%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_institucion Institucion%ROWTYPE;
    BEGIN
      /*Actualizar institucion*/
      UPDATE Institucion SET NombreEmpresa = v_nombreEmpresa
      WHERE idEmpresa = v_idEmpresa;
     /*Seleccionar Institucion y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_institucion FROM Institucion WHERE idEmpresa = v_idEmpresa;
      IF (v_institucion.NombreEmpresa<>v_nombreEmpresa) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idEmpresa IN Institucion.idEmpresa%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Institucion INTEGER;
    BEGIN
      /*Eliminar Institucion*/
      DELETE FROM Institucion WHERE idEmpresa = v_idEmpresa;
      /*Verificar que Institucion no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Institucion FROM Institucion WHERE idEmpresa = v_idEmpresa;
      IF(n_Institucion<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Institucion;
/

--Anonimo
CREATE OR REPLACE PACKAGE BODY PCK_Anonimo IS

PROCEDURE Inicializar 
IS BEGIN
 DELETE FROM Anonimo;
END Inicializar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idAnonimo IN Anonimo.idAnonimo%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Anonimo INTEGER;
    BEGIN
      /*Eliminar Anonimo*/
      DELETE FROM Anonimo WHERE idAnonimo = v_idAnonimo;
      /*Verificar que Anonimo no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Anonimo FROM Anonimo WHERE idAnonimo = v_idAnonimo;
      IF(n_Anonimo<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Anonimo;
/
--Donacion
CREATE OR REPLACE PACKAGE BODY PCK_Donacion IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Donacion;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_tipoDonacion IN Donacion.TipoDonacion%TYPE, v_campanya IN Donacion.Campanya%TYPE, v_tipoDonante IN Donacion.TipoDonante%TYPE, v_idMaterial IN Donacion.idMaterial%TYPE, v_idCapital IN Donacion.idCapital%TYPE,v_idPersona IN Donacion.idPersona%TYPE,v_idAnonimo IN Donacion.idAnonimo%TYPE,v_idEmpresa IN Donacion.idEmpresa%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_donacion Donacion%ROWTYPE;  
    v_idDonacion NUMBER;
    BEGIN
      /*Insertar donacion*/ 
      INSERT INTO Donacion
      VALUES (SEC_idDonacion.nextval,v_tipoDonacion,v_campanya,v_tipoDonante, v_idMaterial, v_idCapital, v_idPersona, v_idAnonimo, v_idEmpresa);
      /*Seleccionar donacion y comprobar que los datos se insertaron correctamente*/
  v_idDonacion := SEC_idDonacion.currval;
  SELECT * INTO v_donacion FROM Donacion WHERE idDonacion = v_idDonacion;
  IF(v_donacion.TipoDonacion<>v_tipoDonacion OR v_donacion.Campanya<>v_campanya OR v_donacion.TipoDonante<>v_tipoDonante OR v_donacion.idMaterial<>v_idMaterial OR v_donacion.idCapital<>v_idCapital OR v_donacion.idPersona<>v_idPersona OR v_donacion.idAnonimo<>v_idAnonimo OR v_donacion.idEmpresa<>v_idEmpresa) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idDonacion IN Donacion.idDonacion%TYPE, v_tipoDonacion IN Donacion.TipoDonacion%TYPE, v_campanya IN Donacion.Campanya%TYPE, v_tipoDonante IN Donacion.TipoDonante%TYPE, v_idMaterial IN Donacion.idMaterial%TYPE, v_idCapital IN Donacion.idCapital%TYPE, v_idPersona IN Donacion.idPersona%TYPE, v_idAnonimo IN Donacion.idAnonimo%TYPE,v_idEmpresa IN Donacion.idEmpresa%TYPE,  salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_donacion Donacion%ROWTYPE;
    BEGIN
      /*Actualizar donacion*/
      UPDATE Donacion SET TipoDonacion = v_tipoDonacion, Campanya = v_campanya, TipoDonante = v_tipoDonante, idMaterial = v_idMaterial, idCapital = v_idCapital, idPersona = v_idPersona, idAnonimo = v_idAnonimo, idEmpresa = v_idEmpresa
    WHERE idDonacion = v_idDonacion;
     /*Seleccionar donacion y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_donacion FROM Donacion WHERE idDonacion = v_idDonacion;
      IF (v_donacion.TipoDonacion<>v_tipoDonacion OR v_donacion.Campanya<>v_campanya OR v_donacion.TipoDonante<>v_tipoDonante OR v_donacion.idMaterial<>v_idMaterial OR v_donacion.idCapital<>v_idCapital OR v_donacion.idPersona<>v_idPersona OR v_donacion.idAnonimo<>v_idAnonimo OR v_donacion.idEmpresa<>v_idEmpresa) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idDonacion IN Donacion.idDonacion%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Donacion INTEGER;
    BEGIN
      /*Eliminar donacion*/
      DELETE FROM Donacion WHERE idDonacion = v_idDonacion;
      /*Verificar que Donacion no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Donacion FROM Donacion WHERE idDonacion = v_idDonacion;
      IF(n_Donacion<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Donacion;
/
--Campanya
CREATE OR REPLACE PACKAGE BODY PCK_Campanya IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Campanya;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_nombreCampanya IN Campanya.NombreCampanya%TYPE, v_fechInicio IN Campanya.FechInicio%TYPE, v_fechFin IN Campanya.FechFin%TYPE, v_presupuesto IN Campanya.Presupuesto%TYPE, v_DNIDestinados IN Campanya.DNIDestinados%TYPE,v_DNIDirector IN Campanya.DNIDirector%TYPE,v_capitalInvertido IN Campanya.CapitalInvertido%TYPE,v_idDonacion IN Campanya.idDonacion%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_campanya Campanya%ROWTYPE;  
    v_idCampanya NUMBER;
    BEGIN
      /*Insertar campanya*/ 
      INSERT INTO Campanya
      VALUES (SEC_idCampanya.nextval,v_nombreCampanya,v_fechInicio,v_fechFin, v_presupuesto, v_DNIDestinados, v_DNIDirector, v_capitalInvertido, v_idDonacion);
      /*Seleccionar campanya y comprobar que los datos se insertaron correctamente*/
  v_idCampanya := SEC_idCampanya.currval;
  SELECT * INTO v_campanya FROM Campanya WHERE idCampanya = v_idCampanya;
  IF(v_campanya.NombreCampanya<>v_nombreCampanya OR v_campanya.FechInicio<>v_fechInicio OR v_campanya.FechFin<>v_fechFin OR v_campanya.Presupuesto<>v_presupuesto OR v_campanya.DNIDestinados<>v_DNIDestinados OR v_campanya.DNIDirector<>v_DNIDirector OR v_campanya.CapitalInvertido<>v_capitalInvertido OR v_campanya.idDonacion<>v_idDonacion) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idCampanya IN Campanya.idCampanya%TYPE, v_nombreCampanya IN Campanya.NombreCampanya%TYPE, v_fechInicio IN Campanya.FechInicio%TYPE, v_fechFin IN Campanya.FechFin%TYPE, v_presupuesto IN Campanya.Presupuesto%TYPE, v_DNIDestinados IN Campanya.DNIDestinados%TYPE, v_DNIDirector IN Campanya.DNIDirector%TYPE, v_capitalInvertido IN Campanya.CapitalInvertido%TYPE,v_idDonacion IN Campanya.idDonacion%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_campanya Campanya%ROWTYPE;
    BEGIN
      /*Actualizar campanya*/
      UPDATE Campanya SET NombreCampanya = v_nombreCampanya, Fechinicio = v_fechInicio,FechFin = v_fechFin, Presupuesto = v_presupuesto, DNIDestinados = v_DNIDestinados, DNIDirector = v_DNIDirector, CapitalInvertido = v_capitalInvertido, idDonacion = v_idDonacion
    WHERE idCampanya = v_idCampanya;
     /*Seleccionar campanya y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_campanya FROM Campanya WHERE idCampanya = v_idCampanya;
      IF (v_campanya.NombreCampanya<>v_nombreCampanya OR v_campanya.FechInicio<>v_fechInicio OR v_campanya.FechFin<>v_fechFin OR v_campanya.Presupuesto<>v_presupuesto OR v_campanya.DNIDestinados<>v_DNIDestinados OR v_campanya.DNIDirector<>v_DNIDirector OR v_campanya.CapitalInvertido<>v_capitalInvertido OR v_campanya.idDonacion<>v_idDonacion) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idCampanya IN Campanya.idCampanya%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Campanya INTEGER;
    BEGIN
      /*Eliminar campanya*/
      DELETE FROM Campanya WHERE idCampanya = v_idCampanya;
      /*Verificar que Campanya no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Campanya FROM Campanya WHERE idCampanya = v_idCampanya;
      IF(n_Campanya<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Campanya;
/
--AccionHumanitaria
CREATE OR REPLACE PACKAGE BODY PCK_AccionHumanitaria IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM AccionHumanitaria;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_pais IN AccionHumanitaria.Pais%TYPE, v_nombre IN AccionHumanitaria.nombre%TYPE, v_descripcion IN AccionHumanitaria.Descripcion%TYPE, v_fechInicio IN AccionHumanitaria.FechInicio%TYPE, v_FechFin IN AccionHumanitaria.Fechfin%TYPE,v_idCampanya IN AccionHumanitaria.idCampanya%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_accionHumanitaria AccionHumanitaria%ROWTYPE;  
    v_idAccionHumanitaria NUMBER;
    BEGIN
      /*Insertar ACCION HUMANITARIA*/ 
      INSERT INTO AccionHumanitaria
      VALUES (SEC_idAccionHumanitaria.nextval,v_pais,v_nombre,v_descripcion, v_fechInicio, v_FechFin, v_idCampanya);
      /*Seleccionar accion humanitaria y comprobar que los datos se insertaron correctamente*/
  v_idAccionHumanitaria := SEC_idAccionHumanitaria.currval;
  SELECT * INTO v_accionHumanitaria FROM AccionHumanitaria WHERE idAccionHumanitaria = v_idAccionHumanitaria;
  IF(v_accionHumanitaria.Pais<>v_pais OR v_accionHumanitaria.nombre<>v_nombre OR v_accionHumanitaria.Descripcion<>v_descripcion OR v_accionHumanitaria.FechInicio<>v_fechInicio OR v_accionHumanitaria.Fechfin<>v_FechFin OR v_accionHumanitaria.idCampanya<>v_idCampanya) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idAccionHumanitaria IN AccionHumanitaria.idAccionHumanitaria%TYPE, v_pais IN AccionHumanitaria.Pais%TYPE, v_nombre IN AccionHumanitaria.nombre%TYPE, v_descripcion IN AccionHumanitaria.Descripcion%TYPE, v_fechInicio IN AccionHumanitaria.FechInicio%TYPE, v_FechFin IN AccionHumanitaria.Fechfin%TYPE, v_idCampanya IN AccionHumanitaria.idCampanya%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_accionHumanitaria AccionHumanitaria%ROWTYPE;
    BEGIN
      /*Actualizar accion humanitaria*/
      UPDATE AccionHumanitaria SET Pais = v_pais, nombre = v_nombre, Descripcion = v_descripcion, FechInicio = v_fechInicio, Fechfin = v_FechFin, idCampanya = v_idCampanya
    WHERE idAccionHumanitaria = v_idAccionHumanitaria;
     /*Seleccionar accion humanitaria y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_accionHumanitaria FROM AccionHumanitaria WHERE idAccionHumanitaria = v_idAccionHumanitaria;
      IF (v_accionHumanitaria.Pais<>v_pais OR v_accionHumanitaria.nombre<>v_nombre OR v_accionHumanitaria.Descripcion<>v_descripcion OR v_accionHumanitaria.FechInicio<>v_fechInicio OR v_accionHumanitaria.Fechfin<>v_FechFin OR v_accionHumanitaria.idCampanya<>v_idCampanya) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idAccionHumanitaria IN AccionHumanitaria.idAccionHumanitaria%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_AccionHumanitaria INTEGER;
    BEGIN
      /*Eliminar AccionHumanitaria*/
      DELETE FROM AccionHumanitaria WHERE idAccionHumanitaria = v_idAccionHumanitaria;
      /*Verificar que AccionHumanitaria no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_AccionHumanitaria FROM AccionHumanitaria WHERE idAccionHumanitaria = v_idAccionHumanitaria;
      IF(n_AccionHumanitaria<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_AccionHumanitaria;
/
--Noticia
CREATE OR REPLACE PACKAGE BODY PCK_Noticia IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Noticia;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_URL IN Noticia.URL%TYPE, v_titulo IN Noticia.Titulo%TYPE,v_descripcion IN Noticia.Descripcion%TYPE, v_idUsuario IN Noticia.idUsuario%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_noticia Noticia%ROWTYPE;  
    v_idNoticia NUMBER;
    BEGIN
      /*Insertar Noticia*/ 
      INSERT INTO Noticia
      VALUES (SEC_idNoticia.nextval,v_URL,v_titulo,v_descripcion, v_idUsuario);
      /*Seleccionar Noticia y comprobar que los datos se insertaron correctamente*/
  v_idNoticia := SEC_idNoticia.currval;
  SELECT * INTO v_noticia FROM Noticia WHERE idNoticia = v_idNoticia;
  IF(v_noticia.URL<>v_URL OR v_noticia.Titulo<>v_titulo OR v_noticia.Descripcion<>v_descripcion OR v_noticia.idUsuario<>v_idUsuario) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idNoticia IN Noticia.idNoticia%TYPE,  v_URL IN Noticia.URL%TYPE,v_titulo IN Noticia.Titulo%TYPE, v_descripcion IN Noticia.Descripcion%TYPE, v_idUsuario IN Noticia.idUsuario%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_noticia Noticia%ROWTYPE;
    BEGIN
      /*Actualizar noticia*/
      UPDATE Noticia SET URL = v_URL,Titulo = v_titulo, Descripcion = v_descripcion, idUsuario = v_idUsuario
    WHERE idNoticia = v_idNoticia;
     /*Seleccionar noticia y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_noticia FROM Noticia WHERE idNoticia = v_idNoticia;
      IF (v_noticia.URL<>v_URL OR v_noticia.Titulo<>v_titulo OR v_noticia.Descripcion<>v_descripcion OR v_noticia.idUsuario<>v_idUsuario) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idNoticia IN Noticia.idNoticia%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Noticia INTEGER;
    BEGIN
      /*Eliminar Noticia*/
      DELETE FROM Noticia WHERE idNoticia = v_idNoticia;
      /*Verificar que Noticia no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Noticia FROM Noticia WHERE idNoticia = v_idNoticia;
      IF(n_Noticia<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Noticia;
/
--Comentario
CREATE OR REPLACE PACKAGE BODY PCK_Comentario IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM Comentario;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_idUsuario IN Comentario.idUsuario%TYPE,v_titulo IN Comentario.Titulo%TYPE, v_descripcion IN Comentario.Descripcion%TYPE, v_idNoticia IN Comentario.idNoticia%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_comentario Comentario%ROWTYPE;  
    v_idComentario NUMBER;
    BEGIN
      /*Insertar COMENTARIO*/ 
      INSERT INTO Comentario
      VALUES (SEC_idComentario.nextval,v_idUsuario,v_titulo, v_descripcion, v_idNoticia);
      /*Seleccionar comentario y comprobar que los datos se insertaron correctamente*/
  v_idComentario := SEC_idComentario.currval;
  SELECT * INTO v_comentario FROM Comentario WHERE idComentario = v_idComentario;
  IF(v_comentario.idUsuario<>v_idUsuario OR v_comentario.Titulo<>v_titulo OR v_comentario.Descripcion<>v_descripcion OR v_comentario.idNoticia<>v_idNoticia) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idComentario IN Comentario.idComentario%TYPE, v_idUsuario IN Comentario.idUsuario%TYPE, v_titulo IN Comentario.Titulo%TYPE, v_descripcion IN Comentario.Descripcion%TYPE, v_idNoticia IN Comentario.idNoticia%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_comentario Comentario%ROWTYPE;
    BEGIN
      /*Actualizar comentario*/
      UPDATE Comentario SET idUsuario = v_idUsuario, Titulo = v_titulo, Descripcion = v_descripcion, idNoticia = v_idNoticia
    WHERE idComentario = v_idComentario;
     /*Seleccionar comentario y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_comentario FROM Comentario WHERE idComentario = v_idComentario;
      IF (v_comentario.idUsuario<>v_idUsuario OR v_comentario.Titulo<>v_titulo OR v_comentario.Descripcion<>v_descripcion OR v_comentario.idNoticia<>v_idNoticia) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idComentario IN Comentario.idComentario%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_Comentario INTEGER;
    BEGIN
      /*Eliminar Comentarios*/
      DELETE FROM Comentario WHERE idComentario = v_idComentario;
      /*Verificar que Comentario no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_Comentario FROM Comentario WHERE idComentario = v_idComentario;
      IF(n_Comentario<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_Comentario;
/

--AsociacionONG
CREATE OR REPLACE PACKAGE BODY PCK_AsociacionONG IS

PROCEDURE Inicializar 
IS BEGIN
  DELETE FROM AsociacionONG;
END Inicializar;

 PROCEDURE Insertar (nombrePrueba VARCHAR2, v_ONG IN AsociacionONG.ONG%TYPE, v_fondoDisponible IN AsociacionONG.FondoDisponible%TYPE, v_numVoluntarios IN AsociacionONG.NumVoluntarios%TYPE, v_numDirectores IN AsociacionONG.NumDirectores%TYPE, v_numDirectoresVet IN AsociacionONG.NumDirectoresVet%TYPE,v_ultimaDonacion IN AsociacionONG.UltimaDonacion%TYPE,v_usuarioUltimaDonacion IN AsociacionONG.UsuarioUltimaDonacion%TYPE,v_idDonacion IN AsociacionONG.idDonacion%TYPE,v_idUsuario IN AsociacionONG.idUsuario%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN :=true;
    v_asociacionONG AsociacionONG%ROWTYPE;  
    v_idAsociacionONG NUMBER;
    BEGIN
      /*Insertar ASOCIACIONONG*/ 
      INSERT INTO AsociacionONG
      VALUES (SEC_idAsociacionONG.nextval,v_ONG,v_fondoDisponible,v_numVoluntarios, v_numDirectores, v_numDirectoresVet, v_ultimaDonacion, v_usuarioUltimaDonacion, v_idDonacion, v_idUsuario);
      /*Seleccionar asociacionONG y comprobar que los datos se insertaron correctamente*/
  v_idAsociacionONG := SEC_idAsociacionONG.currval;
  SELECT * INTO v_asociacionONG FROM AsociacionONG WHERE idAsociacionONG = v_idAsociacionONG;
  IF(v_asociacionONG.ONG<>v_ONG OR v_asociacionONG.FondoDisponible<>v_fondoDisponible OR v_asociacionONG.NumVoluntarios<>v_numVoluntarios OR v_asociacionONG.NumDirectores<>v_numDirectores OR v_asociacionONG.NumDirectoresVet<>v_numDirectoresVet OR v_asociacionONG.UltimaDonacion<>v_ultimaDonacion OR v_asociacionONG.UsuarioUltimaDonacion<>v_usuarioUltimaDonacion OR v_asociacionONG.idDonacion<>v_idDonacion OR v_asociacionONG.idUsuario<>v_idUsuario) THEN
     salida:= false;
   END IF;
 COMMIT WORK;
  /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
 EXCEPTION 
 WHEN OTHERS THEN
   DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END Insertar;

 PROCEDURE Actualizar(nombrePrueba VARCHAR2, v_idAsociacionONG IN AsociacionONG.idAsociacionONG%TYPE, v_ONG IN AsociacionONG.ONG%TYPE, v_fondoDisponible IN AsociacionONG.FondoDisponible%TYPE, v_numVoluntarios IN AsociacionONG.NumVoluntarios%TYPE, v_numDirectores IN AsociacionONG.NumDirectores%TYPE, v_numDirectoresVet IN AsociacionONG.NumDirectoresVet%TYPE, v_ultimaDonacion IN AsociacionONG.UltimaDonacion%TYPE,v_usuarioUltimaDonacion IN AsociacionONG.UsuarioUltimaDonacion%TYPE,v_idDonacion IN AsociacionONG.idDonacion%TYPE,v_idUsuario IN AsociacionONG.idUsuario%TYPE, salidaEsperada BOOLEAN) IS
   salida BOOLEAN := true;
    v_asociacionONG AsociacionONG%ROWTYPE;
    BEGIN
      /*Actualizar asociacionONG*/
      UPDATE AsociacionONG SET ONG = v_ONG, FondoDisponible = v_fondoDisponible,NumVoluntarios = v_numVoluntarios, NumDirectores = v_numDirectores, NumDirectoresVet = v_numDirectoresVet, UltimaDonacion = v_ultimaDonacion, UsuarioUltimaDonacion = v_usuarioUltimaDonacion, idDonacion = v_idDonacion, idUsuario = v_idUsuario
    WHERE idAsociacionONG = v_idAsociacionONG;
     /*Seleccionar asociacionONG y comprobar que los campos se actualizan correctamente*/
       SELECT * INTO v_asociacionONG FROM AsociacionONG WHERE idAsociacionONG = v_idAsociacionONG;
      IF (v_asociacionONG.ONG<>v_ONG OR v_asociacionONG.FondoDisponible<>v_fondoDisponible OR v_asociacionONG.NumVoluntarios<>v_numVoluntarios OR v_asociacionONG.NumDirectores<>v_numDirectores OR v_asociacionONG.NumDirectoresVet<>v_numDirectoresVet OR v_asociacionONG.UltimaDonacion<>v_ultimaDonacion OR v_asociacionONG.UsuarioUltimaDonacion<>v_usuarioUltimaDonacion OR v_asociacionONG.idDonacion<>v_idDonacion OR v_asociacionONG.idUsuario<>v_idUsuario) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
   END Actualizar;

 PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_idAsociacionONG IN AsociacionONG.idAsociacionONG%TYPE, salidaEsperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_AsociacionONG INTEGER;
    BEGIN
      /*Eliminar Asociacion*/
      DELETE FROM AsociacionONG WHERE idAsociacionONG = v_idAsociacionONG;
      /*Verificar que AsociacionONG no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_AsociacionONG FROM AsociacionONG WHERE idAsociacionONG = v_idAsociacionONG;
      IF(n_AsociacionONG<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombrePrueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
   END Eliminar;     
END PCK_AsociacionONG;
/


