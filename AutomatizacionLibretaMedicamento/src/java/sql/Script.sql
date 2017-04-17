-- Generado por Oracle SQL Developer Data Modeler 3.1.0.700
--   en:        2017-03-31 22:49:08 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g

CREATE TABLE Atencion 
    ( 
     Hora_Atencion VARCHAR2 (30)  NOT NULL , 
     Fecha_Atencion DATE NOT NULL
    ) 
;

ALTER TABLE Atencion 
    ADD CONSTRAINT "Atencion PK" PRIMARY KEY ( Hora_Atencion ) ;

CREATE TABLE Bodega 
    ( 
     Id_seccion INTEGER  NOT NULL , 
     Categoria VARCHAR2 (15) NOT NULL
    ) 
;

ALTER TABLE Bodega 
    ADD CONSTRAINT "Bodega PK" PRIMARY KEY ( Id_seccion ) ;

CREATE TABLE Consulta 
    ( 
     Hora_Atencion VARCHAR (30)  NOT NULL , 
     Rut_Doctor VARCHAR2 (15)  NOT NULL , 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Id_receta INTEGER  NOT NULL 
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
     Nombre VARCHAR2 (30) NOT NULL , 
     Direccion VARCHAR2 (30) NOT NULL , 
     Telefono INTEGER  NOT NULL , 
     Especialidad VARCHAR2 (30) NOT NULL ,
	 Password VARCHAR2 (15) NOT NULL
    ) 
;



ALTER TABLE Doctor 
    ADD CONSTRAINT "Doctor PK" PRIMARY KEY ( Rut_Doctor ) ;

CREATE TABLE Farmaceutico 
    ( 
     Rut_Farmaceutico VARCHAR2 (15)  NOT NULL , 
     Nombre VARCHAR2 (30) NOT NULL , 
     Direccion VARCHAR2 (30) NOT NULL , 
     Telefono INTEGER  NOT NULL , 
     Id_seccion INTEGER  NOT NULL ,
	 Password VARCHAR2 (15) NOT NULL
    ) 
;

ALTER TABLE Farmaceutico 
    ADD CONSTRAINT "Farmaceutico PK" PRIMARY KEY ( Rut_Farmaceutico ) ;

CREATE TABLE Medicamento 
    ( 
     Codigo INTEGER  NOT NULL , 
     Nombre VARCHAR2 (30) NOT NULL , 
     Tipo VARCHAR2 (30) NOT NULL , 
     Fabricante VARCHAR2 (30) NOT NULL , 
     Componentes VARCHAR2 (30) NOT NULL , 
     Contenido VARCHAR2 (30) NOT NULL , 
     Cantidad VARCHAR2(30)  NOT NULL , 
     Gramaje VARCHAR2(30)  NOT NULL , 
     Fecha_Vencimiento DATE  NOT NULL, 
     Id_seccion INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Medicamento 
    ADD CONSTRAINT "Medicamento PK" PRIMARY KEY ( Codigo ) ;

CREATE TABLE Paciente 
    ( 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Nombre VARCHAR2 (15) NOT NULL , 
     Apellido_Paterno VARCHAR2 (20) NOT NULL , 
     Apellido_Materno VARCHAR2 (20) NOT NULL , 
     Direccion VARCHAR2 (30) NOT NULL , 
     Telefono VARCHAR2 (10) NOT NULL , 
     Correo VARCHAR2 (30) NOT NULL , 
     Fecha_Nacimiento DATE NOT NULL
    ) 
;


CREATE TABLE Baja_medicamento
  (
    Codigo            INTEGER NOT NULL ,
    Nombre            VARCHAR2(30) NOT NULL ,
    Tipo              VARCHAR2(30)NOT NULL,
    Fabricante        VARCHAR2(30) NOT NULL,
    Componentes       VARCHAR2(30) NOT NULL ,
    Contenido         VARCHAR2(30) NOT NULL ,
    Cantidad          VARCHAR2(30)NOT NULL,
    Gramaje           VARCHAR2(30) NOT NULL ,
    Fecha_Vencimiento DATE NOT NULL,
    Id_seccion        INTEGER NOT NULL 
  );
  



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
     Fecha_Emision DATE NOT NULL , 
     Indicaciones VARCHAR2 (30) NOT NULL
    ) 
;

