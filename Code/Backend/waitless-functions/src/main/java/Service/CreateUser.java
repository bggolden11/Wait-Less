package Service;


import Authentication.AES;
import DBO.Queries.CreateUserDBOQuery;

import java.sql.SQLException;

public class CreateUser {
    final String secretKey = "[B@37a71e93";

    public String firstName, lastName, birthday, address, phone, password;
    public int isManager;
    public double salary;

    public boolean create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) throws SQLException {
        String encryptedPassword = (new AES()).encrypt(passwordtoken);
        return (new CreateUserDBOQuery()).create(firstName, lastName, isManager, birthday, address, phone, salary, encryptedPassword, title);
    }

}
