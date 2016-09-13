INSERT INTO dbo.AspNetRoles VALUES ('Gestor', 'Gestor')
GO

INSERT INTO [planejae].[dbo].[AspNetUserRoles]
           ([UserId]
           ,[RoleId])
select Id, 'Gestor' from AspNetUsers
where UserName = 'admin'
GO

--teste 