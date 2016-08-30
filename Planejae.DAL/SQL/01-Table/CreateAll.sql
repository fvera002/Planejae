/*
USE master;
GO
ALTER DATABASE planejae SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
*/
--drop database planejae;
--create database planejae;

USE planejae;

CREATE TABLE [Atividade]
( 
	[Id_Atividade]       integer  NOT NULL  IDENTITY ,
	[Desc_Atividade]     varchar(1024)  NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Fl_Permite_Retrabalho] integer  NOT NULL ,
	[Fl_Define_Responsavel] integer  NOT NULL ,
	[Fl_Permite_Anexo]   integer  NOT NULL ,
	[Nr_Dias_Termino]    integer  NULL ,
	[Nome]               varchar(80)  NOT NULL 
)
go

ALTER TABLE [Atividade]
	ADD CONSTRAINT [XPKAtividade] PRIMARY KEY  CLUSTERED ([Id_Atividade] ASC)
go

CREATE TABLE [Atividade_Processo]
( 
	[Id_Atividade]       integer  NOT NULL ,
	[Id_Processo]        integer  NOT NULL ,
	[Sequencia]          integer  NULL 
)
go

ALTER TABLE [Atividade_Processo]
	ADD CONSTRAINT [XPKAtividade_Processo] PRIMARY KEY  CLUSTERED ([Id_Atividade] ASC,[Id_Processo] ASC)
go

CREATE TABLE [Atividade_Projeto_Responsavel]
( 
	[Id_Usuario]         integer  NOT NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Desc_Responsabilidade] varchar(140)  NULL ,
	[Id_Atividade]       integer  NOT NULL ,
	[Id_Projeto]         integer  NOT NULL 
)
go

ALTER TABLE [Atividade_Projeto_Responsavel]
	ADD CONSTRAINT [XPKUsuario_Atividade_Projeto] PRIMARY KEY  CLUSTERED ([Id_Usuario] ASC,[Id_Atividade] ASC,[Id_Projeto] ASC)
go

CREATE TABLE [Atividade_Responsavel]
( 
	[Id_Usuario]         integer  NOT NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Desc_Responsabilidade] varchar(140)  NULL ,
	[Id_Atividade]       integer  NOT NULL 
)
go

ALTER TABLE [Atividade_Responsavel]
	ADD CONSTRAINT [XPKUsuario_Atividade_Responsavel] PRIMARY KEY  CLUSTERED ([Id_Usuario] ASC,[Id_Atividade] ASC)
go

CREATE TABLE [Execucao]
( 
	[Id_Atividade]       integer  NOT NULL ,
	[Id_Projeto]         integer  NOT NULL ,
	[Desc_Execucao]      varchar(1024)  NOT NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Sequencia_Execucao] integer  NOT NULL ,
	[Id_Prox_Atividade]  integer  NULL 
)
go

ALTER TABLE [Execucao]
	ADD CONSTRAINT [XPKExecucao_Atividade_Projeto] PRIMARY KEY  CLUSTERED ([Id_Atividade] ASC,[Id_Projeto] ASC,[Sequencia_Execucao] ASC)
go

CREATE TABLE [Perfil]
( 
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Id_Perfil]          integer  NOT NULL  IDENTITY ,
	[Desc_Perfil]        varchar(140)  NOT NULL ,
	[Nome]               varchar(40)  NULL 
)
go

ALTER TABLE [Perfil]
	ADD CONSTRAINT [XPKPerfil] PRIMARY KEY  CLUSTERED ([Id_Perfil] ASC)
go

CREATE TABLE [Processo]
( 
	[Id_Processo]        integer  NOT NULL  IDENTITY ,
	[Desc_Processo]      varchar(1024)  NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Nome]               varchar(80)  NOT NULL 
)
go

ALTER TABLE [Processo]
	ADD CONSTRAINT [XPKProcesso] PRIMARY KEY  CLUSTERED ([Id_Processo] ASC)
go

CREATE TABLE [Projeto]
( 
	[Id_Projeto]         integer  NOT NULL  IDENTITY ,
	[Desc_Projeto]       varchar(1024)  NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Nome]               varchar(80)  NOT NULL ,
	[Id_Processo]        integer  NOT NULL 
)
go

ALTER TABLE [Projeto]
	ADD CONSTRAINT [XPKProjeto] PRIMARY KEY  CLUSTERED ([Id_Projeto] ASC)
go

CREATE TABLE [Usuario]
( 
	[Id_Usuario]         integer  NOT NULL  IDENTITY ,
	[Nome]               varchar(80)  NOT NULL ,
	[Login_Usuario]      varchar(20)  NOT NULL ,
	[Email_Usuario]      varchar(120)  NOT NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Senha_Usuario]      varchar(20)  NULL 
)
go

ALTER TABLE [Usuario]
	ADD CONSTRAINT [XPKUsuario] PRIMARY KEY  CLUSTERED ([Id_Usuario] ASC)
go

CREATE TABLE [Usuario_Perfil]
( 
	[Id_Usuario]         integer  NOT NULL ,
	[Id_Perfil]          integer  NOT NULL ,
	[Id_Usuario_Atualiz] integer  NOT NULL ,
	[Dt_Atualiz]         DATETIME  NOT NULL ,
	[Dt_Inicio]          datetime  NOT NULL ,
	[Dt_Fim]             datetime  NULL 
)
go

ALTER TABLE [Usuario_Perfil]
	ADD CONSTRAINT [XPKUsuario_Perfil] PRIMARY KEY  CLUSTERED ([Id_Usuario] ASC,[Id_Perfil] ASC)
go


ALTER TABLE [Atividade_Processo]
	ADD CONSTRAINT [R_25] FOREIGN KEY ([Id_Atividade]) REFERENCES [Atividade]([Id_Atividade])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Atividade_Processo]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([Id_Processo]) REFERENCES [Processo]([Id_Processo])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Atividade_Projeto_Responsavel]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([Id_Atividade]) REFERENCES [Atividade]([Id_Atividade])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Atividade_Projeto_Responsavel]
	ADD CONSTRAINT [R_38] FOREIGN KEY ([Id_Projeto]) REFERENCES [Projeto]([Id_Projeto])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Atividade_Responsavel]
	ADD CONSTRAINT [R_39] FOREIGN KEY ([Id_Atividade]) REFERENCES [Atividade]([Id_Atividade])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Execucao]
	ADD CONSTRAINT [R_34] FOREIGN KEY ([Id_Atividade]) REFERENCES [Atividade]([Id_Atividade])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Execucao]
	ADD CONSTRAINT [R_35] FOREIGN KEY ([Id_Projeto]) REFERENCES [Projeto]([Id_Projeto])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Projeto]
	ADD CONSTRAINT [R_32] FOREIGN KEY ([Id_Processo]) REFERENCES [Processo]([Id_Processo])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Usuario_Perfil]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([Id_Usuario]) REFERENCES [Usuario]([Id_Usuario])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Usuario_Perfil]
	ADD CONSTRAINT [R_18] FOREIGN KEY ([Id_Perfil]) REFERENCES [Perfil]([Id_Perfil])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go
