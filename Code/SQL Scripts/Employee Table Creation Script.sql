/* Employee Table Creation Script */
DROP TABLE IF EXISTS [dbo].[Employee]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] NOT NULL IDENTITY(2121,1) PRIMARY KEY,
	[FName] [varchar](50) NOT NULL,
	[LName] [varchar](50) NOT NULL,
	[isManager] [int] NOT NULL,
	[Hire_Date] [date] NOT NULL,
	[Birth_Date] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Token] [varchar](MAX) NOT NULL,
	[Salary] [decimal](19,2) NOT NULL,
)
GO

INSERT INTO [dbo].[Employee]
	( [FName], [LName], [isManager], [Hire_Date],
      [Birth_Date], [Address], [Phone], [Token], [Salary] )
VALUES ('Manager', 'Test', '1', '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==', 14.20)
GO

INSERT INTO [dbo].[Employee]
	( [FName], [LName], [isManager], [Hire_Date],
      [Birth_Date], [Address], [Phone], [Token], [Salary] )
VALUES ('Host', 'Test', '0', '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', 'jAl4N4o8EGTKM0DLJiblQQ==', 8.80)
GO

INSERT INTO [dbo].[Employee]
	( [FName], [LName], [isManager], [Hire_Date],
      [Birth_Date], [Address], [Phone], [Token], [Salary] )
VALUES ('Waiter', 'Test', '0', '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==', 10.0)
GO