ALTER TABLE Receta 
    ADD CONSTRAINT "Receta PK" PRIMARY KEY ( Id_receta ) ;

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
     Duracion VARCHAR2 (20) NOT NULL
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


ALTER TABLE Tiene 
    ADD CONSTRAINT FK_ASS_10 FOREIGN KEY 
    ( 
     Receta_Id_receta
    ) 
    REFERENCES Receta 
    ( 
     Id_receta
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Realiza 
    ADD CONSTRAINT FK_ASS_6 FOREIGN KEY 
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
    ADD CONSTRAINT FK_ASS_7 FOREIGN KEY 
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
    ADD CONSTRAINT FK_ASS_9 FOREIGN KEY 
    ( 
     Medicamento_Codigo
    ) 
    REFERENCES Medicamento 
    ( 
     Codigo
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

----------------------Script--------------------------

INSERT INTO Bodega VALUES (1,'Pastilla');
INSERT INTO Bodega VALUES (2,'Jarabe');
INSERT INTO Bodega VALUES (3,'Otros');

INSERT INTO Farmaceutico VALUES ('12.153.864-5','Max Arcos','Manquehue 4576',7726410,1,'Thefarma');
INSERT INTO Farmaceutico VALUES ('9.374.097-k','Rodrigo Ramirez','Recoleta 5460',78532257,2,'pas123');
INSERT INTO Farmaceutico VALUES ('22.165.836-3','Mario Benedetti','Carrascal 2489',9577893,3,'baiabaia');

INSERT INTO Medicamento VALUES (1,'Hipertencion','pastillas','Laboratorio Chile','muchas cosas','80mg','30','80','10-10-2018','En bodega',1);
INSERT INTO Medicamento VALUES (2,'kralflex','pastillas','Laboratorio Chile','muchas cosas','40mg','10','40','08-06-2017','En reserva',1);
INSERT INTO Medicamento VALUES (3,'Paracetamol','pastillas','Laboratorio Chile','muchas cosas','60mg','20','60','12-08-2017','Sin stock',1);

INSERT INTO Receta VALUES (1,'01-15-2017','3 semanas');
INSERT INTO Receta VALUES (2,'01-23-2017','1 semana');
INSERT INTO Receta VALUES (3,'02-05-2017','3 dias');

INSERT INTO Atencion VALUES ('12:30:00','01-01-2017');
INSERT INTO Atencion VALUES ('13:00:00','01-14-2017');
INSERT INTO Atencion VALUES ('13:30:00','01-31-2017');

INSERT INTO Tratamiento VALUES ('1','1 Semana');
INSERT INTO Tratamiento VALUES ('2','3 Semanas');
INSERT INTO Tratamiento VALUES ('3','3 Dias');

INSERT INTO Doctor VALUES ('6.517.936-5','Roberto Gomez','Vitacura 2465','6574596','Traumatologia','Robertitox65');
INSERT INTO Doctor VALUES ('5.163.947-9','Miguel Herrera','Lobos Tranquilos 9754','2136793','Cardiologia','12345');
INSERT INTO Doctor VALUES ('11.164.197-3','Marco Landaeta','Nueva Independencia 9353','9873246','Medicina General','holapapu');

INSERT INTO realiza VALUES('6.517.936-5',1);
INSERT INTO realiza VALUES('5.163.947-9',2);
INSERT INTO realiza VALUES('11.164.197-3',3);

INSERT INTO Paciente VALUES ('10.123.456-k','Lucas','Romero','Gonzalez','psje Radon 2345','6549871','Lucas87@gmail.com','05-30-1989');
INSERT INTO Paciente VALUES ('1.987.654-2','Marcelo','Martinez','Mendez','Pedro Prado 5678','9035241','marceloM98@gmail.com','07-13-1998');
INSERT INTO Paciente VALUES ('15.537.193-k','Felipe','Miranda','Moya','Mistral 6543','5647862','feliMM92@gmail.com','10-10-1992');

INSERT INTO tiene VALUES (1,1);
INSERT INTO tiene VALUES (2,2);
INSERT INTO tiene VALUES (3,3);

INSERT INTO Consulta VALUES ('12:30:00','6.517.936-5','10.123.456-k',1);
INSERT INTO Consulta VALUES ('13:00:00','5.163.947-9','1.987.654-2',2);
INSERT INTO Consulta VALUES ('13:30:00','11.164.197-3','15.537.193-k',3);
