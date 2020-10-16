
--Pruebas procedimeintos
--Borrado de datos
DELETE FROM Material;
DELETE FROM Capital;
DELETE FROM Anonimo;
DELETE FROM Comentario;
DELETE FROM Noticia;
DELETE FROM Institucion;
DELETE FROM Usuario;
DELETE FROM Campanya;
DELETE FROM Persona;
DELETE FROM AsociacionONG;
DELETE FROM Donacion;


--Tabla Persona
EXECUTE insertar_persona('56895574M','Daniel','Garzón Montalbán',TO_DATE('16031992', 'DDMMYYYY'),'danal@hotmail.com','658987981','C\ Ortega Valencia');
EXECUTE insertar_persona('47588221J','Manuela','Garzón Montero',TO_DATE('10061992', 'DDMMYYYY'),'MGM92@hotmail.com','658945871','C\ Ortega Valencia');
EXECUTE insertar_persona('56895534M','Martín','González Montalbán',TO_DATE('10061982', 'DDMMYYYY'),'MartinGM00@hotmail.es','648987981','C\ Ortega Valencia');
EXECUTE insertar_persona('41234577B','Álvaro','Alonso Agenjo',TO_DATE('17061992', 'DDMMYYYY'),'alvaroaa@hotmail.es','622324920','C\ Ortega Valencia');


--Tabla Usuario
EXECUTE insertar_usuario ('DANI99', 'contrasena123', NULL,1,30,TO_DATE('08022016', 'DDMMYYYY'),NULL, 'S','S','Administrador',2);
EXECUTE insertar_usuario ('Manuela17', 'contrasena123','Salvar Africa',1,50,TO_DATE('28102012', 'DDMMYYYY'),TO_DATE('04092014', 'DDMMYYYY'), 'N','N','Voluntario',4);
EXECUTE insertar_usuario ('Juan_7Antonio', 'contrasena123','Salvar Africa,Salvar Asia',2,50,TO_DATE('03022013', 'DDMMYYYY'),TO_DATE('04092017', 'DDMMYYYY'), 'N','S','Director',6);
EXECUTE insertar_usuario ('Alvaro79', 'contrasena123', 'Salvar Africa,Recaudacion Leche,Recaudacion Gambas,Incendio Polo Norte',4,50,TO_DATE('22012016', 'DDMMYYYY'),TO_DATE('04092017', 'DDMMYYYY'),'S','S','Director Veterano',8);

--Tabla Material
EXECUTE insertar_material (80, 'comida');
EXECUTE insertar_material (20, 'Medicinas');
EXECUTE insertar_material (5, 'comida');
EXECUTE insertar_material (9, 'ordenadores');

--Tabla Capital
EXECUTE insertar_capital (100);
EXECUTE insertar_capital (50);

--Tabla Anónimo
EXECUTE insertar_anonimo ();
EXECUTE insertar_anonimo ();
EXECUTE insertar_anonimo ();


--Tabla Institucion
EXECUTE insertar_institucion ('Toldos Torrijos');
EXECUTE insertar_institucion ('Buthanos');
EXECUTE insertar_institucion ('Autocares Manolo');


--Tabla Donación
EXECUTE insertar_donacion ('monetaria', 'Africa lo es todo', 'Persona',NULL,4,2,NULL,NULL);
EXECUTE insertar_donacion ('material', 'Los niños los son todo', 'Empresa',2,NULL,NULL,NULL,2);
EXECUTE insertar_donacion ('material', 'Koksel Baba no tien la culpa', 'Anonimo',2,NULL,NULL,2,NULL);
EXECUTE insertar_donacion ('monetaria', 'Africa lo es todo', 'Persona',NULL,2,4,NULL,NULL);


