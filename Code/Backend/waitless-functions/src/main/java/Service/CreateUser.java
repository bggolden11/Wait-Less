package Service;


import Encryption.AES;
import DBO.Queries.CreateUserDBOQuery;
import Requests.CreateUserRequest;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;

public class CreateUser {
    final String secretKey = "[B@37a71e93";

    public String firstName, lastName, birthday, address, phone, password;
    public int isManager;
    public double salary;

    public HttpResponseMessage create(HttpRequestMessage<Optional<CreateUserRequest>> request, String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) {
        String encryptedPassword = (new AES()).encrypt(passwordtoken);
        try {
            if (new CreateUserDBOQuery().create(firstName, lastName, isManager, birthday, address, phone, salary, encryptedPassword, title)) {
                return request.createResponseBuilder(HttpStatus.OK).body("Added new waiter").build();
            } else {
                return request.createResponseBuilder(HttpStatus.UNAUTHORIZED).body("Valid username but incorrect password").build();
            }
        }
        catch (SQLException e){
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

}
