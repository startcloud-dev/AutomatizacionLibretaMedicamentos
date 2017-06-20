
---Sequence y trigger de bodega 
 
CREATE SEQUENCE bode_seq START WITH 4;

CREATE TRIGGER bode_bir 
BEFORE INSERT ON bodega 
FOR EACH ROW

BEGIN
  SELECT bode_seq.NEXTVAL
  INTO   :new.id_seccion
  FROM   dual;
END;


--Sequence Y trigger de Medicamento


CREATE SEQUENCE medi_seq START WITH 4;

CREATE TRIGGER medi_bir 
BEFORE INSERT ON medicamento
FOR EACH ROW

BEGIN
  SELECT medi_seq.NEXTVAL
  INTO   :new.codigo
  FROM   dual;
END;



-------SEQUENCE Y trigger de  reserva



CREATE SEQUENCE rese_seq START WITH 4;

CREATE TRIGGER rese_bir 
BEFORE INSERT ON reserva
FOR EACH ROW

BEGIN
  SELECT rese_seq.NEXTVAL
  INTO   :new.id_reserva
  FROM   dual;
END;



-------SEQUENCE y trigger de  receta 


CREATE SEQUENCE rece_seq START WITH 4;

CREATE TRIGGER rece_bir 
BEFORE INSERT ON receta
FOR EACH ROW

BEGIN
  SELECT rece_seq.NEXTVAL
  INTO   :new.id_receta
  FROM   dual;
END;


-------SEQUENCE y trigger de tratamiento


CREATE SEQUENCE trata_seq START WITH 4;

CREATE TRIGGER trata_bir 
BEFORE INSERT ON tratamiento
FOR EACH ROW

BEGIN
  SELECT trata_seq.NEXTVAL
  INTO   :new.id_tratamiento
  FROM   dual;
END;




---------trigger de baja de medicamento



create or replace TRIGGER TBajaMedicamento
  AFTER DELETE ON Medicamento
  FOR EACH ROW
  BEGIN
  IF DELETING THEN
  INSERT INTO BAJA_MEDICAMENTO(Codigo,Nombre
  ,Tipo,Fabricante,Componentes,Contenido
  ,Cantidad,Gramaje,Fecha_Vencimiento,Id_seccion,ID_RESERVA) VALUES (:old.Codigo,:old.Nombre,
                                       :old.Tipo,:old.Fabricante,
                                       :old.Componentes,:old.Contenido,
                                       :old.Cantidad ,:old.Gramaje , 
                                       :old.Fecha_Vencimiento,:old.Id_seccion,:old.Id_reserva);
			END IF;
  END;

  
 -------------Procedimiento de ingresar justificacion  
 
 
 CREATE PROCEDURE INGRESAR_JUSTIFICACION 
(
  JUSTI IN VARCHAR2 ,
  COD IN INTEGER 
) AS 
BEGIN
 
 UPDATE BAJA_MEDICAMENTO
 SET JUSTIFICACION = JUSTI
 WHERE Codigo = COD;
  
END INGRESAR_JUSTIFICACION;