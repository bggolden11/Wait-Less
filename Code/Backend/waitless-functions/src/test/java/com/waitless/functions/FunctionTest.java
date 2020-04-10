package com.waitless.functions;

import Requests.CreateTaskRequest;
import Requests.CreateUserRequest;
import Requests.FinishTaskRequest;
import Requests.GetEmployeeRequest;
import Requests.GetTasksBasedOnUserRequest;
import Requests.LogEmployeeOutRequest;
import Requests.UserAuthenticationRequest;
import Requests.UpdateUserToTaskRequest;
import Response.CreateUserResponse;
import Service.DiningTablesService;
import Service.TaskService;
import Service.UserService;
import com.microsoft.azure.functions.ExecutionContext;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.logging.Logger;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;


/**
 * Unit test for Function class.
 */
public class FunctionTest {

    private UserService userService = mock(UserService.class);
    private TaskService taskService = mock(TaskService.class);
    private DiningTablesService diningTablesService = mock(DiningTablesService.class);
    private Function function;

    @BeforeEach
    public void beforeMethod(){
        function = new Function(userService,taskService,diningTablesService);
    }

    /**
     * Unit test for HttpTriggerJava method.
     */
    @Test
    public void testHttpTriggerJava() throws Exception {
        // Setup
        @SuppressWarnings("unchecked") final HttpRequestMessage<Optional<String>> req = mock(HttpRequestMessage.class);

        final Map<String, String> queryParams = new HashMap<>();
        queryParams.put("name", "Azure");
        doReturn(queryParams).when(req).getQueryParameters();

        final Optional<String> queryBody = Optional.empty();
        doReturn(queryBody).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);
        doReturn(Logger.getGlobal()).when(context).getLogger();

        // Invoke
        final HttpResponseMessage ret = function.run(req, context);

