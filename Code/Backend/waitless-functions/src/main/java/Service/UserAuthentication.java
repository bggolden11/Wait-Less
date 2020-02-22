package Service;


import Encryption.AES;
import DBO.Queries.AuthenticatingUserDBOQuery;
import Exceptions.UserNotFoundException;

import java.sql.SQLException;

public class UserAuthentication {
    public boolean authenticate(String employeeID, String password) throws UserNotFoundException, SQLException {
        String encryptedPassword = (new AES()).encrypt(password);
        return (new AuthenticatingUserDBOQuery()).userAuthenticate(employeeID).passwordtoken.equals(encryptedPassword);
    }
}
