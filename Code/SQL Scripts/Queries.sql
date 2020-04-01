select * from [Employee];
select * from [Task];
select * from [DiningTable];

-- select E.Employee_ID, E.F_Name, E.L_Name, E.Title, E.Is_Manager, E.Is_Logged_In, E.Birth_Date, STRING_AGG(CONVERT(nvarchar(max),ISNULL(T.Dining_Table_ID,'N/A')), ', ') as tables
-- from  [Employee] E
-- inner join [DiningTable] T on E.Employee_ID = T.Employee_ID
-- group by E.Employee_ID, E.F_Name, E.L_Name, E.Title, E.Is_Manager, E.Is_Logged_In, E.Birth_Date

-- with empl ID
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A1', 2121, 4, 1, 1, CONVERT(time, GETDATE()), 'Michael Goldenberg' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A2', 2124, 2, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A3', 2127, 8, 1, 1, CONVERT(time, GETDATE()), 'Harsh Gupta' , 1, 'Round table')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('B1', 2130, 4, 1, 1, CONVERT(time, GETDATE()), 'Natalie Portman' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('B2', 2127, 2, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('C1', 2121, 10, 1, 0, null , '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('D1', 2139, 2, 1, 1, CONVERT(time, GETDATE()), '' , 0, 'Near a window')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('D2', 2124, 4, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E1', 2124, 1, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E2', 2145, 4, 1, 1, CONVERT(time, GETDATE()), 'Huge Mungos' , 1, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E3', 2130, 2, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('OT', 2121, 0, 0, 0, null, '' , 0, '')
GO

-- without empl id
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A1', 2121, 4, 1, 1, CONVERT(time, GETDATE()), 'Michael Goldenberg' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A2', 2, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A3', 2127, 8, 1, 1, CONVERT(time, GETDATE()), 'Harsh Gupta' , 1, 'Round table')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('B1', 2130, 4, 1, 1, CONVERT(time, GETDATE()), 'Natalie Portman' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('B2', 2, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('C1', 10, 1, 0, null , '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('D1', 2139, 2, 1, 1, CONVERT(time, GETDATE()), '' , 0, 'Near a window')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('D2', 4, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E1', 1, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E2', 2145, 4, 1, 1, CONVERT(time, GETDATE()), 'Huge Mungos' , 1, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E3', 2, 1, 0, null, '' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('OT', 0, 0, 0, null, '' , 0, '')
GO


INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Active', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Active', 'Cleanup table', 'Clean the assigned table', 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Active', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Active', 'Cleanup table', 'Clean the assigned table', 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2127, 'Active', 'Take out the trash', 'We need the trash to be taken out', 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2130, 'Active', 'Wash dishes', 'Wash the dirty dishes in the kitchen', 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2130, 'Active', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2133, 'Active', 'Cleanup table', 'Clean the assigned table', 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2136, 'Active', 'Take out the trash', 'We need the trash to be taken out', 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2139, 'Active', 'Wash dishes', 'Wash the dirty dishes in the kitchen', 'OT')


-- Completed Tasks --

-- 2124 5 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:10:10', '05:12:40', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:40:32', '06:45:21', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Clean table', 'Clean the assigned table','07:11:00', '07:13:59', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A3')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:30:22', '08:33:19', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:19:43', '09:27:09', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:34:21', '11:36:17', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A1')

-- 2124 4 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:8:10', '05:11:21', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:34:32', '06:48:11', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Clean table', 'Clean the assigned table','07:15:02', '07:18:34', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:37:17', '08:39:53', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:35:34', '09:38:21', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:09:21', '11:12:17', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'C1')

-- 2124 3 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:40:10', '05:43:52', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'D1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:20:11', '06:22:14', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'E1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Clean table', 'Clean the assigned table','07:40:06', '07:45:10', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'D1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:10:42', '08:11:10', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'E2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','10:12:51', '10:20:11', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:40:11', '11:41:25', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'E1')

