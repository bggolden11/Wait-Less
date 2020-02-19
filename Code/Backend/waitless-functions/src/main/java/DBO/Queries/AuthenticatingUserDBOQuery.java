package DBO.Queries;

import DBO.DBOTypes.UserAuthenticationDBO;
import Exceptions.UserNotFoundException;

import java.sql.*;

public class AuthenticatingUserDBOQuery implements DBO {

    Connection connection = null;

    public UserAuthenticationDBO userAuthenticate(String username) throws SQLException, UserNotFoundException {

        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);

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
