select * from [Employee];
select * from [Task];
select * from [DiningTable];

-- select E.Employee_ID, E.F_Name, E.L_Name, E.Title, E.Is_Manager, E.Is_Logged_In, E.Birth_Date, STRING_AGG(CONVERT(nvarchar(max),ISNULL(T.Dining_Table_ID,'N/A')), ', ') as tables
-- from  [Employee] E
-- inner join [DiningTable] T on E.Employee_ID = T.Employee_ID
-- group by E.Employee_ID, E.F_Name, E.L_Name, E.Title, E.Is_Manager, E.Is_Logged_In, E.Birth_Date