--Tabla de Campanya
EXECUTE insertar_campanya('Salvemos Wakanda', TO_DATE('13031993', 'DDMMYYYY'), TO_DATE('03042003', 'DDMMYYYY'), 23500, '00548678J,98523686N,42312153L,70964804Y','45789966M',1200,2);
EXECUTE insertar_campanya('Salvemos Chile', TO_DATE('02011997', 'DDMMYYYY'), TO_DATE('14052001', 'DDMMYYYY'), 23500, '00548678J,98523686N,42312153L,70964804Y','45789966M',7000,4);
EXECUTE insertar_campanya('Terremoto de Haiti', TO_DATE('13112000', 'DDMMYYYY'), TO_DATE('03082007', 'DDMMYYYY'), 30000, '12135544J,88995674L,44771012L,45668899M','74859612J',25000,6);
EXECUTE insertar_campanya('Terremoto de Etiopia', TO_DATE('01012006', 'DDMMYYYY'), TO_DATE('25072010', 'DDMMYYYY'), 30000, '12135544J,88995674L,44771012L,45668899M','74859612J',12000,8);


--Tabla Asociación ONG
EXECUTE insertar_asociacionONG('SOS Ayudas Sin Fronteras', 15000, 215, 45,3,TO_DATE('13062000', 'DDMMYYYY'),'jmartinez89',2,2);
EXECUTE insertar_asociacionONG('SOS Ayudas Sin Fronteras', 15000, 215, 45,6,TO_DATE('13032015', 'DDMMYYYY'),'leoJimenez09',4,4);
EXECUTE insertar_asociacionONG('Ayudas Por El Mundo', 23500, 420, 123,8,TO_DATE('13032018', 'DDMMYYYY'),'hhJKevin2',6,6);
EXECUTE insertar_asociacionONG('AYUDA A LOS DEMÁS', 23500,420, 123,50,TO_DATE('12031997', 'DDMMYYYY'),'MaríaQ_N',8,8);


--Tabla AccionHumanitaria
EXECUTE insertar_accionHumanitaria ('Haiti','Agua a Haiti','Proyecto dedicado a llenar los pozos de Haiti',TO_DATE('08022014', 'ddMMYYYY'),NULL,6);
EXECUTE insertar_accionHumanitaria ('Haiti','Colegios Haiti','Proyecto dedicado a reconstruir colegios de Haiti',TO_DATE('08022014', 'ddMMYYYY'),NULL,6);
EXECUTE insertar_accionHumanitaria ('Chile','Agua a Chile','Proyecto dedicado a llenar los pozos de Chile',TO_DATE('08022014', 'ddMMYYYY'),NULL,4);
EXECUTE insertar_accionHumanitaria ('Wakanda','Colegios Wakanda','Proyecto dedicado a reconstruir colegios de Wakanda',TO_DATE('08022014', 'ddMMYYYY'),NULL,2);


--Tabla Noticia
EXECUTE insertar_noticia ('www.hielospingu.es', 'Nueva campaña', 'se ha creado una nueva campaña en Africa',2);
EXECUTE insertar_noticia ('www.chilesos.com', 'Satisfaccion', 'Se ha llegado a la presupuesto esperado en una campaña',6);
EXECUTE insertar_noticia ('www.painawbe.com', 'Informacion', 'se ha mejorado la pagina principal de la pagina web',8);
EXECUTE insertar_noticia ('http://www.youtube.com', 'Aportacion', 'un famoso youtube nos ayuda hablando por su canal',4);


--Tabla Comentario
EXECUTE insertar_comentario (2, 'Molestia', 'La pagina web no me carga las campañas correctamente', 2);
EXECUTE insertar_comentario (4, 'Satisfaccion', 'Me gustan las acciones humanas que se realizan en esta ONG', 4);
EXECUTE insertar_comentario (6, 'Informacion', 'Me gustaria objtener mas informacion de como poder colaborar con una campaña', 6);
EXECUTE insertar_comentario (8, 'Aportacion', 'Podria ayudar por la causa hablando de ella en mi canal de youtube', 8);


