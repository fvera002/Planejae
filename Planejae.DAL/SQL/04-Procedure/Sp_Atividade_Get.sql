IF EXISTS (SELECT top 1 1 FROM sys.objects WHERE name = 'Sp_Atividade_Get')
BEGIN
	DROP PROCEDURE Sp_Atividade_Get
	PRINT 'Dropping object Sp_Atividade_Get' 
END
PRINT 'Creating object Sp_Atividade_Get' 
go
CREATE PROCEDURE Sp_Atividade_Get
	@Id_Atividade	int = null, 
	@Id_Usuario		int = null
	
AS
SET NOCOUNT ON

 SELECT * 
   FROM Atividade
  WHERE Id_Atividade = COALESCE(@Id_Atividade, Id_Atividade)
    --AND Id_Usuario  = COALESCE(@Id_Usuario, Id_Usuario)


SET NOCOUNT OFF


	