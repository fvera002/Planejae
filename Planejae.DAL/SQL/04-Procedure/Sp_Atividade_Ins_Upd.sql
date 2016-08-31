IF EXISTS (SELECT top 1 1 FROM sys.objects WHERE name = 'Sp_Atividade_Ins_Upd')
BEGIN
	DROP PROCEDURE Sp_Atividade_Ins_Upd
	PRINT 'Dropping object Sp_Atividade_Ins_Upd' 
END
PRINT 'Creating object Sp_Atividade_Ins_Upd' 
go
CREATE PROCEDURE Sp_Atividade_Ins_Upd
	@Id_Atividade int  = NULL output, 
	@Desc_Atividade varchar(1024),
	@Id_Usuario_Atualiz int = NULL, 
	@Dt_Atualiz datetime = NULL, 
	@Fl_Permite_Retrabalho int = NULL, 
	@Fl_Define_Responsavel int = NULL, 
	@Fl_Permite_Anexo int = NULL, 
	@Nr_Dias_Termino int = NULL, 
	@Nome varchar(80)

AS
SET NOCOUNT ON


IF EXISTS(SELECT TOP 1 1 FROM Atividade WHERE Id_Atividade = @Id_Atividade)
BEGIN
	 UPDATE Atividade
	    SET Desc_Atividade = @Desc_Atividade,
			Id_Usuario_Atualiz = @Id_Usuario_Atualiz,
			Dt_Atualiz = @Dt_Atualiz,
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
		@Dt_Atualiz,
		@Fl_Permite_Retrabalho,
		@Fl_Define_Responsavel,
		@Fl_Permite_Anexo,
		@Nr_Dias_Termino,
		@Nome
	)
	
	SET @Id_Atividade = SCOPE_IDENTITY()
END

SET NOCOUNT OFF


	