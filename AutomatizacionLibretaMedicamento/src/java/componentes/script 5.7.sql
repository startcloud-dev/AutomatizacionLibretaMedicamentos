-- Generado por Oracle SQL Developer Data Modeler 3.1.0.700
--   en:        2017-04-21 15:22:24 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE Atencion 
    ( 
     Hora_Atencion VARCHAR2 (30)  NOT NULL , 
     Fecha_Atencion DATE 
    ) 
;



ALTER TABLE Atencion 
    ADD CONSTRAINT "Atecion PK" PRIMARY KEY ( Hora_Atencion ) ;



CREATE TABLE Baja_Medicamento 
    ( 
     Codigo INTEGER  NOT NULL , 
     Nombre VARCHAR2 (30) , 
     Tipo VARCHAR2 (30) , 
     Fabricante VARCHAR2 (30) , 
     Componentes VARCHAR2 (30) , 
     Contenido VARCHAR2 (30) , 
     Cantidad VARCHAR2 (30) , 
     Gramaje VARCHAR2 (30) , 
     Fecha_Vencimiento DATE , 
     Id_seccion INTEGER  NOT NULL , 
     Justificacion VARCHAR2 (100) 
    ) 
;



ALTER TABLE Baja_Medicamento 
    ADD CONSTRAINT "Baja_Medicamento PK" PRIMARY KEY ( Codigo ) ;



CREATE TABLE Bodega 
    ( 
     Id_seccion INTEGER  NOT NULL , 
     Categoria VARCHAR2 (15) 
    ) 
;



ALTER TABLE Bodega 
    ADD CONSTRAINT "Bodega PK" PRIMARY KEY ( Id_seccion ) ;



