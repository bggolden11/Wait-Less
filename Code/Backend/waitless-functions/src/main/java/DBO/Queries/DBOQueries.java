package DBO;

import DBOTypes.UserAuthenticationDBO;
import Exceptions.UserNotFoundException;

import java.sql.*;

public class DBOQueries {

//    public static void main(String[] args){
//        String hostName = "waitless.database.windows.net"; // update me
//        String dbName = "WaitlessDB"; // update me
//        String user = "wladmin"; // update me
//        String password = "Waitlesspassword123"; // update me
//        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//
//        String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
//                + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
//        Connection connection = null;
//            try {
////                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//                Class.forName(driver);
//
//                connection = DriverManager.getConnection(url);
//                String schema = connection.getSchema();
//                System.out.println("Successful connection - Schema: " + schema);
//
//                System.out.println("Query data example:");
//                System.out.println("=========================================");
//
//                // Create and execute a SELECT SQL statement.
//                String selectSql = "SELECT * "
//                        + "FROM Employee "
//                        + "WHERE Employee_ID = 2122;\n";
//
//                try (Statement statement = connection.createStatement();
//                     ResultSet resultSet = statement.executeQuery(selectSql)) {
//
//                    // Print results from select statement
//                    System.out.println("Top 20 categories:");
//                    while (resultSet.next())
//                    {
//                        System.out.println(resultSet.getString(1) + " "
//                                + resultSet.getString(9));
//                    }
//                    connection.close();
//                }
//            }
//            catch (Exception e) {
//                e.printStackTrace();
//            }
//    }

    String hostName = "waitless.database.windows.net"; // update me
    String dbName = "WaitlessDB"; // update me
    String user = "wladmin"; // update me
    String password = "Waitlesspassword123"; // update me
    String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
            + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
    Connection connection = null;

    public UserAuthenticationDBO userAuthenticate(String username) throws SQLException, UserNotFoundException {

        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

        System.out.println("Query data example:");
        System.out.println("=========================================");

        // Create and execute a SELECT SQL statement.
        String selectSql = "SELECT * "
                + "FROM Employee "
                + "WHERE Employee_ID = " + username + ";\n";

        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectSql)) {

            // Print results from select statement
            if (!resultSet.next()) {
                throw new UserNotFoundException();
            } else {
                return new UserAuthenticationDBO(resultSet.getString(1), resultSet.getString(9));
            }

        } finally {
            connection.close();
        }
    }
}
