USE [TICustom]
GO

CREATE PROCEDURE usp_RetrieveLOBFolderLookup
(
     @LineOfBusiness varchar(255)    
)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT FOLDERPATH 
    FROM [dbo].[Claim_LineOfBusiness_Folder_Lookup]
    WHERE LineOfBusiness = @LineOfBusiness;

    RETURN
END

GO