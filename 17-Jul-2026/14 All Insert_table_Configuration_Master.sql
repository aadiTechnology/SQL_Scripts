INSERT INTO [dbo].[Configuration_Master]
           ([Configure_Id]
           ,[Configure_Name]
           ,[NavigateURL]
           ,[Config_Type_Id]
           ,[Sort_Index]
           ,[Is_Deleted]
           ,[Inserted_By_Id]
           ,[Inser_Date]
           ,[Update_By_Id]
           ,[Updated_Date]
           ,[Parent_Id]
           ,[Screen_Level]
           ,[Supervisor_Access]
           ,[Is_ViewAvailable]
           ,[SchoolModulesId])
     VALUES
           (351
           ,'Alumni Details'
           ,''
           ,NULL
           ,2200
           ,'N'
           ,1
           ,DBO.GetLocalDate(DEFAULT)
           ,1
           ,DBO.GetLocalDate(DEFAULT)
           ,NULL
           ,1
           ,1
           ,'N'
           ,0)
GO


