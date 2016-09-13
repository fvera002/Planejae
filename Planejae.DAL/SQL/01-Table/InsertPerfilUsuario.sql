INSERT INTO [planejae].[dbo].[AspNetUserRoles]
           ([UserId]
           ,[RoleId])
select Id, 'Gestor' from AspNetUsers
where UserName = 'admin'
GO

--teste 