package DBO.Queries;

import DBO.DBOTypes.UserAuthenticationDBO;
import Exceptions.UserNotFoundException;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

import java.sql.*;

public class CreateUserDBOQuery implements DBO {

    public String create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        String selectSql = "INSERT INTO Employee"
                + "(FName, LName, isManager, Hire_Date, Birth_Date, Address, Phone, Token, Salary, Title)"
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
}
