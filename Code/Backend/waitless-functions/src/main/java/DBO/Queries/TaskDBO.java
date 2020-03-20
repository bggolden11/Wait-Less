package DBO.Queries;

import Exceptions.TaskNotFoundException;
import Models.Employee;
import Models.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDBO implements DBO{

    /**
     *
     * @param employeeId employee ID of the user you would like to assign the task to
     * @param description What the current task is
     * @return The TaskId of the create task
     * @throws SQLException Error with the Sql database
     */

    public static void main(String[] x) throws SQLException {
        createTask("2121","TEST's","test's","A1");
    }
    public static String createTask(String employeeId, String title, String description, String table) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String insertSql = "INSERT INTO Task"
                + "(Employee_ID, Status, Title, Description, Dining_Table_ID)"
                + "OUTPUT Inserted.Task_ID "
                + "VALUES (?, 'Active', ?, ?, ?) ";

        try {
            PreparedStatement preparedStmt = connection.prepareStatement(insertSql);
            preparedStmt.setString(1, employeeId);
            preparedStmt.setString(2,title);
            preparedStmt.setString(3,description);
            preparedStmt.setString(4,table);

            ResultSet resultSet = preparedStmt.executeQuery();

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

        /**
     *
     * @param taskID task ID to be completed
     * @return The TaskId of the finished task
     * @throws SQLException Error with the Sql database
     */
    public void finishTask(String taskID) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "UPDATE Task "
                + "SET Finish_Time = GETDATE(), Status = 'Complete' "
                + "WHERE Task_ID = " + taskID + ";\n";

        try (Statement statement = connection.createStatement())
        {
            statement.executeUpdate(selectSql);
        }  
        finally {
            connection.close();
        }
    }

    /**
     *
     * @param taskId The task ID to update
     * @param employeeToAssignId the employee Id to change the task to
     * @throws SQLException Error connecting to SQL database
     */
    public void updateTaskUser(String taskId, String employeeToAssignId) throws SQLException {
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

    /**
     *
     * @param taskId Id of th task you would like to retrive
     * @return the task requested for
     * @throws SQLException error connecting to SQL DB
     * @throws TaskNotFoundException Could not find requested task
     */
    public Task getTask(String taskId) throws SQLException, TaskNotFoundException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "SELECT * "
                + "FROM Task "
                + "WHERE Task_ID = " + taskId + ";\n";

       try{
           Statement statement = connection.createStatement();
           ResultSet resultSet = statement.executeQuery(selectSql);

           if (!resultSet.next()) {
               throw new TaskNotFoundException();
           } else {
               return new Task(resultSet.getString(1),
                       resultSet.getString(2),
                       resultSet.getString(3),
                       resultSet.getString(4),
                       resultSet.getString(5),
                       resultSet.getString(10));
           }
       }
       finally {
           connection.close();
       }
    }

    /**
     *
     * @param employeeID employee Id you would like to get the tasks for
     * @return lists of uncompleted tasks corresponding to that employee Id
     * @throws SQLException error connecting to SQL DB
     */
    public List<Task> getUncompletedTaskBasedOnEmployeeID(String employeeID) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "SELECT * "
                + "FROM Task "
                + "WHERE Employee_ID = " + employeeID + "AND Finish_Time IS NULL"+ ";\n";

        return getTasks(connection, selectSql);
    }

    /**
     *
     * @param employeeID employee Id you would like to get the tasks for
     * @return lists of completed tasks corresponding to that employee Id
     * @throws SQLException error connecting to SQL DB
     */
    public List<Task> getCompletedTaskBasedOnEmployeeID(String employeeID) throws SQLException {

        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "SELECT * "
                + "FROM Task "
                + "WHERE Employee_ID = " + employeeID + "AND Finish_Time IS NOT NULL"+ ";\n";

        return getTasks(connection, selectSql);
    }

    /**
     * HELPER FUNCTION TO EXTRACT TASKS
     * @param connection SQL connection
     * @param selectSql Select Statement to run based on operation
     * @return Tasks gotten from SQL statement
     * @throws SQLException ERROR connecting TO DB
     */
    private List<Task> getTasks(Connection connection, String selectSql) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectSql)) {

            while(resultSet.next()){
                tasks.add(new Task(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(10)));
            }
            return tasks;

        } finally {
            connection.close();
        }
    }


}
