package com.waitless.functions;

import java.sql.SQLException;
import java.util.*;

import Exceptions.UserNotFoundException;
import Requests.CreateTaskRequest;
import Requests.CreateUserRequest;
import Requests.GetEmployeeRequest;
import Requests.UserAuthenticationRequest;
import Service.CreateTask;
import Service.GetEmployee;
import Service.UserAuthentication;
import Service.CreateUser;
import com.microsoft.azure.functions.annotation.*;
import com.microsoft.azure.functions.*;


/**
 * Azure Functions with HTTP Trigger.
 */
public class Function {
    //WaitersList waiterInstance = WaitersList.getInstance();

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
                                              final ExecutionContext context){
        CreateUserRequest createUserRequest = request.getBody().orElse(null);
        if(createUserRequest != null)
            return (new CreateUser()).create(request,createUserRequest.firstName,createUserRequest.lastName,
                                             createUserRequest.birthday, createUserRequest.address,
                                             createUserRequest.phone, createUserRequest.title);
        else{
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }

    @FunctionName("Authenticate-User")
    public HttpResponseMessage AuthenticateUser(@HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<UserAuthenticationRequest>> request,
                                              final ExecutionContext context){
        String query = request.getQueryParameters().get("name");
        UserAuthenticationRequest userAuthenticationRequest = request.getBody().orElse(null);
        if(userAuthenticationRequest != null) {
            return (new UserAuthentication()).authenticate(request,userAuthenticationRequest.employeeID,userAuthenticationRequest.passwordtoken);
        }
        else{
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }

    @FunctionName("Get-Employee")
    public HttpResponseMessage getEmployee(@HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<GetEmployeeRequest>> request,
                                                final ExecutionContext context){
        String query = request.getQueryParameters().get("name");
        GetEmployeeRequest getEmployeeRequest = request.getBody().orElse(null);
        if(getEmployeeRequest != null) {
            return (new GetEmployee().getUser(request,getEmployeeRequest.employeeId));
        }
        else{
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid employeeId").build();
        }
    }

    @FunctionName("Create-Task")
    public HttpResponseMessage createTask(@HttpTrigger(name = "req", methods = {HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<CreateTaskRequest>> request,
                                          final ExecutionContext context){
        CreateTaskRequest createTaskRequest = request.getBody().orElse(null);
        if(createTaskRequest != null)
            return (new CreateTask()).create(request,createTaskRequest.employeeId,createTaskRequest.message);
        else{
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid username and password").build();
        }
    }
}
