package com.waitless.functions;

import java.util.*;

import Models.Employee;
import Requests.*;
import Service.TaskService;
import Service.UserService;
import com.microsoft.azure.functions.annotation.*;
import com.microsoft.azure.functions.*;


/**
 * Azure Functions with HTTP Trigger.
 */
public class Function {
    UserService userService = new UserService();
    TaskService taskService = new TaskService();

    @FunctionName("HttpTrigger-Java-Testing")
    public HttpResponseMessage run(
            @HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<String>> request,
            final ExecutionContext context) {
        context.getLogger().info("Java HTTP trigger processed a request.");

        // Parse query parameter
        String query = request.getQueryParameters().get("name");
        String name = request.getBody().orElse(query);

        if (name == null) {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please pass a name on the query string or in the request body").build();
        } else {
            return request.createResponseBuilder(HttpStatus.OK).body("Harsh is very pretty " + name).build();
        }
    }

    @FunctionName("Add-User")
    public HttpResponseMessage AddUser(@HttpTrigger(name = "req", methods = {HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<CreateUserRequest>> request,
                                       final ExecutionContext context) {
        CreateUserRequest createUserRequest = request.getBody().orElse(null);
        if (createUserRequest != null)
            return userService.createUser(request, createUserRequest.firstName, createUserRequest.lastName, createUserRequest.title);
        else {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }

    @FunctionName("Authenticate-User")
    public HttpResponseMessage AuthenticateUser(@HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<UserAuthenticationRequest>> request,
                                                final ExecutionContext context) {
        String query = request.getQueryParameters().get("name");
        UserAuthenticationRequest userAuthenticationRequest = request.getBody().orElse(null);
        if (userAuthenticationRequest != null) {
            return userService.authenticate(request, userAuthenticationRequest.employeeID, userAuthenticationRequest.passwordtoken);
        } else {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }

    @FunctionName("Get-Employee")
    public HttpResponseMessage getEmployee(@HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<GetEmployeeRequest>> request,
                                           final ExecutionContext context) {
        String query = request.getQueryParameters().get("name");
        GetEmployeeRequest getEmployeeRequest = request.getBody().orElse(null);
        if (getEmployeeRequest != null) {
            return userService.getUser(request, getEmployeeRequest.employeeId);
        } else {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid employeeId").build();
        }
    }

    @FunctionName("Create-Task")
    public HttpResponseMessage createTask(@HttpTrigger(name = "req", methods = {HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<CreateTaskRequest>> request,
                                          final ExecutionContext context) {
        CreateTaskRequest createTaskRequest = request.getBody().orElse(null);
        if (createTaskRequest != null)
            return taskService.createTask(request, createTaskRequest.employeeId, createTaskRequest.message);
        else {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }

    @FunctionName("Update-Task-User")
    public HttpResponseMessage updateTaskUser(@HttpTrigger(name = "req", methods = {HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<UpdateUserToTaskRequest>> request,
                                              final ExecutionContext context) {
        UpdateUserToTaskRequest updateUserToTaskRequest = request.getBody().orElse(null);
        if (updateUserToTaskRequest != null)
            return taskService.updateTaskUser(request, updateUserToTaskRequest.taskId, updateUserToTaskRequest.employeeToAssignId);
        else {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }

    @FunctionName("Get-Logged-In-Users")
    public HttpResponseMessage getLoggedInUsers(@HttpTrigger(name = "req", methods = {HttpMethod.GET}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<String>> request,
                                              final ExecutionContext context){
        return userService.getLoggedInUser(request);
    }

    @FunctionName("Log-User-Out")
    public HttpResponseMessage logUserOut(@HttpTrigger(name = "req", methods = {HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<LogEmployeeOutRequest>> request,
                                                final ExecutionContext context) {
        LogEmployeeOutRequest logEmployeeOutRequest = request.getBody().orElse(null);
        if(logEmployeeOutRequest != null)
            return userService.logUserOut(request,logEmployeeOutRequest.employeeId);
        else
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
    }

    @FunctionName("Get-Tasks-Based-On-User")
    public HttpResponseMessage getTasksBasedOnUser(@HttpTrigger(name = "req", methods = {HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<GetTasksBasedOnUserRequest>> request,
                                          final ExecutionContext context) {
        GetTasksBasedOnUserRequest getTasksBasedOnUserRequest = request.getBody().orElse(null);
        if(getTasksBasedOnUserRequest != null)
            return taskService.getTasksBasedOnEmployeeID(request,getTasksBasedOnUserRequest.employeeId);
        else
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
    }
}

