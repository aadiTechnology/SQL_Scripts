-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[udf_GetLeaveMsgRestrictedUsers]
(
	-- Add the parameters for the function here
	@SchoolId int,
	@UserId INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @LeaveMsgRestrictedUser BIT = 0

    IF (@SchoolId = 71 AND @UserId IN (4,175,3))
        SET @LeaveMsgRestrictedUser = 1

    RETURN @LeaveMsgRestrictedUser
END