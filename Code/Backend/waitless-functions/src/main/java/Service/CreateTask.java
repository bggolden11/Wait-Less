package Service;

import DBO.Queries.CreateTaskDBOQuery;
import DBO.Queries.GetEmployeeDBOQuery;
import Exceptions.UserNotFoundException;
import Requests.CreateTaskRequest;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;

public class CreateTask {

    /**
     *
     * @param request request for create task request
     * @param employeeId employeeId of the user to add the task to
     * @param message Message of the task
     * @return 201 if task successfully created
     *         404 if employeeID not found
     *         500 SQL error
     */

    public HttpResponseMessage create(HttpRequestMessage<Optional<CreateTaskRequest>> request, String employeeId, String message){
        try{
            (new GetEmployeeDBOQuery()).getEmployee(employeeId);
            return request.createResponseBuilder(HttpStatus.CREATED).body(new CreateTaskDBOQuery().createTask(employeeId, message)).build();
        } catch (UserNotFoundException e) {
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }
}