CREATE TABLE Consulta 
    ( 
     Rut_Doctor VARCHAR2 (15)  NOT NULL , 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Id_receta INTEGER  NOT NULL , 
     Hora_Atencion VARCHAR2 (30)  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Consulta__IDX ON Consulta 
    ( 
     Hora_Atencion ASC 
    ) 
;


CREATE TABLE Doctor 
    ( 
     Rut_Doctor VARCHAR2 (15)  NOT NULL , 
     Nombre VARCHAR2 (30) , 
     Direccion VARCHAR2 (30) , 
     Telefono VARCHAR2 (15) , 
     Especialidad VARCHAR2 (30) , 
     Password VARCHAR2 (15) 
    ) 
;



ALTER TABLE Doctor 
    ADD CONSTRAINT "Doctor PK" PRIMARY KEY ( Rut_Doctor ) ;



CREATE TABLE Farmaceutico 
    ( 
     Rut_Farmaceutico VARCHAR2 (15)  NOT NULL , 
     Nombre VARCHAR2 (15) , 
     Direccion VARCHAR2 (30) , 
     Telefono INTEGER , 
     Id_seccion INTEGER  NOT NULL , 
     Password VARCHAR2 (15) , 
     id_reserva INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Farmaceutico__IDX ON Farmaceutico 
    ( 
     id_reserva ASC 
    ) 
;

ALTER TABLE Farmaceutico 
    ADD CONSTRAINT "Farmaceutico PK" PRIMARY KEY ( Rut_Farmaceutico ) ;



CREATE TABLE Medicamento 
    ( 
     Codigo INTEGER  NOT NULL , 
     Nombre VARCHAR2 (30) , 
     Tipo VARCHAR2 (30) , 
     Fabricante VARCHAR2 (30) , 
     Componentes VARCHAR2 (30) , 
     Contenido VARCHAR2 (30) , 
     Cantidad VARCHAR2 (30) , 
     Gramaje VARCHAR2 (30) , 
     Fecha_Vencimiento DATE , 
     Id_seccion INTEGER  NOT NULL , 
     id_reserva INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Medicamento__IDX ON Medicamento 
    ( 
     id_reserva ASC 
    ) 
;

ALTER TABLE Medicamento 
    ADD CONSTRAINT "Medicamento PK" PRIMARY KEY ( Codigo ) ;



CREATE TABLE Paciente 
    ( 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Nombre VARCHAR2 (15) , 
     Apellido_Paterno VARCHAR2 (20) , 
     Apellido_Materno VARCHAR2 (20) , 
     Direccion VARCHAR2 (30) , 
     Telefono VARCHAR2 (10) , 
     Correo VARCHAR2 (30) , 
     Fecha_Nacimiento DATE , 
     id_reserva INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Paciente__IDX ON Paciente 
    ( 
     id_reserva ASC 
    ) 
;

ALTER TABLE Paciente 
    ADD CONSTRAINT "Paciente PK" PRIMARY KEY ( Rut_Paciente ) ;



CREATE TABLE Realiza 
    ( 
     Doctor_Rut_Doctor VARCHAR2 (15)  NOT NULL , 
     Tratamiento_Id_Tratamiento INTEGER  NOT NULL 
    ) 
;



ALTER TABLE Realiza 
    ADD CONSTRAINT Realiza__IDX PRIMARY KEY ( Doctor_Rut_Doctor, Tratamiento_Id_Tratamiento ) ;



CREATE TABLE Receta 
    ( 
     Id_receta INTEGER  NOT NULL , 
     Fecha_Emision DATE , 
     Indicaciones VARCHAR2 (1000) 
    ) 
;



ALTER TABLE Receta 
    ADD CONSTRAINT "Receta PK" PRIMARY KEY ( Id_receta ) ;



CREATE TABLE Reserva 
    ( 
     id_reserva INTEGER  NOT NULL , 
     Fecha_inicio DATE , 
     Fecha_termino DATE , 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Id_Tratamiento INTEGER  NOT NULL , 
     Rut_Farmaceutico VARCHAR2 (15)  NOT NULL , 
     Estado VARCHAR2 (10) NOT NULL, 
     Codigo INTEGER  NOT NULL 
    ) 
;


ALTER TABLE Reserva 
    ADD CONSTRAINT "Recerva PK" PRIMARY KEY ( id_reserva ) ;



CREATE TABLE Tiene 
    ( 
     Medicamento_Codigo INTEGER  NOT NULL , 
     Receta_Id_receta INTEGER  NOT NULL 
    ) 
;



ALTER TABLE Tiene 
    ADD CONSTRAINT Tiene__IDX PRIMARY KEY ( Medicamento_Codigo, Receta_Id_receta ) ;



CREATE TABLE Tratamiento 
    ( 
     Id_Tratamiento INTEGER  NOT NULL , 
     Duracion VARCHAR2 (20) , 
     id_reserva INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Tratamiento__IDX ON Tratamiento 
    ( 
     id_reserva ASC 
    ) 
;

ALTER TABLE Tratamiento 
    ADD CONSTRAINT "Tratamiento PK" PRIMARY KEY ( Id_Tratamiento ) ;




ALTER TABLE Medicamento 
    ADD CONSTRAINT Adquiere FOREIGN KEY 
    ( 
     Id_seccion
    ) 
    REFERENCES Bodega 
    ( 
     Id_seccion
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Consulta 
    ADD CONSTRAINT Asiste FOREIGN KEY 
    ( 
     Rut_Paciente
    ) 
    REFERENCES Paciente 
    ( 
     Rut_Paciente
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Consulta 
    ADD CONSTRAINT Asocia FOREIGN KEY 
    ( 
     Rut_Doctor
    ) 
    REFERENCES Doctor 
    ( 
     Rut_Doctor
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Consulta 
    ADD CONSTRAINT Debe FOREIGN KEY 
    ( 
     Hora_Atencion
    ) 
    REFERENCES Atencion 
    ( 
     Hora_Atencion
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Realiza 
    ADD CONSTRAINT FK_ASS_10 FOREIGN KEY 
    ( 
     Doctor_Rut_Doctor
    ) 
    REFERENCES Doctor 
    ( 
     Rut_Doctor
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Realiza 
    ADD CONSTRAINT FK_ASS_11 FOREIGN KEY 
    ( 
     Tratamiento_Id_Tratamiento
    ) 
    REFERENCES Tratamiento 
    ( 
     Id_Tratamiento
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Tiene 
    ADD CONSTRAINT FK_ASS_17 FOREIGN KEY 
    ( 
     Medicamento_Codigo
    ) 
    REFERENCES Medicamento 
    ( 
     Codigo
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Tiene 
    ADD CONSTRAINT FK_ASS_18 FOREIGN KEY 
    ( 
     Receta_Id_receta
    ) 
    REFERENCES Receta 
    ( 
     Id_receta
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Reserva 
    ADD CONSTRAINT Necesita FOREIGN KEY 
    ( 
     Codigo
    ) 
    REFERENCES Medicamento 
    ( 
     Codigo
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Medicamento 
    ADD CONSTRAINT Necesita FOREIGN KEY 
    ( 
     id_reserva
    ) 
    REFERENCES Reserva 
    ( 
     id_reserva
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Reserva 
    ADD CONSTRAINT Ofrece FOREIGN KEY 
    ( 
     Rut_Farmaceutico
    ) 
    REFERENCES Farmaceutico 
    ( 
     Rut_Farmaceutico
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Farmaceutico 
    ADD CONSTRAINT Ofrece FOREIGN KEY 
    ( 
     id_reserva
    ) 
    REFERENCES Reserva 
    ( 
     id_reserva
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Consulta 
    ADD CONSTRAINT Posee FOREIGN KEY 
    ( 
     Id_receta
    ) 
    REFERENCES Receta 
    ( 
     Id_receta
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Tratamiento 
    ADD CONSTRAINT Requiere FOREIGN KEY 
    ( 
     id_reserva
    ) 
    REFERENCES Reserva 
    ( 
     id_reserva
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Reserva 
    ADD CONSTRAINT Requiere FOREIGN KEY 
    ( 
     Id_Tratamiento
    ) 
    REFERENCES Tratamiento 
    ( 
     Id_Tratamiento
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Reserva 
    ADD CONSTRAINT Solicita FOREIGN KEY 
    ( 
     Rut_Paciente
    ) 
    REFERENCES Paciente 
    ( 
     Rut_Paciente
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Paciente 
    ADD CONSTRAINT Solicita FOREIGN KEY 
    ( 
     id_reserva
    ) 
    REFERENCES Reserva 
    ( 
     id_reserva
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Farmaceutico 
    ADD CONSTRAINT Suministra FOREIGN KEY 
    ( 
     Id_seccion
    ) 
    REFERENCES Bodega 
    ( 
     Id_seccion
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Baja_Medicamento 
    ADD CONSTRAINT Vuelve FOREIGN KEY 
    ( 
     Id_seccion
    ) 
    REFERENCES Bodega 
    ( 
     Id_seccion
    ) 
    ON DELETE CASCADE 
;

----------------------------------------------------------------------------


INSERT INTO Bodega VALUES (1,'Pastilla');
INSERT INTO Bodega VALUES (2,'Jarabe');
INSERT INTO Bodega VALUES (3,'Otros');

INSERT INTO Farmaceutico VALUES ('12.153.864-5','Max Arcos','Manquehue 4576',7726410,1,'Thefarma',1);
INSERT INTO Farmaceutico VALUES ('9.374.097-k','Rodrigo Ramirez','Recoleta 5460',78532257,2,'pas123',2);
INSERT INTO Farmaceutico VALUES ('22.165.836-3','Mario Benedetti','Carrascal 2489',9577893,3,'baiabaia',3);

INSERT INTO Medicamento VALUES (1,'Hipertencion','pastillas','Laboratorio Chile','muchas cosas','80mg','30','80','10-10-2018',1,1);
INSERT INTO Medicamento VALUES (2,'kralflex','pastillas','Laboratorio Chile','muchas cosas','40mg','10','40','08-06-2017',1,2);
INSERT INTO Medicamento VALUES (3,'Paracetamol','pastillas','Laboratorio Chile','muchas cosas','60mg','20','60','12-08-2017',1,3);

INSERT INTO Receta VALUES (1,'01-15-2017','3 semanas');
INSERT INTO Receta VALUES (2,'01-23-2017','1 semana');
INSERT INTO Receta VALUES (3,'02-05-2017','3 dias');

INSERT INTO Atencion VALUES ('12:30:00','01-01-2017');
INSERT INTO Atencion VALUES ('13:00:00','01-14-2017');
INSERT INTO Atencion VALUES ('13:30:00','01-31-2017');

INSERT INTO reserva VALUES (1,'04-20-2017','04-25-2017','19.112.792-7',1,'12.153.864-5','En curso',1);
INSERT INTO reserva VALUES (2,'04-20-2017','04-25-2017','1.987.654-2',2,'9.374.097-k','En curso',2);
INSERT INTO reserva VALUES (3,'04-20-2017','04-25-2017','15.537.193-k',3,'22.165.836-3','En curso',3);

INSERT INTO Tratamiento VALUES ('1','1 Semana',1);
INSERT INTO Tratamiento VALUES ('2','3 Semanas',2);
INSERT INTO Tratamiento VALUES ('3','3 Dias',3);

INSERT INTO Doctor VALUES ('6.517.936-5','Roberto Gomez','Vitacura 2465','6574596','Traumatologia','Robertitox65');
INSERT INTO Doctor VALUES ('5.163.947-9','Miguel Herrera','Lobos Tranquilos 9754','2136793','Cardiologia','12345');
INSERT INTO Doctor VALUES ('11.164.197-3','Marco Landaeta','Nueva Independencia 9353','9873246','Medicina General','holapapu');

INSERT INTO realiza VALUES('6.517.936-5',1);
INSERT INTO realiza VALUES('5.163.947-9',2);
INSERT INTO realiza VALUES('11.164.197-3',3);

INSERT INTO Paciente VALUES ('19.112.792-7','Lucas','Romero','Gonzalez','psje Radon 2345','96358176','k.arnaiz@alumnos.duoc.cl','05-30-1989',1);
INSERT INTO Paciente VALUES ('1.987.654-2','Marcelo','Martinez','Mendez','Pedro Prado 5678','9035241','marceloM98@gmail.com','07-13-1998',2);
INSERT INTO Paciente VALUES ('15.537.193-k','Felipe','Miranda','Moya','Mistral 6543','5647862','feliMM92@gmail.com','10-10-1992',3);

INSERT INTO tiene VALUES (1,1);
INSERT INTO tiene VALUES (2,2);
INSERT INTO tiene VALUES (3,3);

INSERT INTO Consulta VALUES ('6.517.936-5','19.112.792-7',1,'12:30:00');
INSERT INTO Consulta VALUES ('5.163.947-9','1.987.654-2',2,'13:00:00');
INSERT INTO Consulta VALUES ('11.164.197-3','15.537.193-k',3,'13:30:00');

CREATE SEQUENCE cod_reserva
INCREMENT BY 1
START WITH 4
MAXVALUE 999
MINVALUE 1;


SELECT MEDICAMENTO.Nombre , TRATAMIENTO.Duracion ,DOCTOR.Nombre , PACIENTE.nombre  
FROM  MEDICAMENTO , RESERVA, TRATAMIENTO, REALIZA, DOCTOR , CONSULTA , PACIENTE
INNER JOIN  RESERVA USING (ID_RESERVA) 
INNER JOIN TRATAMIENTO USING (ID_RESERVA) 
INNER JOIN REALIZA USING(TRATAMIENTO_ID_TRATAMIENTO) 
INNER JOIN  DOCTOR USING (DOCTOR_RUT_DOCTOR)
INNER JOIN CONSULTA USING(RUT_PACIENTE) 
INNER JOIN PACIENTE USING (RUT_PACIENTE);


---trigger para baja_medicamento


  CREATE OR REPLACE TRIGGER TBajaMedicamento
  AFTER DELETE ON Medicamento
  
  FOR EACH ROW
  BEGIN
  IF DELETING THEN
  
  INSERT INTO BAJA_MEDICAMENTO(Codigo,Nombre
  ,Tipo,Fabricante,Componentes,Contenido
  ,Cantidad,Gramaje,Fecha_Vencimiento,Id_seccion) VALUES (:old.Codigo,:old.Nombre,
                                       :old.Tipo,:old.Fabricante,
                                       :old.Componentes,:old.Contenido,
                                       :old.Cantidad ,:old.Gramaje , 
                                       :old.Fecha_Vencimiento,:old.Id_seccion);
  END IF;
  END;


-- procedimiento almacenado


  --Ingreso de justificacion

CREATE OR REPLACE PROCEDURE INGRESAR_JUSTIFICACION 
(
  JUSTI IN VARCHAR2 ,
  COD IN INTEGER 
) AS 
BEGIN
 
 UPDATE BAJA_MEDICAMENTO
 SET JUSTIFICACION = JUSTI
 WHERE Codigo = COD;
  
END INGRESAR_JUSTIFICACION;



// Codigo Nombre Gramaje Lab Cantidad  