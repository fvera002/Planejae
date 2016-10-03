USE [planejae]
GO
/****** Object:  UserDefinedDataType [dbo].[Usuario]    Script Date: 09/12/2016 21:30:42 ******/
CREATE TYPE [dbo].[Usuario] FROM [nvarchar](128) NULL
GO
/****** Object:  StoredProcedure [dbo].[Sp_Responsavel_Get]    Script Date: 09/12/2016 21:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Responsavel_Get]
	
AS
SET NOCOUNT ON


SELECT Id as Id_Usuario,
	   UserName as Login_Usuario
  FROM dbo.AspNetUsers

SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[Atividade]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atividade](
	[Id_Atividade] [int] IDENTITY(1,1) NOT NULL,
	[Desc_Atividade] [varchar](1024) NULL,
	[Id_Usuario_Atualiz] [dbo].[Usuario] NOT NULL,
	[Dt_Atualiz] [datetime] NOT NULL,
	[Fl_Permite_Retrabalho] [int] NOT NULL,
	[Fl_Define_Responsavel] [int] NOT NULL,
	[Fl_Permite_Anexo] [int] NOT NULL,
	[Nr_Dias_Termino] [int] NULL,
	[Nome] [varchar](80) NOT NULL,
 CONSTRAINT [XPKAtividade] PRIMARY KEY CLUSTERED 
(
	[Id_Atividade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Processo]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Processo](
	[Id_Processo] [int] IDENTITY(1,1) NOT NULL,
	[Desc_Processo] [varchar](1024) NULL,
	[Id_Usuario_Atualiz] [dbo].[Usuario] NOT NULL,
	[Dt_Atualiz] [datetime] NOT NULL,
	[Nome] [varchar](80) NOT NULL,
 CONSTRAINT [XPKProcesso] PRIMARY KEY CLUSTERED 
(
	[Id_Processo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade_Responsavel]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atividade_Responsavel](
	[Id_Usuario] [dbo].[Usuario] NOT NULL,
	[Id_Usuario_Atualiz] [dbo].[Usuario] NOT NULL,
	[Dt_Atualiz] [datetime] NOT NULL,
	[Desc_Responsabilidade] [varchar](140) NULL,
	[Id_Atividade] [int] NOT NULL,
 CONSTRAINT [XPKUsuario_Atividade] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC,
	[Id_Atividade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_Is_Gestor]    Script Date: 09/12/2016 21:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fn_Is_Gestor](@Id_Usuario	Usuario)
returns bit	
AS
BEGIN
	DECLARE @Eh_Gestor bit

	SELECT @Eh_Gestor = CASE COUNT(1) WHEN 0 THEN 0 ELSE 1 END
	  FROM AspNetUserRoles
	 WHERE UserId = @Id_Usuario--'5ca75560-3d20-43e5-b882-e6478f260355'
	   AND UPPER(RoleId) = 'GESTOR'
	   
	RETURN @Eh_Gestor
END
GO
/****** Object:  Table [dbo].[Projeto]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projeto](
	[Id_Projeto] [int] IDENTITY(1,1) NOT NULL,
	[Desc_Projeto] [varchar](1024) NULL,
	[Id_Usuario_Atualiz] [dbo].[Usuario] NOT NULL,
	[Dt_Atualiz] [datetime] NOT NULL,
	[Nome] [varchar](80) NOT NULL,
	[Id_Processo] [int] NOT NULL,
 CONSTRAINT [XPKProjeto] PRIMARY KEY CLUSTERED 
(
	[Id_Projeto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade_Processo]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atividade_Processo](
	[Id_Atividade] [int] NOT NULL,
	[Id_Processo] [int] NOT NULL,
	[Sequencia] [int] NULL,
 CONSTRAINT [XPKAtividade_Processo] PRIMARY KEY CLUSTERED 
(
	[Id_Atividade] ASC,
	[Id_Processo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Ins_Upd]    Script Date: 09/12/2016 21:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Atividade_Ins_Upd]
	@Id_Atividade int  = NULL output, 
	@Desc_Atividade varchar(1024),
	@Id_Usuario_Atualiz Usuario, 
	@Fl_Permite_Retrabalho int, 
	@Fl_Define_Responsavel int, 
	@Fl_Permite_Anexo int, 
	@Nr_Dias_Termino int = NULL, 
	@Nome varchar(80)

AS
SET NOCOUNT ON


IF EXISTS(SELECT TOP 1 1 FROM Atividade WHERE Id_Atividade = @Id_Atividade)
BEGIN
	 UPDATE Atividade
	    SET Desc_Atividade = @Desc_Atividade,
			Id_Usuario_Atualiz = @Id_Usuario_Atualiz,
			Dt_Atualiz = GETDATE(),
			Fl_Permite_Retrabalho = @Fl_Permite_Retrabalho,
			Fl_Define_Responsavel = @Fl_Define_Responsavel,
			Fl_Permite_Anexo = @Fl_Permite_Anexo,
			Nr_Dias_Termino = @Nr_Dias_Termino,
			Nome = @Nome
	  WHERE Id_Atividade = @Id_Atividade

END
ELSE
BEGIN
	INSERT INTO Atividade
	(
		--Id_Atividade,
		Desc_Atividade,
		Id_Usuario_Atualiz,
		Dt_Atualiz,
		Fl_Permite_Retrabalho,
		Fl_Define_Responsavel,
		Fl_Permite_Anexo,
		Nr_Dias_Termino,
		Nome
	)
	VALUES 
	(
		--@Id_Atividade,
		@Desc_Atividade,
		@Id_Usuario_Atualiz,
		GETDATE(),
		@Fl_Permite_Retrabalho,
		@Fl_Define_Responsavel,
		@Fl_Permite_Anexo,
		@Nr_Dias_Termino,
		@Nome
	)
	
	SET @Id_Atividade = SCOPE_IDENTITY()
END

select * from Atividade where Id_Atividade = @Id_Atividade

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Get]    Script Date: 09/12/2016 21:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Atividade_Get]
	@Id_Atividade				int = null, 
	@Id_Usuario_Visualisando	Usuario = null
	
AS
SET NOCOUNT ON
--Usuários que podem ver uma atividade:
	--Tem perfil 'Gestor'
	--Usuário criou a atividade
	--É responsável pela atividade

 SELECT Atv.*, Usu.UserName as Login_Atualiz
   FROM Atividade Atv
  INNER JOIN AspNetUsers Usu on Atv.Id_Usuario_Atualiz = Usu.Id
  WHERE Atv.Id_Atividade = COALESCE(@Id_Atividade, Atv.Id_Atividade)
    AND (@Id_Usuario_Visualisando IS NULL
		 OR dbo.Fn_Is_Gestor(@Id_Usuario_Visualisando) = 1
		 OR Atv.Id_Usuario_Atualiz  = @Id_Usuario_Visualisando
		 OR EXISTS(SELECT TOP 1 1 
		             FROM Atividade_Responsavel AtvRes
		            WHERE AtvRes.Id_Atividade = Atv.Id_Atividade
		              AND AtvRes.Id_Usuario = @Id_Usuario_Visualisando) )


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Responsavel_Ins_Upd]    Script Date: 09/12/2016 21:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Atividade_Responsavel_Ins_Upd]
	@Id_Atividade				int,
	@Id_Usuario					Usuario, --Reponsavel pela atividade 
	@Id_Usuario_Atualiz			Usuario,  --Usuário que está cadastrando o responsavel
	@Desc_Responsabilidade		VARCHAR(140) = NULL 
	
AS
SET NOCOUNT ON

IF EXISTS(SELECT TOP 1 1
			FROM dbo.Atividade_Responsavel
		   WHERE Id_Atividade = @Id_Atividade
		     AND Id_Usuario = @Id_Usuario)
BEGIN
	UPDATE dbo.Atividade_Responsavel
	   SET Id_Usuario_Atualiz = @Id_Usuario_Atualiz,
	       Dt_Atualiz = GETDATE(),
	       Desc_Responsabilidade = @Desc_Responsabilidade
	 WHERE Id_Atividade = @Id_Atividade
	   AND Id_Usuario = @Id_Usuario  
END
ELSE
BEGIN
	INSERT INTO planejae.dbo.Atividade_Responsavel
           (Id_Atividade
           ,Id_Usuario
           ,Desc_Responsabilidade
           ,Id_Usuario_Atualiz
           ,Dt_Atualiz)
     VALUES
           (@Id_Atividade
           ,@Id_Usuario
           ,@Desc_Responsabilidade
           ,@Id_Usuario_Atualiz
           , GETDATE())
END		     
SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[Execucao]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Execucao](
	[Id_Atividade] [int] NOT NULL,
	[Id_Projeto] [int] NOT NULL,
	[Desc_Execucao] [varchar](1024) NOT NULL,
	[Id_Usuario_Atualiz] [dbo].[Usuario] NOT NULL,
	[Dt_Atualiz] [datetime] NOT NULL,
	[Sequencia_Execucao] [int] NOT NULL,
	[Id_Prox_Atividade] [int] NULL,
 CONSTRAINT [XPKExecucao_Atividade_Projeto] PRIMARY KEY CLUSTERED 
(
	[Id_Atividade] ASC,
	[Id_Projeto] ASC,
	[Sequencia_Execucao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade_Projeto_Responsavel]    Script Date: 09/12/2016 21:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atividade_Projeto_Responsavel](
	[Id_Usuario] [int] NOT NULL,
	[Id_Usuario_Atualiz] [dbo].[Usuario] NOT NULL,
	[Dt_Atualiz] [datetime] NOT NULL,
	[Desc_Responsabilidade] [varchar](140) NULL,
	[Id_Atividade] [int] NOT NULL,
	[Id_Projeto] [int] NOT NULL,
 CONSTRAINT [XPKUsuario_Atividade_Projeto] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC,
	[Id_Atividade] ASC,
	[Id_Projeto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [R_25]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Atividade_Processo]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Atividade_Processo] CHECK CONSTRAINT [R_25]
GO
/****** Object:  ForeignKey [R_26]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Atividade_Processo]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([Id_Processo])
REFERENCES [dbo].[Processo] ([Id_Processo])
GO
ALTER TABLE [dbo].[Atividade_Processo] CHECK CONSTRAINT [R_26]
GO
/****** Object:  ForeignKey [R_37]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel]  WITH CHECK ADD  CONSTRAINT [R_37] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel] CHECK CONSTRAINT [R_37]
GO
/****** Object:  ForeignKey [R_38]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel]  WITH CHECK ADD  CONSTRAINT [R_38] FOREIGN KEY([Id_Projeto])
REFERENCES [dbo].[Projeto] ([Id_Projeto])
GO
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel] CHECK CONSTRAINT [R_38]
GO
/****** Object:  ForeignKey [R_39]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Atividade_Responsavel]  WITH CHECK ADD  CONSTRAINT [R_39] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Atividade_Responsavel] CHECK CONSTRAINT [R_39]
GO
/****** Object:  ForeignKey [R_34]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Execucao]  WITH CHECK ADD  CONSTRAINT [R_34] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Execucao] CHECK CONSTRAINT [R_34]
GO
/****** Object:  ForeignKey [R_35]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Execucao]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([Id_Projeto])
REFERENCES [dbo].[Projeto] ([Id_Projeto])
GO
ALTER TABLE [dbo].[Execucao] CHECK CONSTRAINT [R_35]
GO
/****** Object:  ForeignKey [R_32]    Script Date: 09/12/2016 21:30:35 ******/
ALTER TABLE [dbo].[Projeto]  WITH CHECK ADD  CONSTRAINT [R_32] FOREIGN KEY([Id_Processo])
REFERENCES [dbo].[Processo] ([Id_Processo])
GO
ALTER TABLE [dbo].[Projeto] CHECK CONSTRAINT [R_32]
GO
