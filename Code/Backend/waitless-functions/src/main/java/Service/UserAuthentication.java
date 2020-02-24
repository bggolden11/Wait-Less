package Service;


import Encryption.AES;
import DBO.Queries.AuthenticatingUserDBOQuery;
import Exceptions.UserNotFoundException;
import Requests.UserAuthenticationRequest;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;

public class UserAuthentication {
    public HttpResponseMessage authenticate(HttpRequestMessage<Optional<UserAuthenticationRequest>> request, String employeeID, String password) {
        String encryptedPassword = (new AES()).encrypt(password);
        try{
            if((new AuthenticatingUserDBOQuery()).userAuthenticate(employeeID).passwordtoken.equals(encryptedPassword)){
                return request.createResponseBuilder(HttpStatus.OK).body("Valid username and password").build();
            }
            return request.createResponseBuilder(HttpStatus.UNAUTHORIZED).body("Valid username but incorrect password").build();
        }
        catch (UserNotFoundException e){
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        }
        catch (SQLException e){
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

}
