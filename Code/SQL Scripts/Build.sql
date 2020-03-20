/* Table deletion START */
DROP TABLE IF EXISTS [dbo].[Order]
DROP TABLE IF EXISTS [dbo].[Task]
DROP TABLE IF EXISTS [dbo].[DiningTable]
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/* Employee Table Creation START */

/* Employee Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Employee](
    [Employee_ID] [int] NOT NULL IDENTITY(2121,3) PRIMARY KEY,
    [F_Name] [varchar](50) NOT NULL,
    [L_Name] [varchar](50) NOT NULL,
    [Is_Manager] [bit] NOT NULL,
    [Is_Logged_In] [bit] DEFAULT 0,
    [Hire_Date] [date] NOT NULL,
    [Birth_Date] [date] NOT NULL,
    [Address] [varchar](50) NOT NULL,
    [Phone] [varchar](50) NOT NULL,
    [Token] [varchar](MAX) NOT NULL,
    [Salary] [decimal](19,2) NOT NULL,
    [Title] [varchar](50) NOT NULL
)
GO

INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Manager', 'Test', 1, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Host', 'Test', 1, '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Waiter', 'Test', 0, '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Manager', 'Test', 1, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Host', 'Test', 1, '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Waiter', 'Test', 0, '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Manager', 'Test', 1, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Host', 'Test', 1, '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Waiter', 'Test', 0, '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Manager', 'Test', 1, '2001-11-11', '2001-12-12', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Host', 'Test', 1, '2001-11-11', '2001-12-12', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Waiter', 'Test', 0, '2001-11-11', '2001-12-12', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
GO
/* Employee Table Creation END */

/* DiningTable Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DiningTable](
    [Dining_Table_ID] [int] NOT NULL IDENTITY(1001,2) PRIMARY KEY,
    [Employee_ID] [int] NOT NULL,
    [Seats] [int] NOT NULL,
    [Is_Active] [bit] NOT NULL,
    [Is_Occupied] [bit] NOT NULL,
    [Seating_Time] [time],
    [Reservation_Name] [varchar](MAX),
    [Has_Birthday] [bit] NOT NULL,
    [Special_Request] [varchar](MAX),
    FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[Employee] ([Employee_ID])
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
GO

INSERT INTO [dbo].[DiningTable] ( [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES (2121, 4, 1, 1, CURRENT_TIMESTAMP, 'Michael Goldenberg' , 0, 'My special request')
INSERT INTO [dbo].[DiningTable] ( [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES (2124, 2, 0, 0, CURRENT_TIMESTAMP, 'Pala Guma' , 1, 'Not a window')
INSERT INTO [dbo].[DiningTable] ( [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES (2127, 10, 1, 1, CURRENT_TIMESTAMP, 'Huge Mungos' , 1, 'Round Table')
GO
/* DiningTable Table Creation END */

/* Task Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Task](
    [Task_ID] [int] NOT NULL IDENTITY(1001,2) PRIMARY KEY,
    [Employee_ID] [int] NOT NULL,
    [Status] [varchar](MAX) NOT NULL,
    [Message] [varchar](MAX) NOT NULL,
    [Start_Time] [time] DEFAULT CONVERT(time, GETDATE()),
    [Finish_Time] [time], 
    [Total_Time] [time],
    [Task_Date] [date] DEFAULT CONVERT(date, GETDATE()),
    FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[Employee] ([Employee_ID])
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
GO

INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Message] ) VALUES (2121, 'Active', 'Cleanup Table 10')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Message] ) VALUES (2124, 'Active', 'Cleanup Table 1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Message] ) VALUES (2127, 'Complete', 'Sweep the floor')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Message] ) VALUES (2127, 'Active', 'Take out the trash')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Message] ) VALUES (2130, 'Active', 'Wash dishes')
GO
/* DiningTable Table Creation END */


