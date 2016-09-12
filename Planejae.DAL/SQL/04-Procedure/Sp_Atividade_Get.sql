IF EXISTS (SELECT top 1 1 FROM sys.objects WHERE name = 'Sp_Atividade_Get')
BEGIN
	DROP PROCEDURE Sp_Atividade_Get
	PRINT 'Dropping object Sp_Atividade_Get' 
END
PRINT 'Creating object Sp_Atividade_Get' 
go
CREATE PROCEDURE Sp_Atividade_Get
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