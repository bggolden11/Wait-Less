package DBO.Queries;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

import java.sql.*;

public class CreateUserDBOQuery implements DBO {

//    public static void main(String[] arc){
//        try {
//            System.out.println(create("Omar", "Salas", 1, "10-03-1998", "123 lane", "123-456-7890", 999.99, "password", "booos"));
//
//        }
//        catch(SQLException e){
//            System.out.println(e.getErrorCode() + "   " + e.getMessage());
//            System.out.println("FAILED!");
//        }
//    }

    public boolean create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        // Create and execute a SELECT SQL statement.

        String selectSql = "INSERT INTO Employee"
                + "(FName, LName, isManager, Hire_Date, Birth_Date, Address, Phone, Token, Salary, Title)"
                + "VALUES ('" + firstName + "', '" + lastName + "', '" + isManager + "', " + "GETDATE()" + ", " + "GETDATE()" + ", '" + address + "', '" + phone + "', '" + passwordtoken + "', '" + salary + "', '" + title + "');\n";

        try
             {
                 Statement statement = connection.createStatement();
                 statement.executeUpdate(selectSql);

//              ResultSetMetaData rsmd = resultSet.getMetaData();
//              int columnsNumber = rsmd.getColumnCount();
//               while (resultSet.next()) {
//                  for (int i = 1; i <= columnsNumber; i++) {
//                      if (i > 1) System.out.print(",  ");
//                      String columnValue = resultSet.getString(i);
//                      System.out.print(columnValue + " " + rsmd.getColumnName(i));
//                  }
//                  System.out.println("");
//              }
            return true;
            // Print results from select statement
            //public CreateUserDBO(String firstName, String lastName, int isManager, String hiredate, String birthday, String address, String phone, int employeeID, String passwordtoken)
            //return new CreateUserDBO(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(0), resultSet.getString(9));

        }
        finally {
            connection.close();
        }
    }
}
