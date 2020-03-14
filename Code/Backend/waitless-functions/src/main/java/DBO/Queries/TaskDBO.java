package DBO.Queries;

import java.sql.*;

public class TaskDBO implements DBO{

    /**
     *
     * @param employeeId employee ID of the user you would like to assign the task to
     * @param message What the current task is
     * @return The TaskId of the create task
     * @throws SQLException Error with the Sql database
     */

    public String createTask(String employeeId, String message) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "INSERT INTO Task"
                + "(Employee_ID, Status, Message, Start_Time)"
                + "OUTPUT Inserted.Task_ID "
                + "VALUES ('" + employeeId + "', '" + "Active" + "', '" + message + "', " + "GETDATE());\n";

        try (Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(selectSql)){

            // Print results from select statement
            if (!resultSet.next()) {
                throw new SQLException();
            } else {
                return resultSet.getString(1);
            }
        }
        finally {
            connection.close();
        }
    }

//    public static void main(String[] test){
//        editUserAssociatedToTask("1003","2124");
//    }

    public void updateUserToTask(String taskId, String employeeToAssignId) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "UPDATE Task "
                + "SET Employee_ID = " + employeeToAssignId + " "
                + "WHERE Task_ID = " + taskId + ";\n";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(selectSql);
        }
        finally {
            connection.close();
        }

    }
}
