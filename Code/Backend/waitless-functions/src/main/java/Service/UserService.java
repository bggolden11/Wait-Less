package Service;


import DBO.DBOTypes.UserAuthenticationDBO;
import DBO.Queries.UserDBO;
import Encryption.AES;
import Exceptions.UserNotFoundException;
import Models.UserAuthenticateResponse;
import Requests.CreateUserRequest;
import Requests.GetEmployeeRequest;
import Requests.LogEmployeeOutRequest;
import Requests.UserAuthenticationRequest;
import Response.CreateUserResponse;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;



public class UserService {
    UserDBO userDBO = new UserDBO();
    AES aes = new AES();

    /*
 TODO: This request should really be returning a CREATED (201).
    */
    /**
     *
     * @param request http request to send and receive
     * @param firstName first name of new user
     * @param lastName last name of new user
     * @param birthday birthday of new user
     * @param address address of new user
     * @param phone phone number of new user
     * @param title title of new user
     * @param encryptedPassword encrypted password for the user to be set
     * @return 200 if user successfully added with new employee Id
     *         500 if internal server error
     */
    public HttpResponseMessage createUser(HttpRequestMessage<Optional<CreateUserRequest>> request, String firstName, String lastName, String birthday, String address, String phone, String title, String encryptedPassword) {
        try {
                String employeeID = userDBO.createUser(firstName, lastName, title.equals("Manager") ? 1 : 0, birthday, address, phone, 10.0, encryptedPassword, title);
                return request.createResponseBuilder(HttpStatus.OK).body(new CreateUserResponse(employeeID)).build();
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
        try{
            UserAuthenticationDBO userAuthenticationRequest = userDBO.userAuthenticate(employeeID);
            if(userAuthenticationRequest.passwordtoken.equals(password)){
                userDBO.logUserIn(employeeID);
                return request.createResponseBuilder(HttpStatus.OK).body(new UserAuthenticateResponse(userAuthenticationRequest.firstName,userAuthenticationRequest.lastName,userAuthenticationRequest.isManager)).build();
            }
            else
                return request.createResponseBuilder(HttpStatus.UNAUTHORIZED).body("Valid user but incorrect password").build();
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
     * @return 200 returns the employee information corresponding to that ID
     *         404 if that employee id was not found
     *         500 if internal server error
     */
    public HttpResponseMessage getUser(HttpRequestMessage<Optional<GetEmployeeRequest>> request, String employeeId) {
        try {
            return request.createResponseBuilder(HttpStatus.OK).body(userDBO.getEmployee(employeeId)).build();
        } catch (UserNotFoundException ex) {
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        } catch (SQLException ex) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

    /**
     *
     * @param request HTTP request gotten from function api call
     * @param employeeId Employee Id you would like to log out
     * @return 200 log out was successful
 *             500 error connecting to SQL database
     */
    public HttpResponseMessage logUserOut(HttpRequestMessage<Optional<LogEmployeeOutRequest>> request, String employeeId) {
        try {
            userDBO.getEmployee(employeeId);
            userDBO.logUserOut(employeeId);
            return request.createResponseBuilder(HttpStatus.OK).build();
        }
        catch (UserNotFoundException ex){
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        }
        catch (SQLException ex) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

    /**
     *
     * @param request TTP request gotten from function api call
     * @return 200 list of logged in employees
     *         500 if internal server error
     */
    public HttpResponseMessage getLoggedInUser(HttpRequestMessage<Optional<String>> request){
        try{
            return request.createResponseBuilder(HttpStatus.OK).body(userDBO.getLoggedInEmployees()).build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }
}
