package Requests;

public class CreateTaskRequest {
    public String employeeId, title, description, table;

    public CreateTaskRequest(String employeeId, String title, String description, String table)
    {
        this.employeeId = employeeId;
        this.title = title;
        this.description = description;
        this.table = table;
    }
}
