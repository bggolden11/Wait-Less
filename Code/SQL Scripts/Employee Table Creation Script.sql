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

INSERT INTO [dbo].[Employee] 
	( [Employee_FName], [Employee_LName], [Employee_Position_ID], [Employee_Hire_Date],
      [Employee_Birth_Day], [Employee_Address], [Employee_Phone], [Employee_Token] )
VALUES ('Test', 'Person', 3, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==')
GO

