/* Employee Table Creation Script */
DROP TABLE [dbo].[Employee]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Employee_FName] [varchar](50) NOT NULL,
	[Employee_LName] [varchar](50) NOT NULL,
	[Employee_Position_ID] [int] NOT NULL,
	[Employee_Hire_Date] [date] NOT NULL,
	[Employee_Birth_Day] [date] NOT NULL,
	[Employee_Address] [varchar](50) NOT NULL,
	[Employee_Phone] [varchar](50) NOT NULL,
	[Employee_Token] [varchar](MAX) NOT NULL,
)
GO
