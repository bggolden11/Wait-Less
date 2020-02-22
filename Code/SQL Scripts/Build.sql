/* Table deletion START */
DROP TABLE IF EXISTS [dbo].[Order]
DROP TABLE IF EXISTS [dbo].[DiningTableQueue]
DROP TABLE IF EXISTS [dbo].[DiningTable]
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/* Employee Table Creation START */

/* Employee Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Employee](
    [Employee_ID] [int] NOT NULL IDENTITY(2121,1) PRIMARY KEY,
    [FName] [varchar](50) NOT NULL,
    [LName] [varchar](50) NOT NULL,
    [isManager] [bit] NOT NULL,
    [Hire_Date] [date] NOT NULL,
    [Birth_Date] [date] NOT NULL,
    [Address] [varchar](50) NOT NULL,
    [Phone] [varchar](50) NOT NULL,
    [Token] [varchar](MAX) NOT NULL,
    [Salary] [decimal](19,2) NOT NULL,
    [Title] [varchar](50) NOT NULL
)
GO

INSERT INTO [dbo].[Employee] ( [FName], [LName], [isManager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Manager', 'Test', 1, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [FName], [LName], [isManager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Host', 'Test', 1, '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', 'jAl4N4o8EGTKM0DLJiblQQ==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [FName], [LName], [isManager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Waiter', 'Test', 0, '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [FName], [LName], [isManager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Manager', 'Test', 1, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [FName], [LName], [isManager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Host', 'Test', 1, '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', 'jAl4N4o8EGTKM0DLJiblQQ==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [FName], [LName], [isManager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Waiter', 'Test', 0, '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', 'jAl4N4o8EGTKM0DLJiblQQ==', 10.0, 'Waiter')
GO
/* Employee Table Creation END */

/* DiningTable Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DiningTable](
    [Dining_Table_ID] [int] NOT NULL IDENTITY(1001,1) PRIMARY KEY,
    [Employee_ID] [int] NOT NULL,
    [Seats] [int] NOT NULL,
    [isAvailable] [bit] NOT NULL,
    [Seating_Time] [datetime],
    [Has_Birthday] [bit] NOT NULL,
    [Special_Request] [varchar](MAX),
    FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[Employee] ([Employee_ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

INSERT INTO [dbo].[DiningTable]
    ( [Employee_ID], [Seats], [isAvailable], [Seating_Time],
      [Has_Birthday], [Special_Request] )
VALUES (2121, 4, 1, CURRENT_TIMESTAMP, 0, 'My special request')

INSERT INTO [dbo].[DiningTable]
    ( [Employee_ID], [Seats], [isAvailable], [Seating_Time],
      [Has_Birthday], [Special_Request] )
VALUES (2122, 1, 1, CURRENT_TIMESTAMP, 0, 'Alergic to peanuts')

INSERT INTO [dbo].[DiningTable]
    ( [Employee_ID], [Seats], [isAvailable], [Seating_Time],
      [Has_Birthday], [Special_Request] )
VALUES (2123, 6, 0, CURRENT_TIMESTAMP, 1, 'By window')
/* DiningTable Table Creation END */

/* DiningTableQueue Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DiningTableQueue](
    [Queue_ID] [int] NOT NULL IDENTITY(3120,1),
    [Dining_Table_ID] [int] NOT NULL,
    [Employee_ID] [int] NOT NULL,
    [Latest_Attending_Time] [datetime],
    PRIMARY KEY ([Queue_ID], [Employee_ID]),
    FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[Employee] ([Employee_ID])
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY ([Dining_Table_ID]) REFERENCES [dbo].[DiningTable] ([Dining_Table_ID])
    ON DELETE CASCADE
    ON UPDATE CASCADE,
)
GO

INSERT INTO [dbo].[DiningTableQueue]
    ( [Dining_Table_ID], [Employee_ID], [Latest_Attending_Time])
VALUES (1001, 2121, CURRENT_TIMESTAMP)

INSERT INTO [dbo].[DiningTableQueue]
    ( [Dining_Table_ID], [Employee_ID], [Latest_Attending_Time])
VALUES (1003, 2123, CURRENT_TIMESTAMP)

INSERT INTO [dbo].[DiningTableQueue]
    ( [Dining_Table_ID], [Employee_ID], [Latest_Attending_Time])
VALUES (1002, 2122, CURRENT_TIMESTAMP)
GO
/* DiningTableQueue Table Creation END */

/* Order Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Order](
    [Order_ID] [int] NOT NULL IDENTITY(4010,1) PRIMARY KEY,
    [Queue_ID] [int] NOT NULL,
    [Employee_ID] [int] NOT NULL,
    [Order_Type] [varchar](MAX) NOT NULL,
    [Order_Time] [datetime],
    FOREIGN KEY ([Queue_ID], [Employee_ID])
    REFERENCES [dbo].[DiningTableQueue] ([Queue_ID], [Employee_ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

INSERT INTO [dbo].[Order]
    ( [Queue_ID], [Employee_ID], [Order_Type], [Order_Time])
VALUES (3120, 2121, 'Refill', CURRENT_TIMESTAMP)
GO
/* Order Table Creation END */

