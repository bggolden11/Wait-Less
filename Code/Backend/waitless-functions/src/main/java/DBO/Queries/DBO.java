package DBO.Queries;
import com.typesafe.config.*;


public interface DBO {
    Config conf = ConfigFactory.load();

    String hostName = conf.getString("DBO-config.Host_Name");
    String dbName =  conf.getString("DBO-config.DB_Name");
    String user = conf.getString("DBO-config.Username");
    String password = conf.getString("DBO-config.Password");
    String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
            + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);

}
