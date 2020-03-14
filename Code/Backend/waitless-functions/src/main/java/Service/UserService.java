package Service;


import DBO.Queries.UserDBO;
import Encryption.AES;
import Exceptions.UserNotFoundException;
import Requests.CreateUserRequest;
import Requests.GetEmployeeRequest;
import Requests.UserAuthenticationRequest;
import Response.CreateUserResponse;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;
import java.util.Random;

/*
 TODO: The request should really be returning a CREATED (201).
 */

public class UserService {
    UserDBO userDBO = new UserDBO();

    /**
     *
     * @param request http request to send and receive
     * @param firstName first name of new user
     * @param lastName last name of new user
     * @param birthday birthday of new user
     * @param address address of new user
     * @param phone phone number of new user
     * @param title title of new user
     * @return 200 if user successfully added with new employee Id
     *         500 if internal server error
     */
    public HttpResponseMessage createUser(HttpRequestMessage<Optional<CreateUserRequest>> request, String firstName, String lastName, String birthday, String address, String phone, String title) {
        String initialPassword = String.format("%06d",(new Random()).nextInt(999999));
        String encryptedPassword = (new AES()).encrypt(initialPassword);
        try {
                String employeeID = userDBO.createUser(firstName, lastName, title.equals("Manager") ? 1 : 0, birthday, address, phone, 10.0, encryptedPassword, title);
                return request.createResponseBuilder(HttpStatus.OK).body(new CreateUserResponse(employeeID,initialPassword)).build();
        }
        catch (SQLException e){
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

    /**
     *
     * @param request http request to send and receive
     * @param employeeID employeeID to authenticate with
     * @param password unencrypted password
     * @return 200 if valid username and password
     *         401 if invalid password
     *         404 if username not found
     *         500 if internal server error
     */
    public HttpResponseMessage authenticate(HttpRequestMessage<Optional<UserAuthenticationRequest>> request, String employeeID, String password) {
        String encryptedPassword = (new AES()).encrypt(password);
        try{
            if(userDBO.userAuthenticate(employeeID).passwordtoken.equals(encryptedPassword)){
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

    /**
     *
     * @param request HTTP request gotten from function api call
     * @param employeeId The employee id of the requested employee
     * @return Returns a json of all the information of an employee except the password
     */
    public HttpResponseMessage getUser(HttpRequestMessage<Optional<GetEmployeeRequest>> request, String employeeId) {
        try {
            return request.createResponseBuilder(HttpStatus.OK).body(new UserDBO().getEmployee(employeeId)).build();
        } catch (UserNotFoundException ex) {
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        } catch (SQLException ex) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }
}
