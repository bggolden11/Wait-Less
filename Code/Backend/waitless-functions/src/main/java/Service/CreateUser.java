package Service;


import DBO.Queries.CreateUserDBOQuery;
import Service.UserAuthentication.AES;
import Exceptions.UserNotFoundException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Base64;

public class CreateUser {
    final String secretKey = "[B@37a71e93";

    public String firstName, lastName, birthday, address, phone, password;
    public int isManager;
    public double salary;

    public boolean create(String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken) throws SQLException {
        String encryptedPassword = AES.encrypt(passwordtoken, secretKey);
        return true;
//        return (new CreateUserDBOQuery()).create(firstName, lastName, isManager, birthday, address, phone, salary, encryptedPassword);
    }

}
