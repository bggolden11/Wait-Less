package DBO;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class DBOQueries {
    String hostName = "waitless.database.windows.net"; // update me
    String dbName = "WaitlessDB"; // update me
    String user = "wladmin"; // update me
    String password = "Waitlesspassword123"; // update me
    String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
            + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
    Connection connection = null;

    public void userAuthenticate(String username, String password){
        try {
            connection = DriverManager.getConnection(url);
            String schema = connection.getSchema();
            System.out.println("Successful connection - Schema: " + schema);

            System.out.println("Query data example:");
            System.out.println("=========================================");

            // Create and execute a SELECT SQL statement.
            String selectSql = "SELECT * "
                    + "FROM Employee "
                    + "WHERE Employee_ID = " + username + "AND Employee_Token = " + password + "\n";

            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(selectSql)) {

                // Print results from select statement
                System.out.println("Top 20 categories:");
                while (resultSet.next())
                {
                    System.out.println(resultSet.getString(1) + " "
                            + resultSet.getString(2));
                }
                connection.close();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
