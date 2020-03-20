package DBO.Queries;

import DBO.DBOTypes.UserAuthenticationDBO;
import Exceptions.UserNotFoundException;
import Models.Employee;

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
                return new UserAuthenticationDBO(resultSet.getString(2), resultSet.getString(3),resultSet.getString(10),resultSet.getBoolean(4));
            }

        } finally {
            connection.close();
        }
    }

    /**
     *
     * @param employeeId employee ID of user you would like to log in
     * @throws SQLException error connecting to DB
     */
    public void logUserIn(String employeeId) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        String selectSql = "UPDATE Employee "
                + "SET Is_Logged_In = " + 1 + " "
                + "WHERE Employee_ID = " + employeeId + ";\n";
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
     * @param employeeId employee ID of user you would like to log out
     * @throws SQLException error connecting to DB
     */
    public void logUserOut(String employeeId) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        String selectSql = "UPDATE Employee "
                + "SET Is_Logged_In = " + 0 + " "
                + "WHERE Employee_ID = " + employeeId + ";\n";
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
                return new Employee(resultSet.getString(1), 
                    resultSet.getString(2), resultSet.getString(3), 
                        resultSet.getString(4).equals("1"), resultSet.getString(5).equals("1"), resultSet.getString(12));
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
    public List<Employee> getLoggedInEmployees() throws SQLException {
        List<Employee> employees = new ArrayList<>();
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
                employees.add(new Employee(resultSet.getString(1), 
                    resultSet.getString(2), resultSet.getString(3), 
                        resultSet.getString(4).equals("1"), resultSet.getString(5).equals("1"), resultSet.getString(12)));
            }
            return employees;

        } finally {
            connection.close();
        }
    }
}
