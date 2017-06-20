----------------------SCRIPT --------------------------

CREATE TABLE Atencion 
    ( 
     Hora_Atencion VARCHAR2 (30)  NOT NULL , 
     Fecha_Atencion DATE 
    ) 
;

ALTER TABLE Atencion 
    ADD CONSTRAINT "Atencion PK" PRIMARY KEY ( Hora_Atencion ) ;
	
INSERT INTO Atencion VALUES ('12:30:00','01-01-2017');
INSERT INTO Atencion VALUES ('13:00:00','01-14-2017');
INSERT INTO Atencion VALUES ('13:30:00','01-31-2017');	
	
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

INSERT INTO Bodega VALUES (1,'Pastilla');
INSERT INTO Bodega VALUES (2,'Jarabe');
INSERT INTO Bodega VALUES (3,'Otros');



CREATE TABLE Consulta 
    ( 
     Rut_Doctor VARCHAR2 (15)  NOT NULL , 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Id_receta INTEGER  NOT NULL , 
     Hora_Atencion VARCHAR2 (30)  NOT NULL 
    ) 
;

INSERT INTO Consulta VALUES ('6.517.936-5','19.112.792-7',1,'12:30:00');
INSERT INTO Consulta VALUES ('5.163.947-9','1.987.654-2',2,'13:00:00');
INSERT INTO Consulta VALUES ('11.164.197-3','15.537.193-k',3,'13:30:00');

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
	
INSERT INTO Doctor VALUES ('6.517.936-5','Roberto Gomez','Vitacura 2465','6574596','Traumatologia','Robertitox65');
INSERT INTO Doctor VALUES ('5.163.947-9','Miguel Herrera','Lobos Tranquilos 9754','2136793','Cardiologia','12345');
INSERT INTO Doctor VALUES ('11.164.197-3','Marco Landaeta','Nueva Independencia 9353','9873246','Medicina General','holapapu');


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

ALTER TABLE Farmaceutico 
    ADD CONSTRAINT "Farmaceutico PK" PRIMARY KEY ( Rut_Farmaceutico ) ;
	
INSERT INTO Farmaceutico VALUES ('12.153.864-5','Max Arcos','Manquehue 4576',7726410,1,'Thefarma',1);
INSERT INTO Farmaceutico VALUES ('9.374.097-k','Rodrigo Ramirez','Recoleta 5460',78532257,2,'pas123',2);
INSERT INTO Farmaceutico VALUES ('22.165.836-3','Mario Benedetti','Carrascal 2489',9577893,3,'baiabaia',3);

