package DBO.Queries;

import DBO.DBOTypes.UserAuthenticationDBO;
import Exceptions.UserNotFoundException;
import Models.Employee;
import Models.GetLoggedInEmployee;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

public class UserDBO implements DBO {

    /**
     *
     * @param employeeID employeeID to get authentication credentials from
     * @return UserAuthenticationDBO
     * @throws SQLException Error connecting to SQL DB
     * @throws UserNotFoundException User Id was not found
     */
    public UserAuthenticationDBO userAuthenticate(String employeeID) throws SQLException, UserNotFoundException {
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
                return new UserAuthenticationDBO(resultSet.getString(1), resultSet.getString(10));
            }

        } finally {
            connection.close();
        }
    }

    /**
     *
     * @param firstName first name of new user
     * @param lastName last name of new user
     * @param isManager boolean if user is manager
     * @param birthday birthday of new user
     * @param address address of new user
     * @param phone phone number of new user
     * @param salary salary of user
     * @param passwordtoken password token of new user
     * @param title title of new user
     * @return new created employeeID of user
     * @throws SQLException Error with database
     */
    public String createUser(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        String selectSql = "INSERT INTO Employee"
                + "(F_Name, L_Name, Is_Manager, Hire_Date, Birth_Date, Address, Phone, Token, Salary, Title)"
                + "OUTPUT Inserted.Employee_ID "
                + "VALUES ('" + firstName + "', '" + lastName + "', '" + isManager + "', " + "GETDATE()" + ", " + "GETDATE()" + ", '" + address + "', '" + phone + "', '" + passwordtoken + "', '" + salary + "', '" + title + "');\n";

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
                        resultSet.getInt(4) == 1, resultSet.getString(6),
                        resultSet.getString(7),resultSet.getString(8),resultSet.getString(9),
                        resultSet.getDouble(11),resultSet.getString(12));
            }

        } finally {
            connection.close();
        }
    }

    /**
     *
     * @return List of all logged in users
     * @throws SQLException Error connecting to DB
     */
    public List<GetLoggedInEmployee> getLoggedInEmployees() throws SQLException {
        List<GetLoggedInEmployee> listOfLoggedInEmployees = new ArrayList<>();
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "SELECT * "
                + "FROM Employee "
                + "WHERE Is_Logged_In = " + 1 + ";\n";

        try (Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(selectSql)) {

            while(resultSet.next()){
                listOfLoggedInEmployees.add(new GetLoggedInEmployee(resultSet.getString(1),
                                                                    resultSet.getString(2),
                                                                    resultSet.getString(3)));
            }
            return listOfLoggedInEmployees;

        } finally {
            connection.close();
        }
    }
}
