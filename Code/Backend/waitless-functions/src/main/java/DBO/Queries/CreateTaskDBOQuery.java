package DBO.Queries;

import java.sql.*;

/*
1001
2121
Active
Cleanup Table 10
2020-03-13T03:31:31.0970000



 String selectSql = "INSERT INTO Employee"
                + "(F_Name, L_Name, Is_Manager, Hire_Date, Birth_Date, Address, Phone, Token, Salary, Title)"
                + "OUTPUT Inserted.Employee_ID "
                + "VALUES ('" + firstName + "', '" + lastName + "', '" + isManager + "', " + "GETDATE()" + ", " + "GETDATE()" + ", '" + address + "', '" + phone + "', '" + passwordtoken + "', '" + salary + "', '" + title + "');\n";

 */



public class CreateTaskDBOQuery implements DBO{

    /**
     *
     * @param employeeId employee ID of the user you would like to assign the task to
     * @param status The current status of the task
     * @param message What the current task is
     * @return The TaskId of the create task
     * @throws SQLException Error with the Sql database
     */

    public  String createTask(String employeeId, String status, String message) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "INSERT INTO Task"
                + "(Employee_ID, Status, Message, Start_Time)"
                + "OUTPUT Inserted.Task_ID "
                + "VALUES ('" + employeeId + "', '" + status + "', '" + message + "', " + "GETDATE());\n";

        try (Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(selectSql)){

            // Print results from select statement
            if (!resultSet.next()) {
                throw new SQLException();
            } else {
                return resultSet.getString(1);
            }
        }

    }
}
