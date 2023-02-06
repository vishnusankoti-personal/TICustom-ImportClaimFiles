USE [TICustom]

GO

/****** Object:  StoredProcedure [dbo].[usp_ProcessThresholdClaims]    Script Date: 1/5/2023 3:50:21 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

/* ========================================================================================

-- Procedure Name: usp_ProcessThresholdClaims

-- Create Date: January 05, 2023

-- ========================================================================================

-- Purpose:          Process Threshold Claim messages 

-- ========================================================================================

-- Change Log:

-- Author:                                            Date:       Location:                                           Description:

-- ----------------------------------------------------------------------------------------

--       Process Threshold Claims Messages 

-- 0- Ready for Process

-- 1- In Process

-- 2- Process Complete 

-- ===================================================================================== */

CREATE PROCEDURE [dbo].[usp_ProcessThresholdClaims] 

 

WITH RECOMPILE

AS

 

SET NOCOUNT ON

BEGIN

 

DECLARE @MatchFoundTable TABLE

                (

                                [Claim_threshold_process_id] [int] NOT NULL,

                                [File_name]                                                       [varchar](255) NULL

                                

                )

--UnProcess Claims

Insert into @MatchFoundTable

SELECT Top 100 [Claim_Threshold_process_id]

      ,[FileName]

      

  FROM [TICustom].[dbo].[Claim_Threshold_process] (nolock)

  Where Daycount <65000 AND Cast(Process_Datetime as Date)= cast (Getdate() as Date)

  AND Process_Flag in ('0')

  Order By Claim_Threshold_process_id Asc

 

--  --Claim picked up by previous batch , but process failed due to technical glitches

--  Insert into @MatchFoundTable

--SELECT  [Claim_Threshold_process_id]

--      ,[FileName]      

--  FROM [TICustom].[dbo].[Claim_Threshold_process] (nolock)

--  Where Daycount <65000 AND Cast(Process_Datetime as Date)= cast (Getdate() as Date)

--  AND Process_Flag in ('1') And update_datetime<GETDATE()

--  Order By Claim_Threshold_process_id Asc

 

  -- Update the process_flag status 

  Update [TICustom].[dbo].[Claim_Threshold_process]

  set Process_Flag='1' , update_datetime = GETDATE()

  Where Claim_Threshold_process_id in (Select Claim_Threshold_process_id from @MatchFoundTable)

 

 

  Select [Claim_Threshold_process_id]

      ,[FileName] 

 FROM [TICustom].[dbo].[Claim_Threshold_process] (nolock) 

  Where Claim_Threshold_process_id in (Select Claim_Threshold_process_id from @MatchFoundTable)

  

                   

END