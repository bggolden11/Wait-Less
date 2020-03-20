package Service;

import DBO.Queries.TaskDBO;
import DBO.Queries.UserDBO;
import Exceptions.UserNotFoundException;
import Requests.CreateTaskRequest;
import Requests.FinishTaskRequest;
import Requests.GetTasksBasedOnUserRequest;
import Requests.UpdateUserToTaskRequest;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;

public class TaskService {
    UserDBO getUserDBO = new UserDBO();
    TaskDBO taskDbo = new TaskDBO();

    /**
     *
     * @param request request for create task request
     * @param employeeId employeeId of the user to add the task to
     * @param message Message of the task
     * @return 201 if task successfully created with newly created task id
     *         404 if employeeID not found
     *         500 SQL error
     */
    public HttpResponseMessage createTask(HttpRequestMessage<Optional<CreateTaskRequest>> request, String employeeId, String message){
        try{
            getUserDBO.getEmployee(employeeId);
            return request.createResponseBuilder(HttpStatus.CREATED).body( taskDbo.createTask(employeeId, message)).build();
        } catch (UserNotFoundException e) {
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

        /**
     *
     * @param request request for finish task request
     * @param employeeID employeeId of the user to finish the task under
     * @return 201 if task successfully finished
     *         404 if employeeID not found
     *         500 SQL error
     */
    public HttpResponseMessage finishTask(HttpRequestMessage<Optional<FinishTaskRequest>> request, String taskID){
        try{
            taskDbo.finishTask(taskID);
            return request.createResponseBuilder(HttpStatus.OK).build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

    /**
     *
     * @param request http request to send and receive
     * @param taskId task ID of the task to be edited
     * @param employeeToAssignId employee to assign task to
     * @return 200 if successfully edited
     *         404 if new userId was not found
     *         500 if internal server error
     */
    public HttpResponseMessage updateTaskUser(HttpRequestMessage<Optional<UpdateUserToTaskRequest>> request, String taskId, String employeeToAssignId){
        try{
            getUserDBO.getEmployee(employeeToAssignId);
            taskDbo.updateTaskUser(taskId, employeeToAssignId);
            return request.createResponseBuilder(HttpStatus.OK).build();
        } catch (UserNotFoundException e) {
            return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Could not find user").build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

    /**
     *
     * @param request http request to send and receive
     * @param employeeId employee Id you would like to get tasks for
     * @return lists of completed tasks corresponding to that employee Id
     */
    public HttpResponseMessage getCompletedTasksBasedOnEmployeeID(HttpRequestMessage<Optional<GetTasksBasedOnUserRequest>> request, String employeeId){
        try{
            return request.createResponseBuilder(HttpStatus.OK).body(taskDbo.getCompletedTaskBasedOnEmployeeID(employeeId)).build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

    /**
     *
     * @param request http request to send and receive
     * @param employeeId employee Id you would like to get tasks for
     * @return lists of uncompleted tasks corresponding to that employee Id
     */
    public HttpResponseMessage getUncompletedTasksBasedOnEmployeeID(HttpRequestMessage<Optional<GetTasksBasedOnUserRequest>> request, String employeeId){
        try{
            return request.createResponseBuilder(HttpStatus.OK).body(taskDbo.getUncompletedTaskBasedOnEmployeeID(employeeId)).build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }

}