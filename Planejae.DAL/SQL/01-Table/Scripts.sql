USE [planejae]
GO
/****** Object:  UserDefinedDataType [dbo].[Usuario]    Script Date: 25/09/2016 22:05:12 ******/
CREATE TYPE [dbo].[Usuario] FROM [nvarchar](128) NULL
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_Is_Gestor]    Script Date: 25/09/2016 22:05:12 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 25/09/2016 22:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Atividade]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade_Processo]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Atividade_Projeto_Responsavel]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade_Responsavel]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Execucao]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Processo]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projeto]    Script Date: 25/09/2016 22:05:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'Gestor', N'Gestor')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5ca75560-3d20-43e5-b882-e6478f260355', N'Gestor')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'5ca75560-3d20-43e5-b882-e6478f260355', N'admin', N'AH3ioAyoHvLpwM4Kj2BxpS3oCs2cF3sddqL3LI/5yKzCLD8Ku3UD7i0jXfMeSeJ9gQ==', N'e4775b04-64a4-435f-8fe0-2416757909cb', N'ApplicationUser')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'9b9b3ea6-6ca1-46b8-a247-5df0d4082eee', N'teste', N'AOdpuk8Uv7TnRXiftwfO46bwDU/jUtPJogKl5Mbw1TbiE45UApM4xT/nOs4C6yAtjg==', N'2d4f35b3-cccc-4ccf-9b4b-c5900939293d', N'ApplicationUser')

ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Atividade_Processo]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Atividade_Processo] CHECK CONSTRAINT [R_25]
GO
ALTER TABLE [dbo].[Atividade_Processo]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([Id_Processo])
REFERENCES [dbo].[Processo] ([Id_Processo])
GO
ALTER TABLE [dbo].[Atividade_Processo] CHECK CONSTRAINT [R_26]
GO
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel]  WITH CHECK ADD  CONSTRAINT [R_37] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel] CHECK CONSTRAINT [R_37]
GO
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel]  WITH CHECK ADD  CONSTRAINT [R_38] FOREIGN KEY([Id_Projeto])
REFERENCES [dbo].[Projeto] ([Id_Projeto])
GO
ALTER TABLE [dbo].[Atividade_Projeto_Responsavel] CHECK CONSTRAINT [R_38]
GO
ALTER TABLE [dbo].[Atividade_Responsavel]  WITH CHECK ADD  CONSTRAINT [R_39] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Atividade_Responsavel] CHECK CONSTRAINT [R_39]
GO
ALTER TABLE [dbo].[Execucao]  WITH CHECK ADD  CONSTRAINT [R_34] FOREIGN KEY([Id_Atividade])
REFERENCES [dbo].[Atividade] ([Id_Atividade])
GO
ALTER TABLE [dbo].[Execucao] CHECK CONSTRAINT [R_34]
GO
ALTER TABLE [dbo].[Execucao]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([Id_Projeto])
REFERENCES [dbo].[Projeto] ([Id_Projeto])
GO
ALTER TABLE [dbo].[Execucao] CHECK CONSTRAINT [R_35]
GO
ALTER TABLE [dbo].[Projeto]  WITH CHECK ADD  CONSTRAINT [R_32] FOREIGN KEY([Id_Processo])
REFERENCES [dbo].[Processo] ([Id_Processo])
GO
ALTER TABLE [dbo].[Projeto] CHECK CONSTRAINT [R_32]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Get]    Script Date: 25/09/2016 22:05:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Ins_Upd]    Script Date: 25/09/2016 22:05:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Processo_Ins_Upd]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Atividade_Processo_Ins_Upd]
	@Id_Processo			int,
	@Id_Atividade			int

AS
begin
	SET NOCOUNT ON

	declare @Ultima_Sequencia int
	
	SELECT @Ultima_Sequencia = MAX(Sequencia) 
	  FROM Atividade_Processo
	 WHERE Id_Processo = @Id_Processo 
									

	IF EXISTS(SELECT TOP 1 1 
	            FROM Atividade_Processo
	           WHERE Id_Processo = @Id_Processo AND Id_Atividade = @Id_Atividade)
	BEGIN

		UPDATE Atividade_Processo
		   SET Id_Atividade = @Id_Atividade
			  ,Id_Processo	= @Id_Processo
			  ,Sequencia	= @Ultima_Sequencia +1
		 WHERE Id_Atividade = @Id_Atividade
		   AND Id_Processo	= @Id_Processo		   
	END
	ELSE
	BEGIN
		INSERT INTO Atividade_Processo
				   (Id_Atividade
				   ,Id_Processo
				   ,Sequencia)
			 VALUES
				   (@Id_Atividade
				   ,@Id_Processo
				   ,COALESCE(@Ultima_Sequencia,0) +1)
	END

end

GO
/****** Object:  StoredProcedure [dbo].[Sp_Atividade_Responsavel_Ins_Upd]    Script Date: 25/09/2016 22:05:13 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Processo_Get]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Processo_Get]
AS
begin
	SET NOCOUNT ON

	select p.*, coalesce(us.UserName,p.Id_Usuario_Atualiz) as Login_Atualiz
	  from Processo p
	  left join AspNetUsers us on us.Id = p.Id_Usuario_Atualiz;

	SET NOCOUNT OFF
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_Processo_Ins_Upd]    Script Date: 25/09/2016 22:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Processo_Ins_Upd]
@Id_Processo			int out,
@Desc_Processo			varchar(1024)= null,
@Nome					varchar(80),
@Id_Usuario_Atualiz		Usuario
AS
begin
	SET NOCOUNT ON



	IF EXISTS(SELECT TOP 1 1 FROM Processo WHERE Id_Processo = @Id_Processo)
	BEGIN
		 UPDATE Processo
			SET Nome = @Nome,
				Desc_Processo = @Desc_Processo,
				Id_Usuario_Atualiz = @Id_Usuario_Atualiz,
				Dt_Atualiz = GETDATE()
		  WHERE Id_Processo = @Id_Processo

	END
	ELSE
	BEGIN
		INSERT INTO Processo
		(
			--Id_Processo,
			Desc_Processo,
			Id_Usuario_Atualiz,
			Dt_Atualiz,
			Nome
		)
		VALUES 
		(
			--@Id_Processo,
			@Desc_Processo,
			@Id_Usuario_Atualiz,
			GETDATE(),
			@Nome
		)
	
		SET @Id_Processo = SCOPE_IDENTITY()
	END

	select * from Processo where Id_Processo = @Id_Processo

	SET NOCOUNT OFF
end


GO
/****** Object:  StoredProcedure [dbo].[Sp_Responsavel_Get]    Script Date: 25/09/2016 22:05:13 ******/
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
