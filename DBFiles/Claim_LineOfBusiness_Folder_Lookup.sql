USE [TICustom]

GO

/****** Object:  Table [dbo].[Claim_Threshold_process]    Script Date: 02/04/2023 21:26:48 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

SET ANSI_PADDING ON

GO

CREATE TABLE [dbo].[Claim_LineOfBusiness_Folder_Lookup](

      [LineOfBusiness] [varchar](15) NOT NULL,

      [FolderPath] [varchar](255) NOT NULL
);