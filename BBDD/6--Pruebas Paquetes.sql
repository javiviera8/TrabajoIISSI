--Pruebas Paquetes
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI';   --Modificar como nos muestra las fechas
/*Activar salida de texto por pantalla*/
SET SERVEROUTPUT ON;

    DECLARE
    idPersona NUMBER;
    idUsuario NUMBER;
    idMaterial NUMBER;
    idCapital NUMBER;
    idEmpresa NUMBER;
    idAnonimo NUMBER;
    idDonacion NUMBER;
    idCampanya NUMBER;
    idAccionHumanitaria NUMBER;
    idNoticia NUMBER;
    idComentario NUMBER;
    idAsociacionONG NUMBER;
  BEGIN
/**************************************************************************
          PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PERSONA
**************************************************************************/       
DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Persona-----------------------------------------------------');
 PCK_Persona.Inicializar;
 PCK_Persona.Insertar('Prueba 1 - Insercion de cliente','12345678A','Lucia', 'Martin',TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332', 'Calle Pantomima', true);
 idPersona := SEC_idPersona.currval;
 PCK_Persona.Insertar('Prueba 2 - Insercion de persona con dni mayor a 9 caracteres','9876543200B','Jesus','Gonzalez',TO_DATE('01/05/1995','DD/MM/YYYY'),'jesus@gmail.com','660099770','Calle Pantomima',false);
 PCK_Persona.Insertar('Prueba 3 - Insercion de persona con teléfono NULL','98765432B','Jesus','Gonzalez',TO_DATE('01/05/1995','DD/MM/YYYY'),'jesus@gmail.com',null,'Calle Pantomima',false);
 PCK_Persona.Insertar('Prueba 4 - Insercion de persona con email sin @','98765432B','Jesus','Gonzalez',TO_DATE('01/05/1995','DD/MM/YYYY'),'jesusgmail.com','660099770','Calle Pantomima',false);
 PCK_Persona.Insertar('Prueba 5 - Insercion de persona con nombre null','12345678A',null,'Martin',TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332','Calle Pantomima',false); 
 PCK_Persona.Insertar('Prueba 6 - Insercion de persona con fecha nacmiento null','12345678A','Lucia','Martin',null,'lucia@gmail.com','665544332','Calle Pantomima',false);  
 PCK_Persona.Insertar('Prueba 7 - Insercion de persona con apellidos null','12345678A','Lucia',null,TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332','Calle Pantomima',false);  
 PCK_Persona.Insertar('Prueba 8 - Insercion de persona con direccion null','12345678A','Lucia','Martin',TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332',null,false); 
 --Actualizar
 PCK_Persona.Actualizar('Prueba 9 - Actualizacion de persona con nombre null',idPersona,'12345678A',null,'Martin',TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332','Calle Pantomima',false); 
 PCK_Persona.Actualizar('Prueba 10 - Actualizacion de persona con fecha nacmiento null',idPersona,'12345678A','Lucia','Martin',null,'lucia@gmail.com','665544332','Calle Pantomima',false);  
 PCK_Persona.Actualizar('Prueba 11 - Actualizacion de persona con apellidos null',idPersona,'12345678A','Lucia',null,TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332','Calle Pantomima',false);  
 PCK_Persona.Actualizar('Prueba 12 - Actualizacion de persona con direccion null',idPersona,'12345678A','Lucia','Martin',TO_DATE('03/04/1992','DD/MM/YYYY'),'lucia@gmail.com','665544332',null,false); 
 PCK_Persona.Actualizar('Prueba 13 - Actualizacion de persona con dni mayor a 9 caracteres',idPersona,'9876543200B','Jesus','Gonzalez',TO_DATE('01/05/1995','DD/MM/YYYY'),'jesus@gmail.com','660099770','Calle Pantomima',false);
 PCK_Persona.Actualizar('Prueba 14 - Actualizacion de persona con teléfono NULL',idPersona,'98765432B','Jesus','Gonzalez',TO_DATE('01/05/1995','DD/MM/YYYY'),'jesus@gmail.com',null,'Calle Pantomima',false);
 PCK_Persona.Actualizar('Prueba 15 - Actualizacion de persona con email sin @',idPersona,'98765432B','Jesus','Gonzalez',TO_DATE('01/05/1995','DD/MM/YYYY'),'jesusgmail.com','660099770','Calle Pantomima',false);
/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE USUARIO
**************************************************************************/ 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Usuario-----------------------------------------------------');
 PCK_Usuario.Inicializar;
 PCK_Usuario.Insertar('Prueba 16 - Insertar usuario','gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,true);
 idUsuario := SEC_idUsuario.currval;
 PCK_Usuario.Insertar('Prueba 17 - Insertar usuario con otro cargo distinto de los existentes','gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Enfermero',idPersona,false);
 PCK_Usuario.Insertar('Prueba 18 - Insertar usuario con nombre de usuario null',null,'pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 19 - Insertar usuario con contrasenya null','gamez980',null,'Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 20 - Insertar usuario con numero de campanyas null','gamez980','pass123','Salvemos Africa',null,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 21 - Insertar usuario con donacion anual null','gamez980','pass123','Salvemos Africa',2,null,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 22 - Insertar usuario con fecha de inicio en campanya null','gamez980','pass123','Salvemos Africa',2,45,null,TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 23 - Insertar usuario con privilegio editacion null','gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),null,'N','Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 24 - Insertar usuario con privilegio publicacion null','gamez980','pass123',null,2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N',null,'Voluntario',idPersona,false);
 PCK_Usuario.Insertar('Prueba 25 - Insertar usuario con idPersona null','gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',null,false);
 PCK_Usuario.Insertar('Prueba 26 - Insertar usuario con cargo null','gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),null,'N','N',null,idPersona,false);
 --Actualizar
 PCK_Usuario.Actualizar('Prueba 27 - Actualizar usuario con fecha de inicio en campanya null',idUsuario,'gamez980','pass123','Salvemos Africa',2,45,null,TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 28 - Actualizar usuario con privilegio editacion null',idUsuario,'gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),null,'N','Voluntario',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 29 - Actualizar usuario con privilegio publicacion null',idUsuario,'gamez980','pass123',null,2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N',null,'Voluntario',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 30 - Actualizar usuario con idPersona null',idUsuario,'gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',null,false);
 PCK_Usuario.Actualizar('Prueba 31 - Actualizar usuario con cargo null',idUsuario,'gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),null,'N','N',null,idPersona,false);
 PCK_Usuario.Actualizar('Prueba 32 - Actualizar usuario con otro cargo distinto de los existentes',idUsuario,'gamez980','pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Enfermero',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 33 - Actualizar usuario con nombre de usuario null',idUsuario,null,'pass123','Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 34 - Actualizar usuario con contrasenya null',idUsuario,'gamez980',null,'Salvemos Africa',2,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 35 - Actualizar usuario con numero de campanyas null',idUsuario,'gamez980','pass123','Salvemos Africa',null,45,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
 PCK_Usuario.Actualizar('Prueba 36 - Actualizar usuario con donacion anual null',idUsuario,'gamez980','pass123','Salvemos Africa',2,null,TO_DATE('05/05/2003','DD/MM/YYYY'),TO_DATE('14/10/2008','DD/MM/YYYY'),'N','N','Voluntario',idPersona,false);
/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE MATERIAL
**************************************************************************/ 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Material-----------------------------------------------------');
 PCK_Material.Inicializar;
 PCK_Material.Insertar('Prueba 37 - Insertar material',150,'Legumbres',true);
 idMaterial := SEC_idMaterial.currval;
 PCK_Material.Insertar('Prueba 38 - Insertar material con cantidad null',null,'Legumbres',false);
 PCK_Material.Insertar('Prueba 39 - Insertar material con tipo de material null',150,null,false);
 PCK_Material.Insertar('Prueba 40 - Insertar material con tipo material superior a 20 bytes',150,'Legumbresssssssssssssssssssssssssssss',false);

 --Actualizar
 PCK_Material.Actualizar('Prueba 41 - Actualizar material con cantidad null',idMaterial,null,'Legumbres',false);
 PCK_Material.Actualizar('Prueba 42 - Actualizar material con tipo de material null',idMaterial,150,null,false);
 PCK_Material.Actualizar('Prueba 43 - Actualizar material con tipo material superior a 20 bytes',idMaterial,150,'Legumbresssssssssssssssssssssssssssss',false);
  
  
/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE CAPITAL
**************************************************************************/ 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Capital-----------------------------------------------------');
 PCK_Capital.Inicializar;
 PCK_Capital.Insertar('Prueba 44 - Insertar capital',3120,true);
 idCapital := SEC_idCapital.currval;
 PCK_Capital.Insertar('Prueba 45 - Insertar capital con cantidad null',null,false);
 --Actualizar
 PCK_Capital.Actualizar('Prueba 46 - Actualizar capital con cantidad null',idCapital,null,false);

  
/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE INSTITUCION
**************************************************************************/ 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Institucion-----------------------------------------------------');
 PCK_Institucion.Inicializar;
 PCK_Institucion.Insertar('Prueba 47 - Insertar institucion','Bomboneros S.L.',true);
 idEmpresa := SEC_idEmpresa.currval;
 PCK_Institucion.Insertar('Prueba 48 - Insertar institucion con nombre de empresa null',null,false);
 PCK_Institucion.Insertar('Prueba 49 - Insertar institucion con nombre de empresa mayor de 50 bytes ','Booooooooooooomboooooooneeeeeeeeeroooooooooossssssssssssss S.L',false);
 --Actualizar
 PCK_Institucion.Actualizar('Prueba 50 - Actualizar institucion con nombre de empresa null',idEmpresa,null,false);
 PCK_Institucion.Actualizar('Prueba 51 - Actualizar institucion con nombre de empresa mayor de 50 bytes ',idEmpresa,'Booooooooooooomboooooooneeeeeeeeeroooooooooossssssssssssss S.L',false);
 
  
/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE ANONIMO
**************************************************************************/ 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Anonimo-----------------------------------------------------');
 PCK_Anonimo.Inicializar;
 idAnonimo := SEC_idAnonimo.currval;
 DBMS_OUTPUT.PUT_LINE('Anonimo solo puede inicializarse y eliminarse');
 --Borrado al final 

/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE DONACION
**************************************************************************/
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Donacion-----------------------------------------------------');
 PCK_Donacion.Inicializar;
 PCK_Donacion.Insertar('Prueba 52 - Insertar donacion','monetaria','¡Peru en peligro!','persona',null,null,null,null,null,true);
 idDonacion := SEC_idDonacion.currval;
 PCK_Donacion.Insertar('Prueba 53 - Insertar donacion con tipo de donacion null',null,'¡Peru en peligro!','persona',idMaterial,idCapital,idPersona,idAnonimo,idEmpresa,false);
 PCK_Donacion.Insertar('Prueba 54 - Insertar donacion con tipo de donante null','monetaria','¡Peru en peligro!',null,idMaterial,idCapital,idPersona,idAnonimo,idEmpresa,false);
 --Actualizar
 PCK_Donacion.Actualizar('Prueba 59 - Actualizar donacion con tipo de donacion null',idDonacion,null,'¡Peru en peligro!','persona',idMaterial,idCapital,idPersona,idAnonimo,idEmpresa,false);
 PCK_Donacion.Actualizar('Prueba 60 - Actualizar donacion con tipo de donante null',idDonacion,'monetaria','¡Peru en peligro!',null,idMaterial,idCapital,idPersona,idAnonimo,idEmpresa,false);
 

/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE CAMPANYA
**************************************************************************/
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Campanya-----------------------------------------------------');
 PCK_Campanya.Inicializar;
 PCK_Campanya.Insertar('Prueba 61 - Insertar campanya','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),TO_DATE('04/05/2011','DD/MM/YYYY'),13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,true);
 idCampanya := SEC_idCampanya.currval;
 PCK_Campanya.Insertar('Prueba 62 - Insertar campanya con nombre de campanya null',null,TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 63 - Insertar campanya con fecha de inicio de campanya null','Terremoto de Haití',null,null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 64 - Insertar campanya con presupuesto null','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,null,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 65 - Insertar campanya con DNI de los destinados null','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,null,'98765432G',4630,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 66 - Insertar campanya con DNI del director null','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D',null,4630,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 67 - Insertar campanya con capital invertido null','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',null,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 68 - Insertar campanya con idDonacion null','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,null,false);
 PCK_Campanya.Insertar('Prueba 69 - Insertar campanya con presupuesto menor que 0','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,-13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Insertar('Prueba 70 - Insertar campanya con capital invertido menor que 0','Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',-4630,idDonacion,false);

 --Actualizar
 PCK_Campanya.Actualizar('Prueba 71 - Actualizar campanya con nombre de campanya null',idCampanya,null,TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 72 - Actualizar campanya con fecha de inicio de campanya null',idCampanya,'Terremoto de Haití',null,null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 73 - Actualizar campanya con presupuesto null',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,null,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 74 - Actualizar campanya con DNI de los destinados null',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,null,'98765432G',4630,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 75 - Actualizar campanya con DNI del director null',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D',null,4630,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 76 - Actualizar campanya con capital invertido null',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',null,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 77 - Actualizar campanya con idDonacion null',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,null,false);
 PCK_Campanya.Actualizar('Prueba 78 - Actualizar campanya con presupuesto menor que 0',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,-13060,'12345678A,12345678B,12345678C,12345678D','98765432G',4630,idDonacion,false);
 PCK_Campanya.Actualizar('Prueba 79 - Actualizar campanya con capital invertido menor que 0',idCampanya,'Terremoto de Haití',TO_DATE('10/01/2009','DD/MM/YYYY'),null,13060,'12345678A,12345678B,12345678C,12345678D','98765432G',-4630,idDonacion,false);

/**************************************************************************
          PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ACCION HUMANITARIA
**************************************************************************/       
DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes AccionHumanitaria-----------------------------------------------------');
 PCK_AccionHumanitaria.Inicializar;
 PCK_AccionHumanitaria.Insertar('Prueba 80 - Insertar accion humanitaria','Haití','Ayuda a paises necesitados', 'Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya, true);
 idAccionHumanitaria := SEC_idAccionHumanitaria.currval;
 PCK_AccionHumanitaria.Insertar('Prueba 81 - Insertar accion humanitaria con nombre null','Haití',null,'Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya,false);
 PCK_AccionHumanitaria.Insertar('Prueba 82 - Insertar accion humanitaria con descripcion null','Haití','Ayuda a paises necesitados',null,TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya,false);
 PCK_AccionHumanitaria.Insertar('Prueba 83 - Insertar accion humanitaria con fehcha de inicio null','Haití','Ayuda a paises necesitados','Necesitamos toda ayuda para el terremoto ocurrido',null,null,idCampanya,false);
 PCK_AccionHumanitaria.Insertar('Prueba 84 - Insertar accion humanitaria con idCampanya null','Haití','Ayuda a paises necesitados','Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,null,false);
 PCK_AccionHumanitaria.Insertar('Prueba 85 - Insertar accion humanitaria con nombre superior a 50 bytes','Haití','Aaaaayyyyyuuuuuudddddaaaaa aaaaaa pppppaaaaiiiisssssseeeeesssss nnnneeeeccccceeeesssiiitttttaaaaaaddddddooooosssss','Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya,false);
 
 --Actualizar
 PCK_AccionHumanitaria.Actualizar('Prueba 86 - Actualizar accion humanitaria con nombre null',idAccionHumanitaria,'Haití',null,'Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya,false); 
 PCK_AccionHumanitaria.Actualizar('Prueba 87 - Actualizar accion humanitaria con descripcion null',idAccionHumanitaria,'Haití','Ayuda a paises necesitados',null,TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya,false);  
 PCK_AccionHumanitaria.Actualizar('Prueba 88 - Actualizar accion humanitaria con fecha inicio null',idAccionHumanitaria,'Haití','Ayuda a paises necesitados','Necesitamos toda ayuda para el terremoto ocurrido',null,null,idCampanya,false);  
 PCK_AccionHumanitaria.Actualizar('Prueba 89 - Actualizar accion humanitaria con idCampanya null',idAccionHumanitaria,'Haití','Ayuda a paises necesitados','Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,null,false); 
 PCK_AccionHumanitaria.Actualizar('Prueba 90 - Actualizar accion humanitaria con nombre superior a 50 bytes',idAccionHumanitaria,'Haití','Aaaaayyyyyuuuuuudddddaaaaa aaaaaa pppppaaaaiiiisssssseeeeesssss nnnneeeeccccceeeesssiiitttttaaaaaaddddddooooosssss','Necesitamos toda ayuda para el terremoto ocurrido',TO_DATE('14/08/2005','DD/MM/YYYY'),null,idCampanya,false); 

/**************************************************************************
          PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA NOTICIA
**************************************************************************/       
DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Noticia-----------------------------------------------------');
 PCK_Noticia.Inicializar;
 PCK_Noticia.Insertar('Prueba 91 - Insertar noticia','http://www.AyudaSinAnimoDeLucro.com','Aportaciones monetarias', 'Se van a realizar una serie de aportaciones por parte de cadenas televisivas',idUsuario, true);
 idNoticia := SEC_idNoticia.currval;
 PCK_Noticia.Insertar('Prueba 92 - Insertar noticia con URL null',null,'Aportaciones monetarias','Se van a realizar una serie de aportaciones de manera capital por parte de cadenas televisivas',idUsuario,false);
 PCK_Noticia.Insertar('Prueba 93 - Insertar noticia con descripcion null','http://www.AyudaSinAnimoDeLucro.com','Aportaciones monetarias',null,idUsuario,false);
 PCK_Noticia.Insertar('Prueba 94 - Insertar noticia con titulo null','http://www.AyudaSinAnimoDeLucro.com',null,'Se van a realizar una serie de aportaciones de manera capital por parte de cadenas televisivas',idUsuario,false);
 PCK_Noticia.Insertar('Prueba 95 - Insertar noticia con idUsuario null','http://www.AyudaSinAnimoDeLucro.com','Aportaciones monetarias','Se van a realizar una serie de aportaciones de manera capital por parte de cadenas televisivas',null,false);
 PCK_Noticia.Insertar('Prueba 96 - Insertar noticia con URL superior a 100 bytes','http://www.AyudaSinAnimoDeLucro.com/fjñbrgfhb.wjf7249_bebdabj932b_bdugf94rt47t/djfkfmr-4eiugdgtenos5n9tmr7','Aportaciones monetarias','Se van a realizar una serie de aportaciones de manera capital por parte de las cadenas televisivas',idUsuario,false);
 
 --Actualizar
 PCK_Noticia.Actualizar('Prueba 97 - Actualizar noticia con URL null',idNoticia,null,'Aportaciones monetarias','Se van a realizar una serie de aportaciones de manera capital por parte de las cadenas televisivas',idUsuario,false); 
 PCK_Noticia.Actualizar('Prueba 98 - Actualizar noticia con descripcion null',idNoticia,'http://www.AyudaSinAnimoDeLucro.com','Aportaciones monetarias',null,idUsuario,false);  
 PCK_Noticia.Actualizar('Prueba 99 - Actualizar noticia con titulo null',idNoticia,'http://www.AyudaSinAnimoDeLucro.com',null,'Se van a realizar una serie de aportaciones de manera capital por parte de las cadenas televisivas',idUsuario,false);  
 PCK_Noticia.Actualizar('Prueba 100 - Actualizar noticia con idUsuario null',idNoticia,'http://www.AyudaSinAnimoDeLucro.com','Aportaciones monetarias','Se van a realizar una serie de aportaciones de manera capital por parte de las cadenas televisivas',null,false); 
 PCK_Noticia.Actualizar('Prueba 101 - Actualizar noticia con URL superior a 100 bytes',idNoticia,'http://www.AyudaSinAnimoDeLucro.com/fjñbrgfhb.wjf7249_bebdabj932b_bdugf94rt47t/djfkfmr-4eiugdgtenos5n9tmr7','Aportaciones monetarias','Se van a realizar una serie de aportaciones de manera capital por parte de las cadenas televisivas',idUsuario,false); 

/**************************************************************************
          PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA COMENTARIO
**************************************************************************/       
DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Comentario-----------------------------------------------------');
 PCK_Comentario.Inicializar;
 PCK_Comentario.Insertar('Prueba 102 - Insertar comentario',idUsuario,'Ayudas extraordinarias', '¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!',idNoticia, true);
 idComentario := SEC_idComentario.currval;
 PCK_Comentario.Insertar('Prueba 103 - Insertar comentario con idUsuario null',null,'Ayudas extraordinarias','¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!',idNoticia,false);
 PCK_Comentario.Insertar('Prueba 104 - Insertar comentario con descripcion null',idUsuario,'Ayudas extraordinarias',null,idNoticia,false);
 PCK_Comentario.Insertar('Prueba 105 - Insertar comentario con titulo null',idUsuario,null,'¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!',idNoticia,false);
 PCK_Comentario.Insertar('Prueba 106 - Insertar comentario con idNoticia null',idUsuario,'Ayudas extraordinarias','¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!',null,false);
 
 --Actualizar
 PCK_Comentario.Actualizar('Prueba 107 - Actualizar comentario con idUsuario null',idComentario,null,'Ayudas extraordinarias','¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!s',idNoticia,false); 
 PCK_Comentario.Actualizar('Prueba 108 - Actualizar comentario con descripcion null',idComentario,idUsuario,'Ayudas extraordinarias',null,idNoticia,false);  
 PCK_Comentario.Actualizar('Prueba 109 - Actualizar comentario con titulo null',idComentario,idUsuario,null,'¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!s',idNoticia,false);  
 PCK_Comentario.Actualizar('Prueba 110 - Actualizar comentario con idNoticia null',idComentario,idUsuario,'Ayudas extraordinarias','¡Me encanta las ayudas que esta recibiendo esta ONG, es impresionante!s',null,false); 

/**************************************************************************
              PRUEBAS DE LAS OPERACIONES SOBRE ASOCIACIONONG
**************************************************************************/ 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes AsociacionONG-----------------------------------------------------');
 PCK_AsociacionONG.Inicializar;
 PCK_AsociacionONG.Insertar('Prueba 111 - Insertar asociacionONG','PrayForChildrens',5645,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,true);
 idAsociacionONG := SEC_idAsociacionONG.currval;
 PCK_AsociacionONG.Insertar('Prueba 112 - Insertar asociacionONG con ONG null',null,5645,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 113 - Insertar asociacionONG con fondo disponible null','PrayForChildrens',null,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 114 - Insertar asociacionONG con numero de voluntarios null','PrayForChildrens',5645,null,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 115 - Insertar asociacionONG con numero de directores null','PrayForChildrens',5645,60,null,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 116 - Insertar asociacionONG con numero de directores veteranos null','PrayForChildrens',5645,60,7,null,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 117 - Insertar asociacionONG con fecha de ultima donacion null','PrayForChildrens',5645,60,7,45,null,'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 118 - Insertar asociacionONG con idDonacion null','PrayForChildrens',5645,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',null,idUsuario,false);
 PCK_AsociacionONG.Insertar('Prueba 119 - Insertar asociacionONG con idUsuario null','PrayForChildrens',5645,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,null,false);
 --Actualizar
 PCK_AsociacionONG.Actualizar('Prueba 120 - Actualizar asociacionONG con ONG null',idAsociacionONG,null,5645,60,7,45,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 121 - Actualizar asociacionONG con fondo disponible null',idAsociacionONG,'PrayForChildrens',null,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 122 - Actualizar asociacionONG con numero de voluntarios null',idAsociacionONG,'PrayForChildrens',5645,null,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 123 - Actualizar asociacionONG con numero de directores null',idAsociacionONG,'PrayForChildrens',5645,60,null,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 124 - Actualizar asociacionONG con numero de directores veteranos null',idAsociacionONG,'PrayForChildrens',5645,60,7,null,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 125 - Actualizar asociacionONG con fecha de ultima donacion null',idAsociacionONG,'PrayForChildrens',5645,60,7,4,null,'joselete45p',idDonacion,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 126 - Actualizar asociacionONG con idDonacion null',idAsociacionONG,'PrayForChildrens',5645,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',null,idUsuario,false);
 PCK_AsociacionONG.Actualizar('Prueba 126 - Actualizar asociacionONG con idUsuario null',idAsociacionONG,'PrayForChildrens',null,60,7,4,TO_DATE('18/03/2015','DD/MM/YYYY'),'joselete45p',idDonacion,null,false);
 
 /**************************************************************************
                 PRUEBAS DE ELIMINAR TABLAS
  **************************************************************************/
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Eliminación tablas-----------------------------------------------------');
  PCK_Persona.Eliminar('Prueba 127 - Eliminar persona',idPersona, true);
  PCK_Persona.Eliminar('Prueba 128 - Eliminar usuario',idUsuario, true);
  PCK_Persona.Eliminar('Prueba 129 - Eliminar material',idMaterial, true);
  PCK_Persona.Eliminar('Prueba 130 - Eliminar capital',idCapital, true);
  PCK_Persona.Eliminar('Prueba 131 - Eliminar institucion',idEmpresa, true);
  PCK_Persona.Eliminar('Prueba 132 - Eliminar anonimo',idAnonimo, true);
  PCK_Persona.Eliminar('Prueba 133 - Eliminar donacion',idDonacion, true);
  PCK_Persona.Eliminar('Prueba 134 - Eliminar campanya',idCampanya, true);
  PCK_Persona.Eliminar('Prueba 135 - Eliminar accion humanitaria',idAccionHumanitaria, true);
  PCK_Persona.Eliminar('Prueba 136 - Eliminar noticia',idNoticia, true);
  PCK_Persona.Eliminar('Prueba 137 - Eliminar comentario',idComentario, true);
  PCK_Persona.Eliminar('Prueba 138 - Eliminar asociacionONG',idAsociacionONG, true);
END;


