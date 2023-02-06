USE [TICustom]

GO

/****** Object:  Table [dbo].[Claim_Threshold_process]    Script Date: 02/04/2023 21:26:48 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

SET ANSI_PADDING ON

GO

CREATE TABLE [dbo].[Claim_Threshold_process](

      [Claim_Threshold_process_id] [int] IDENTITY(1,1) NOT NULL,

      [FileName] [varchar](255) NULL,

      [Process_datetime] [datetime] NOT NULL,

      [LineOfBusiness] [varchar](15) NULL,

      [ClaimCount] [int] NULL,

      [DayCount] [int] NULL,

      [Process_Flag] [varchar](5) NULL,

      [insert_datetime] [datetime] NOT NULL,

      [update_datetime] [datetime] NULL,

CONSTRAINT [PK_[Claim_Threshold_process] PRIMARY KEY CLUSTERED

(

      [Claim_Threshold_process_id] ASC

))
--WITH (PAD_INDEX  = OFF,STATISTICS_NORECOMPUTE  = OFF,IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  =ON, ALLOW_PAGE_LOCKS  = ON) ON [fg_sec01]

) ON [fg_sec01]

GO

SET ANSI_PADDING ON

GO

SET IDENTITY_INSERT  [TICustom].[dbo].[Claim_Threshold_process] ON


INSERT [TICustom].[dbo].[Claim_Threshold_process]([Claim_Threshold_process_id], [FileName],[Process_datetime], [LineOfBusiness],[ClaimCount], [DayCount], [Process_Flag],[insert_datetime], [update_datetime])VALUES (2,N'C:\Vishnu\ForVidya\Claims_MoveFiles_Project\InputFiles\5_70_837P_FF_0000SRCP.edi', CAST(0x0000AF9B0127FBA1 AS DateTime),N'local', NULL, NULL, N'0',CAST(0x0000AF9B00ED5DC6 AS DateTime), NULL);

INSERT [TICustom].[dbo].[Claim_Threshold_process]([Claim_Threshold_process_id], [FileName],[Process_datetime], [LineOfBusiness],[ClaimCount], [DayCount], [Process_Flag],[insert_datetime], [update_datetime])VALUES (3,N'C:\Vishnu\ForVidya\Claims_MoveFiles_Project\InputFiles\10_150_837I_FF_00001697.edi', CAST(0x0000AF9B0127FBA1 AS DateTime),N'local', NULL, NULL, N'0',CAST(0x0000AF9B00F443BE AS DateTime), NULL);

--INSERT [dbo].[Claim_Threshold_process]([Claim_Threshold_process_id], [FileName]);