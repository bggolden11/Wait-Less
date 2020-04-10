package Requests;

public class UpdateUserToTaskRequest {
    public String taskId, employeeToAssignId;

    public UpdateUserToTaskRequest(String taskId, String employeeToAssignId)
    {
        this.taskId = taskId;
        this.employeeToAssignId = employeeToAssignId;
    }
}
