package DBO.Queries;

import Exceptions.UserNotFoundException;
import Models.Employee;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;

public class GetEmployeeDBOQuery implements DBO {

    /**
     *
     * @param employeeID employeeId of the requested user
     * @return A type employee
     * @throws SQLException Thrown when error connecting to sql database
     * @throws UserNotFoundException Thrown when user is not found
     */
    public Employee getEmployee(String employeeID) throws SQLException, UserNotFoundException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "SELECT * "
                + "FROM Employee "
                + "WHERE Employee_ID = " + employeeID + ";\n";

        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectSql)) {

            // Print results from select statement
            if (!resultSet.next()) {
                throw new UserNotFoundException();
            } else {
                return new Employee(resultSet.getString(2),resultSet.getString(3),
                        resultSet.getInt(4) == 1, resultSet.getString(5),
                        resultSet.getString(6),resultSet.getString(7),resultSet.getString(8),
                        resultSet.getDouble(10),resultSet.getString(11) );
            }

        } finally {
            connection.close();
        }
    }
}
