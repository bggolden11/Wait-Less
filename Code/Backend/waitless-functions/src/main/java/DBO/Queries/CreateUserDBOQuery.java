package DBO.Queries;

import DBO.DBOTypes.CreateUserDBO;
import Exceptions.UserNotFoundException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

import java.sql.*;

public class CreateUserDBOQuery implements DBO {

    public boolean create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        // Create and execute a SELECT SQL statement.

        String selectSql = "INSERT INTO Employee"
                + "(FName, LName, isManager, Hire_Date, Birth_Date, Address, Phone, Token, Salary)"
                + "VALUES ('" + firstName + "', '" + lastName + "', '" + isManager + "', '" + DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDateTime.now()) + "', '" + birthday + "', '" + address + "', '" + phone + "', '" + passwordtoken + "', '" + salary + "');\n";

        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectSql)) {

              ResultSetMetaData rsmd = resultSet.getMetaData();
              int columnsNumber = rsmd.getColumnCount();
               while (resultSet.next()) {
                  for (int i = 1; i <= columnsNumber; i++) {
                      if (i > 1) System.out.print(",  ");
                      String columnValue = resultSet.getString(i);
                      System.out.print(columnValue + " " + rsmd.getColumnName(i));
                  }
                  System.out.println("");
              }
            return true;
            // Print results from select statement
            //public CreateUserDBO(String firstName, String lastName, int isManager, String hiredate, String birthday, String address, String phone, int employeeID, String passwordtoken)
            //return new CreateUserDBO(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(0), resultSet.getString(9));

        } finally {
            connection.close();
        }
    }
}
