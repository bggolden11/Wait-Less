package DBO.Queries;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

import java.sql.*;

public class CreateUserDBOQuery implements DBO {

    public boolean create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        String selectSql = "INSERT INTO Employee"
                + "(FName, LName, isManager, Hire_Date, Birth_Date, Address, Phone, Token, Salary, Title)"
                + "VALUES ('" + firstName + "', '" + lastName + "', '" + isManager + "', " + "GETDATE()" + ", " + "GETDATE()" + ", '" + address + "', '" + phone + "', '" + passwordtoken + "', '" + salary + "', '" + title + "');\n";

        try
        {
             Statement statement = connection.createStatement();
             statement.executeUpdate(selectSql);
            return true;
        }
        finally {
            connection.close();
        }
    }
}