CREATE TABLE Tratamiento 
    ( 
     Id_Tratamiento INTEGER  NOT NULL , 
     Duracion VARCHAR2 (20) , 
     id_reserva INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Tratamiento 
    ADD CONSTRAINT "Tratamiento PK" PRIMARY KEY ( Id_Tratamiento ) ;
	
INSERT INTO Tratamiento VALUES ('1','1 Semana',1);
INSERT INTO Tratamiento VALUES ('2','3 Semanas',2);
INSERT INTO Tratamiento VALUES ('3','3 Dias',3);


CREATE TABLE Realiza 
    ( 
     Doctor_Rut_Doctor VARCHAR2 (15)  NOT NULL , 
     Tratamiento_Id_Tratamiento INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Realiza 
    ADD CONSTRAINT Realiza__IDX PRIMARY KEY ( Doctor_Rut_Doctor, Tratamiento_Id_Tratamiento ) ;
	
INSERT INTO realiza VALUES('6.517.936-5',1);
INSERT INTO realiza VALUES('5.163.947-9',2);
INSERT INTO realiza VALUES('11.164.197-3',3);

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

ALTER TABLE Medicamento 
    ADD CONSTRAINT "Medicamento PK" PRIMARY KEY ( Codigo ) ;
	
INSERT INTO Medicamento VALUES (1,'Hipertencion','pastillas','Laboratorio Chile','muchas cosas','80mg','30','80','10-10-2018',1,1);
INSERT INTO Medicamento VALUES (2,'kralflex','pastillas','Laboratorio Chile','muchas cosas','40mg','10','40','08-06-2017',1,2);
INSERT INTO Medicamento VALUES (3,'Paracetamol','pastillas','Laboratorio Chile','muchas cosas','60mg','20','60','12-08-2017',1,3);


CREATE TABLE Reserva 
    ( 
     id_reserva INTEGER  NOT NULL , 
     Fecha_inicio DATE , 
     Fecha_termino DATE , 
     Rut_Paciente VARCHAR2 (15)  NOT NULL , 
     Id_Tratamiento INTEGER  NOT NULL , 
     Rut_Farmaceutico VARCHAR2 (15)  NOT NULL , 
     Estado VARCHAR2 (10) , 
     Codigo INTEGER  NOT NULL ,
     Cantidad INTEGER NOT NULL
    ) 
;

ALTER TABLE Reserva 
    ADD CONSTRAINT "Reserva PK" PRIMARY KEY ( id_reserva ) ;
	
INSERT INTO reserva VALUES (1,'04-20-2017','04-25-2017','19.112.792-7',1,'12.153.864-5','En curso',1,10);
INSERT INTO reserva VALUES (2,'04-20-2017','04-25-2017','1.987.654-2',2,'9.374.097-k','En curso',2,5);
INSERT INTO reserva VALUES (3,'04-20-2017','04-25-2017','15.537.193-k',3,'22.165.836-3','En curso',3,3);


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

ALTER TABLE Paciente 
    ADD CONSTRAINT "Paciente PK" PRIMARY KEY ( Rut_Paciente ) ;
	
INSERT INTO Paciente VALUES ('19.112.792-7','Lucas','Romero','Gonzalez','psje Radon 2345','96358176','k.arnaiz@alumnos.duoc.cl','05-30-1989',1);
INSERT INTO Paciente VALUES ('1.987.654-2','Marcelo','Martinez','Mendez','Pedro Prado 5678','9035241','marceloM98@gmail.com','07-13-1998',2);
INSERT INTO Paciente VALUES ('15.537.193-k','Felipe','Miranda','Moya','Mistral 6543','5647862','feliMM92@gmail.com','10-10-1992',3);

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

CREATE TABLE Receta 
    ( 
     Id_receta INTEGER  NOT NULL , 
     Fecha_Emision DATE , 
     Indicaciones VARCHAR2 (1000) , 
     Codigo INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Receta 
    ADD CONSTRAINT "Receta PK" PRIMARY KEY ( Id_receta ) ;

INSERT INTO Receta VALUES (1,'01-15-2017','1 cada 6 hrs durante 3 dias',1);
INSERT INTO Receta VALUES (2,'01-23-2017','1 cada 8 hrs durante 1 semana',2);
INSERT INTO Receta VALUES (3,'02-05-2017','1 cada 24 hrs durante 5 dias',3);

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
    ADD CONSTRAINT Requiere FOREIGN KEY 
    ( 
     Codigo
    ) 
    REFERENCES Medicamento 
    ( 
     Codigo
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


ALTER TABLE Reserva 
    ADD CONSTRAINT Solicita FOREIGN KEY 
    ( 
     Id_Tratamiento
    ) 
    REFERENCES Tratamiento 
    ( 
     Id_Tratamiento
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

ALTER TABLE Reserva 
    ADD CONSTRAINT Pide FOREIGN KEY 
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
    ADD CONSTRAINT Adquiere2  FOREIGN KEY 
    ( 
     id_reserva
    ) 
    REFERENCES Reserva 
    ( 
     id_reserva
    ) 
    ON DELETE CASCADE 
;

ALTER TABLE Paciente 
    ADD CONSTRAINT Cumple FOREIGN KEY 
    ( 
     id_reserva
    ) 
    REFERENCES Reserva 
    ( 
     id_reserva
    ) 
    ON DELETE CASCADE 
;

ALTER TABLE Receta 
    ADD CONSTRAINT Tiene FOREIGN KEY 
    ( 
     Codigo
    ) 
    REFERENCES Medicamento 
    ( 
     Codigo
    ) 
    ON DELETE CASCADE 
;


