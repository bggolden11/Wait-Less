package com.waitless.functions;

import java.util.*;

import Members.Waiter;
import Requests.AddNewTableRequest;
import WaitersList.WaitersList;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.microsoft.azure.functions.annotation.*;
import com.microsoft.azure.functions.*;


/**
 * Azure Functions with HTTP Trigger.
 */
public class Function {
    WaitersList waiterInstance = WaitersList.getInstance();

    @FunctionName("HttpTrigger-Java")
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


    @FunctionName("AddWaiter")
    public HttpResponseMessage addWaiter(
            @HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<String>> request,
            final ExecutionContext context) {
        String query = request.getQueryParameters().get("name");
        String name = request.getBody().orElse(query);
        if (name == null) {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please pass a name on the waiter name in the request body").build();
        } else if (waiterInstance != null) {
                waiterInstance.addWaiter((new Waiter(name)));
                return request.createResponseBuilder(HttpStatus.OK).body("Waiter added succesfully").build();
        } else {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("getting the singleton failed").build();
        }
    }

    @FunctionName("GetWaiter")
    public HttpResponseMessage getWaiter(@HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<String>> request,
                                         final ExecutionContext context) {
        ObjectMapper mapper = new ObjectMapper();
        String query = request.getQueryParameters().get("name");
        String name = request.getBody().orElse(query);
        if (name == null) {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please pass a name on the waiter name in the request body").build();
        } else if (waiterInstance != null) {
            try{
                Waiter getWaiter = waiterInstance.getWaiter(name);
                if(getWaiter == null)
                    return request.createResponseBuilder(HttpStatus.NOT_FOUND).body("Waiter not found").build();
                else
                    return request.createResponseBuilder(HttpStatus.OK).body(mapper.writeValueAsString(getWaiter)).build();
            }
            catch(Exception e){
                context.getLogger().info("Throwing exception \n " + e.getStackTrace());
                return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("parsing json error").build();
            }
        } else {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("getting the singleton failed").build();
        }
    }

    @FunctionName("AddTableForWaiter")
    public HttpResponseMessage addTableForWaiter(@HttpTrigger(name = "req", methods = {HttpMethod.GET, HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<AddNewTableRequest>> request,
                                                final ExecutionContext context) {
        String query = request.getQueryParameters().get("name");
        AddNewTableRequest addNewTableRequest = request.getBody().orElse(null);

        if(addNewTableRequest!= null) {
            if (waiterInstance != null) {
                if (waiterInstance.addTable(addNewTableRequest.waiterName, addNewTableRequest.tableNumber)) {
                    return request.createResponseBuilder(HttpStatus.OK).body("Table successfully added").build();
                } else {
                    return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Adding table failed").build();
                }
            }
            else{
                return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Getting singleton failed ").build();
            }
        }
        else{
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body("Please input a valid waiter name and table number").build();
            }
    }
    @FunctionName("PasswordVerify")
    public HttpResponseMessage passwordVerify(@HttpTrigger(name = "req", methods = {HttpMethod.GET,HttpMethod.POST}, authLevel = AuthorizationLevel.FUNCTION) HttpRequestMessage<Optional<String>> request,
                                              final ExecutionContext context){
        String query = request.getQueryParameters().get("name");
        String password = request.getBody().orElse(query);
        //TODO: CALL USER AUTHENTICATION FUCNCTION
        return null; //Temp value


    }

}
