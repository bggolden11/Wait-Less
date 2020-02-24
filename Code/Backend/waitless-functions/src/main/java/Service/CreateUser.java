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

    public HttpResponseMessage create(HttpRequestMessage<Optional<CreateUserRequest>> request, String firstName, String lastName, int isManager, String birthday, String address, String phone, double salary, String passwordtoken, String title) {
        String encryptedPassword = (new AES()).encrypt(passwordtoken);
        try {
            if (new CreateUserDBOQuery().create(firstName, lastName, isManager, birthday, address, phone, salary, encryptedPassword, title)) {
                return request.createResponseBuilder(HttpStatus.OK).body("Added new waiter").build();
            } else {
                return request.createResponseBuilder(HttpStatus.UNAUTHORIZED).body("New waiter was not created").build();
            }
        }
        catch (SQLException e){
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

}
