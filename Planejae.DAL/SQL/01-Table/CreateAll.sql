/*
USE master;

ALTER DATABASE planejae SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

*/
--drop database planejae;
--create database planejae;

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Atividade_Processo')
BEGIN
	DROP TABLE Atividade_Processo
END

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Atividade_Projeto_Responsavel')
BEGIN
	DROP TABLE Atividade_Projeto_Responsavel
	
END

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Atividade_Responsavel')
BEGIN
	DROP TABLE Atividade_Responsavel
	
END

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Execucao')
BEGIN
	DROP TABLE Execucao
	
END

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Projeto')
BEGIN
	DROP TABLE Projeto
	
END

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Processo')
BEGIN
	DROP TABLE Processo
	
END

IF EXISTS(SELECT TOP 1 1 FROM SYS.OBJECTS WHERE NAME = 'Atividade')
BEGIN
	DROP TABLE Atividade
	
END
go
CREATE TYPE Usuario
	FROM NVARCHAR(128) NULL
go

CREATE TABLE Atividade
( 
	Id_Atividade       integer  NOT NULL  IDENTITY ,
	Desc_Atividade     varchar(1024)  NULL ,
	Id_Usuario_Atualiz Usuario  NOT NULL ,
	Dt_Atualiz         DATETIME  NOT NULL ,
	Fl_Permite_Retrabalho integer  NOT NULL ,
	Fl_Define_Responsavel integer  NOT NULL ,
	Fl_Permite_Anexo   integer  NOT NULL ,
	Nr_Dias_Termino    integer  NULL ,
	Nome               varchar(80)  NOT NULL 
)


ALTER TABLE Atividade
	ADD CONSTRAINT XPKAtividade PRIMARY KEY  CLUSTERED (Id_Atividade ASC)


CREATE TABLE Atividade_Processo
( 
	Id_Atividade       integer  NOT NULL ,
	Id_Processo        integer  NOT NULL ,
	Sequencia          integer  NULL 
)


ALTER TABLE Atividade_Processo
	ADD CONSTRAINT XPKAtividade_Processo PRIMARY KEY  CLUSTERED (Id_Atividade ASC,Id_Processo ASC)


CREATE TABLE Atividade_Projeto_Responsavel
( 
	Id_Usuario         Usuario  NOT NULL ,
	Id_Usuario_Atualiz Usuario  NOT NULL ,
	Dt_Atualiz         DATETIME  NOT NULL ,
	Desc_Responsabilidade varchar(140)  NULL ,
	Id_Atividade       integer  NOT NULL ,
	Id_Projeto         integer  NOT NULL 
)


ALTER TABLE Atividade_Projeto_Responsavel
	ADD CONSTRAINT XPKUsuario_Atividade_Projeto PRIMARY KEY  CLUSTERED (Id_Usuario ASC,Id_Atividade ASC,Id_Projeto ASC)


CREATE TABLE Atividade_Responsavel
( 
	Id_Usuario         integer  NOT NULL ,
	Id_Usuario_Atualiz Usuario  NOT NULL ,
	Dt_Atualiz         DATETIME  NOT NULL ,
	Desc_Responsabilidade varchar(140)  NULL ,
	Id_Atividade       integer  NOT NULL 
)


ALTER TABLE Atividade_Responsavel
	ADD CONSTRAINT XPKUsuario_Atividade_Responsavel PRIMARY KEY  CLUSTERED (Id_Usuario ASC,Id_Atividade ASC)


CREATE TABLE Execucao
( 
	Id_Atividade       integer  NOT NULL ,
	Id_Projeto         integer  NOT NULL ,
	Desc_Execucao      varchar(1024)  NOT NULL ,
	Id_Usuario_Atualiz Usuario  NOT NULL ,
	Dt_Atualiz         DATETIME  NOT NULL ,
	Sequencia_Execucao integer  NOT NULL ,
	Id_Prox_Atividade  integer  NULL 
)


ALTER TABLE Execucao
	ADD CONSTRAINT XPKExecucao_Atividade_Projeto PRIMARY KEY  CLUSTERED (Id_Atividade ASC,Id_Projeto ASC,Sequencia_Execucao ASC)


CREATE TABLE Processo
( 
	Id_Processo        integer  NOT NULL  IDENTITY ,
	Desc_Processo      varchar(1024)  NULL ,
	Id_Usuario_Atualiz Usuario  NOT NULL ,
	Dt_Atualiz         DATETIME  NOT NULL ,
	Nome               varchar(80)  NOT NULL 
)


ALTER TABLE Processo
	ADD CONSTRAINT XPKProcesso PRIMARY KEY  CLUSTERED (Id_Processo ASC)


CREATE TABLE Projeto
( 
	Id_Projeto         integer  NOT NULL  IDENTITY ,
	Desc_Projeto       varchar(1024)  NULL ,
	Id_Usuario_Atualiz Usuario  NOT NULL ,
	Dt_Atualiz         DATETIME  NOT NULL ,
	Nome               varchar(80)  NOT NULL ,
	Id_Processo        integer  NOT NULL 
)


ALTER TABLE Projeto
	ADD CONSTRAINT XPKProjeto PRIMARY KEY  CLUSTERED (Id_Projeto ASC)



ALTER TABLE Atividade_Processo
	ADD CONSTRAINT R_25 FOREIGN KEY (Id_Atividade) REFERENCES Atividade(Id_Atividade)


ALTER TABLE Atividade_Processo
	ADD CONSTRAINT R_26 FOREIGN KEY (Id_Processo) REFERENCES Processo(Id_Processo)



ALTER TABLE Atividade_Projeto_Responsavel
	ADD CONSTRAINT R_37 FOREIGN KEY (Id_Atividade) REFERENCES Atividade(Id_Atividade)


ALTER TABLE Atividade_Projeto_Responsavel
	ADD CONSTRAINT R_38 FOREIGN KEY (Id_Projeto) REFERENCES Projeto(Id_Projeto)



ALTER TABLE Atividade_Responsavel
	ADD CONSTRAINT R_39 FOREIGN KEY (Id_Atividade) REFERENCES Atividade(Id_Atividade)



ALTER TABLE Execucao
	ADD CONSTRAINT R_34 FOREIGN KEY (Id_Atividade) REFERENCES Atividade(Id_Atividade)


ALTER TABLE Execucao
	ADD CONSTRAINT R_35 FOREIGN KEY (Id_Projeto) REFERENCES Projeto(Id_Projeto)



ALTER TABLE Projeto
	ADD CONSTRAINT R_32 FOREIGN KEY (Id_Processo) REFERENCES Processo(Id_Processo)

