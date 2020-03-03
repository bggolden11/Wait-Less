package DBO.Queries;

import java.sql.*;

public class CreateUserDBOQuery implements DBO {

    public String create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) throws SQLException {
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
}
