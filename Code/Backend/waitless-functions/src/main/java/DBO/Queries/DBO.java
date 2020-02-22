package DBO.Queries;

public interface DBO {
    String hostName = "waitless.database.windows.net"; // update me
    String dbName = "WaitlessDB"; // update me
    String user = "wladmin"; // update me
    String password = "Waitlesspassword123"; // update me
    String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
            + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
}
