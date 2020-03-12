package Service;

import DBO.Queries.GetEmployeeDBOQuery;
import Exceptions.UserNotFoundException;
import Requests.GetEmployeeRequest;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;

public class GetEmployee {

    /**
     *
     * @param request HTTP request gotten from function api call
     * @param employeeId The employee id of the requested employee
     * @return Returns a json of all the information of an employee except the password
     */
    public HttpResponseMessage getUser(HttpRequestMessage<Optional<GetEmployeeRequest>> request, String employeeId) {
        try {
            return request.createResponseBuilder(HttpStatus.OK).body(new GetEmployeeDBOQuery().getEmployee(employeeId)).build();
        } catch (UserNotFoundException ex) {
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        } catch (SQLException ex) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }
}
