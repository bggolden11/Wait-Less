package Service;


import Encryption.AES;
import DBO.Queries.CreateUserDBOQuery;
import Requests.CreateUserRequest;
import Response.CreateUserResponse;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;
import java.util.Random;

public class CreateUser {

    public HttpResponseMessage create(HttpRequestMessage<Optional<CreateUserRequest>> request, String firstName, String lastName, String birthday, String address, String phone, String title) {
        Random rnd = new Random();
        String temporaryPassword = String.format("%06d",rnd.nextInt(9999));
        String encryptedPassword = (new AES()).encrypt(temporaryPassword);
        try {
            if (new CreateUserDBOQuery().create(firstName, lastName, title.equals("Manager") ? 1 : 0, birthday, address, phone, 10.0, encryptedPassword, title)) {
                return request.createResponseBuilder(HttpStatus.OK).body(new CreateUserResponse(temporaryPassword)).build();
            } else {
                return request.createResponseBuilder(HttpStatus.UNAUTHORIZED).body("New waiter was not created").build();
            }
        }
        catch (SQLException e){
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

}
