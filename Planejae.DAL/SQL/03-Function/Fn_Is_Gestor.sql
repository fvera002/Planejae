IF EXISTS (SELECT top 1 1 FROM sys.objects WHERE name = 'Fn_Is_Gestor')
BEGIN
	DROP FUNCTION Fn_Is_Gestor
	PRINT 'Dropping object Fn_Is_Gestor' 
END
PRINT 'Creating object Fn_Is_Gestor' 
go
CREATE FUNCTION Fn_Is_Gestor(@Id_Usuario	Usuario)
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

	