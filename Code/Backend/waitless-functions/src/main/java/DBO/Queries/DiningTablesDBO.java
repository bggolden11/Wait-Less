package DBO.Queries;

import Models.DiningTable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiningTablesDBO implements DBO {
  /**
   * @return list of all the dining tables
   * @throws SQLException error connecting to DB
   */
  public List<DiningTable> getAllDiningTables() throws SQLException {
    List<DiningTable> diningTables = new ArrayList<>();
    Connection connection = null;
    connection = DriverManager.getConnection(url);
    String schema = connection.getSchema();
    System.out.println("Successful connection - Schema: " + schema);
    String selectSql =
        "SELECT Dining_Table_ID, Employee_ID, Seats, Is_Active,Is_Occupied, Seating_Time, Reservation_Name, Has_Birthday,Special_Request "
            + "FROM DiningTable ";
    try (Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(selectSql)) {

      // Print results from select statement
      while (resultSet.next()) {
        diningTables.add(
            new DiningTable(
                resultSet.getString(1),
                resultSet.getInt(2),
                resultSet.getInt(3),
                resultSet.getBoolean(4),
                resultSet.getBoolean(5),
                resultSet.getTime(6),
                resultSet.getString(7),
                resultSet.getBoolean(8),
                resultSet.getString(9)));
      }
      return diningTables;

    } finally {
      connection.close();
    }
  }
}
