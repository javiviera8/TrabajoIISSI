--TRIGGERS:
-- TRIGGER email_persona
CREATE OR REPLACE TRIGGER email_persona
AFTER INSERT OR UPDATE OF Email ON Persona
FOR EACH ROW
BEGIN
if (:NEW.Email not like '%@%.%' ) 
then raise_application_error(-20001,'El email debe contener @ y .');
end if;
end;
/

-- TRIGGER fecha_nacimiento
CREATE OR REPLACE TRIGGER fecha_nacimiento
AFTER INSERT OR UPDATE OF FechNacimiento ON Persona
FOR EACH ROW
BEGIN
if (:NEW.FechNacimiento >= SYSDATE)
then raise_application_error(-20001,'La fecha de nacimiento no puede ser mayor que la fecha actual.');
end if;
end;
/

--TRIGGER fechas_campanyas
CREATE OR REPLACE TRIGGER fechas_campanyas
AFTER INSERT OR UPDATE OF FechInicio ON Campanya
FOR EACH ROW
DECLARE
        v_FechInicio DATE := :OLD.FechInicio;
        v_FechFin DATE:= :NEW.FechFin;
BEGIN
if (v_FechInicio > v_FechFin)
then raise_application_error(-20001,'La fecha de inicio de la campaña no puede ser mayor que la fecha de fin de esta.');
end if;
end;
/

-- TRIGGER voluntario_antes_director
CREATE OR REPLACE TRIGGER voluntario_antes_director
AFTER INSERT OR UPDATE OF Cargo ON Usuario
FOR EACH ROW
DECLARE
        v_NumCampanyas NUMBER := :OLD.NumCampanyas;
        v_Cargo VARCHAR2(20) := :NEW.Cargo;
BEGIN
    if (v_NumCampanyas <2)
    then raise_application_error(-20001, 'Para ser director, se debe haber participado en 2 o mas campañas.');
end if;
end;
/

-- TRIGGER donacion_capital
CREATE OR REPLACE TRIGGER donacion_capital
AFTER INSERT OR UPDATE OF Cantidad ON Capital
FOR EACH ROW
BEGIN 
    if (:NEW.Cantidad<=0)
    then raise_application_error(-2001, 'La cantidad minima de donaci?ebe superar los 0 euros.');
end if;
end;
/ 

-- TRIGGER donacion_material
CREATE OR REPLACE TRIGGER donacion_material
AFTER INSERT OR UPDATE OF Cantidad ON Material
FOR EACH ROW
BEGIN 
    if (:NEW.Cantidad<=0)
    then raise_application_error(-2001, 'La cantidad minima de donaci?ebe superar los 0 kgs de materiales.');
end if;
end;
/

-- TRIGGER donacion_voluntario
CREATE OR REPLACE TRIGGER donacion_voluntario
AFTER INSERT OR UPDATE OF DonacionAnyo ON Usuario
FOR EACH ROW
BEGIN 
    if (:NEW.DonacionAnyo<25)
    then raise_application_error(-2001, 'La donación minima para ser voluntario debe superar los 25 euros anuales.');
end if;
end;
/ 

