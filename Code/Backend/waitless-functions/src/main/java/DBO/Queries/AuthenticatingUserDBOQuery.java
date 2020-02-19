package DBO.Queries;

import DBO.DBOTypes.UserAuthenticationDBO;
import Exceptions.UserNotFoundException;

import java.sql.*;

public class AuthenticatingUserDBOQuery {

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