-- 2124 2 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:10:42', '05:14:31', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','07:03:52', '07:08:01', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Clean table', 'Clean the assigned table','07:55:01', '07:59:18', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:33:16', '08:36:43', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A3')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','10:43:12', '10:49:03', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:29:11', '11:35:25', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A2')

-- 2124 1 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','06:52:42', '06:55:21', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','07:03:52', '07:08:01', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Clean table', 'Clean the assigned table','08:21:01', '08:24:53', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'E2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','09:09:45', '09:12:05', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'E3')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','10:32:12', '10:40:14', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:21:42', '11:26:01', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'B2')

-- 2127 7 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','09:09:45', '09:12:05', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'E3')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','10:32:12', '10:40:14', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:21:42', '11:26:01', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:10:10', '05:12:40', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:40:32', '06:45:21', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Clean table', 'Clean the assigned table','07:11:00', '07:13:59', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'A3')

-- 2127 6 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','06:52:42', '06:55:21', CONVERT(date, DATEADD(DD,-6,GETDATE())), 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','07:03:52', '07:08:01', CONVERT(date, DATEADD(DD,-6,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Clean table', 'Clean the assigned table','08:21:01', '08:24:53', CONVERT(date, DATEADD(DD,-6,GETDATE())), 'E2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:10:42', '08:11:10', CONVERT(date, DATEADD(DD,-6,GETDATE())), 'E2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','10:12:51', '10:20:11', CONVERT(date, DATEADD(DD,-6,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:40:11', '11:41:25', CONVERT(date, DATEADD(DD,-6,GETDATE())), 'E1')

-- 2127 4 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:30:22', '08:33:19', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:19:43', '09:27:09', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:34:21', '11:36:17', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:8:10', '05:11:21', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:34:32', '06:48:11', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Clean table', 'Clean the assigned table','07:15:02', '07:18:34', CONVERT(date, DATEADD(DD,-4,GETDATE())), 'B2')

-- 2127 3 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:10:42', '05:14:31', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','07:03:52', '07:08:01', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Clean table', 'Clean the assigned table','07:55:01', '07:59:18', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:30:22', '08:33:19', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:19:43', '09:27:09', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:34:21', '11:36:17', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A1')

-- 2127 2 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:37:17', '08:39:53', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:35:34', '09:38:21', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:09:21', '11:12:17', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:10:10', '05:12:40', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:40:32', '06:45:21', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Clean table', 'Clean the assigned table','07:11:00', '07:13:59', CONVERT(date, DATEADD(DD,-2,GETDATE())), 'A3')

-- 2130 7 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:8:10', '05:11:21', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:34:32', '06:48:11', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Clean table', 'Clean the assigned table','07:15:02', '07:18:34', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:37:17', '08:39:53', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:35:34', '09:38:21', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:09:21', '11:12:17', CONVERT(date, DATEADD(DD,-7,GETDATE())), 'C1')

-- 2130 5 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:33:16', '08:36:43', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A3')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','10:43:12', '10:49:03', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:29:11', '11:35:25', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','05:40:10', '05:43:52', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'D1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','06:20:11', '06:22:14', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'E1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Clean table', 'Clean the assigned table','07:40:06', '07:45:10', CONVERT(date, DATEADD(DD,-5,GETDATE())), 'D1')

-- 2130 4 days ago --
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','08:30:22', '08:33:19', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Wash Dishes', 'Wash the diches since there are no customers at the moment','09:19:43', '09:27:09', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Customer Check', 'The customer has been waiting for their check','11:34:21', '11:36:17', CONVERT(date, DATEADD(DD,-3,GETDATE())), 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer in a while','06:52:42', '06:55:21', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Sweep the floow', 'Sweep the floor that is near the assigned table','07:03:52', '07:08:01', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Start_Time], [Finish_Time], [Task_Date], [Dining_Table_ID] ) VALUES (2130, 'Complete', 'Clean table', 'Clean the assigned table','08:21:01', '08:24:53', CONVERT(date, DATEADD(DD,-1,GETDATE())), 'E2')

-- 2130 1 days ago --

-- 2130 0 days ago --


GO