        // Verify
        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void addUser_proper() throws Exception {

        final HttpRequestMessage<Optional<CreateUserRequest>> req = mock(HttpRequestMessage.class);

        final CreateUserRequest createUserRequest =
                new CreateUserRequest("Ben", "Dover", "2001-12-12", "123 drive", "111-111-111", "Boss", "password");
        doReturn(Optional.of(createUserRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(userService).createUser(req, createUserRequest.firstName, createUserRequest.lastName, createUserRequest.birthday,
                createUserRequest.address, createUserRequest.phone, createUserRequest.title, createUserRequest.encryptedPassword);

        final HttpResponseMessage ret = function.addUser(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void addUser_improper() throws Exception {

        final HttpRequestMessage<Optional<CreateUserRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.addUser(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void authenticateUser_proper() throws Exception {

        final HttpRequestMessage<Optional<UserAuthenticationRequest>> req = mock(HttpRequestMessage.class);

        final UserAuthenticationRequest userAuthenticationRequest =
                new UserAuthenticationRequest("2121", "5z0ZYrqhDOm5nkK5oIEudg==");
        doReturn(Optional.of(userAuthenticationRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(userService).authenticate(req, userAuthenticationRequest.employeeID, userAuthenticationRequest.passwordtoken);

        final HttpResponseMessage ret = function.authenticateUser(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void authenticateUser_improper() throws Exception {

        final HttpRequestMessage<Optional<UserAuthenticationRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.authenticateUser(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void getEmployee_proper() throws Exception {

        final HttpRequestMessage<Optional<GetEmployeeRequest>> req = mock(HttpRequestMessage.class);

        final GetEmployeeRequest getEmployeeRequest =
                new GetEmployeeRequest("2124");
        doReturn(Optional.of(getEmployeeRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(userService).getUser(req, getEmployeeRequest.employeeId);

        final HttpResponseMessage ret = function.getEmployee(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void getEmployee_improper() throws Exception {

        final HttpRequestMessage<Optional<GetEmployeeRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.getEmployee(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void createTask_proper() throws Exception {

        final HttpRequestMessage<Optional<CreateTaskRequest>> req = mock(HttpRequestMessage.class);

        final CreateTaskRequest createTaskRequest =
                new CreateTaskRequest("2121", "Please work", "PLEAH", "A1");
        doReturn(Optional.of(createTaskRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(taskService).createTask(req, createTaskRequest.employeeId, createTaskRequest.title, createTaskRequest.description, createTaskRequest.table);

        final HttpResponseMessage ret = function.createTask(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void createTask_improper() throws Exception {

        final HttpRequestMessage<Optional<CreateTaskRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.createTask(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void finishTask_proper() throws Exception {

        final HttpRequestMessage<Optional<FinishTaskRequest>> req = mock(HttpRequestMessage.class);

        final FinishTaskRequest finishTaskRequest =
                new FinishTaskRequest("1001");
        doReturn(Optional.of(finishTaskRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(taskService).finishTask(req, finishTaskRequest.taskID);

        final HttpResponseMessage ret = function.finishTask(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void finishTask_improper() throws Exception {

        final HttpRequestMessage<Optional<FinishTaskRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.finishTask(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void updateTaskUser_proper() throws Exception {

        final HttpRequestMessage<Optional<UpdateUserToTaskRequest>> req = mock(HttpRequestMessage.class);

        final UpdateUserToTaskRequest updateUserToTaskRequest =
                new UpdateUserToTaskRequest("1001", "2121");
        doReturn(Optional.of(updateUserToTaskRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(taskService).updateTaskUser(req, updateUserToTaskRequest.taskId, updateUserToTaskRequest.employeeToAssignId);

        final HttpResponseMessage ret = function.updateTaskUser(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void updateTaskUser_improper() throws Exception {

        final HttpRequestMessage<Optional<UpdateUserToTaskRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.updateTaskUser(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void getAllEmployees_proper() throws Exception {

        final HttpRequestMessage<Optional<String>> req = mock(HttpRequestMessage.class);

        final String getAllEmployeesRequest = "1001, 1002";
        doReturn(Optional.of(getAllEmployeesRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(userService).getAllEmployees(req);

        final HttpResponseMessage ret = function.getAllEmployees(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void logUserOut_proper() throws Exception {

        final HttpRequestMessage<Optional<LogEmployeeOutRequest>> req = mock(HttpRequestMessage.class);

        final LogEmployeeOutRequest logEmployeeOutRequest =
                new LogEmployeeOutRequest("2121");
        doReturn(Optional.of(logEmployeeOutRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(userService).logUserOut(req, logEmployeeOutRequest.employeeId);

        final HttpResponseMessage ret = function.logUserOut(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void logUserOut_improper() throws Exception {

        final HttpRequestMessage<Optional<LogEmployeeOutRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.logUserOut(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void getUncompletedTasksBasedOnEmployeeID_proper() throws Exception {

        final HttpRequestMessage<Optional<GetTasksBasedOnUserRequest>> req = mock(HttpRequestMessage.class);

        final GetTasksBasedOnUserRequest getTasksBasedOnUserRequest =
                new GetTasksBasedOnUserRequest("2121");
        doReturn(Optional.of(getTasksBasedOnUserRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(taskService).getCompletedTasksBasedOnEmployeeID(req, getTasksBasedOnUserRequest.employeeId);

        final HttpResponseMessage ret = function.getCompletedTasksBasedOnEmployeeID(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void getUncompletedTasksBasedOnEmployeeID_improper() throws Exception {

        final HttpRequestMessage<Optional<LogEmployeeOutRequest>> req = mock(HttpRequestMessage.class);

        doReturn(Optional.empty()).when(req).getBody();

        doAnswer(new Answer<HttpResponseMessage.Builder>() {
            @Override
            public HttpResponseMessage.Builder answer(InvocationOnMock invocation) {
                HttpStatus status = (HttpStatus) invocation.getArguments()[0];
                return new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(status);
            }
        }).when(req).createResponseBuilder(any(HttpStatus.class));

        final ExecutionContext context = mock(ExecutionContext.class);

        final HttpResponseMessage ret = function.logUserOut(req, context);

        assertEquals(ret.getStatus(), HttpStatus.BAD_REQUEST);
    }

    @Test
    public void getAllDiningTables_proper() throws Exception {

        final HttpRequestMessage<Optional<String>> req = mock(HttpRequestMessage.class);

        final String getAllDiningTablesRequest = "1001";
        doReturn(Optional.of(getAllDiningTablesRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(diningTablesService).getAllDiningTables(req);

        final HttpResponseMessage ret = function.getAllDiningTables(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }

    @Test
    public void getAllTasks_proper() throws Exception {

        final HttpRequestMessage<Optional<String>> req = mock(HttpRequestMessage.class);

        final String getAllTasksRequest = "1001";
        doReturn(Optional.of(getAllTasksRequest)).when(req).getBody();

        HttpResponseMessage message = new HttpResponseMessageMock.HttpResponseMessageBuilderMock().status(HttpStatus.OK).body(new CreateUserResponse("1234")).build();

        final ExecutionContext context = mock(ExecutionContext.class);

        doReturn(message).when(taskService).getAllTasks(req);

        final HttpResponseMessage ret = function.getAllTasks(req, context);

        assertEquals(ret.getStatus(), HttpStatus.OK);
    }
}