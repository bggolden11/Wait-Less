package DBO.Queries;

public interface DBO {
    String hostName = "waitlessserver.database.windows.net";
    String dbName = "WaitlessDB";
    String user = "wladmin";
    String password = "Waitlesspassword123";
    String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
            + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);

}
