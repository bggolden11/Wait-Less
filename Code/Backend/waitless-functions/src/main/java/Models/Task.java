package Models;

import java.sql.Time;

public class Task {
    public String taskID;
    public String employeeID;
    public String status;
    public String title;
    public String description;
    public String tableNumber;
    public Time startTime;
    public Time finishTime;

    public Task(String taskID, String employeeID, String status, String title, String description, String tableNumber, Time startTime, Time finishTime) {
        this.taskID = taskID;
        this.employeeID = employeeID;
        this.status = status;
        this.title = title;
        this.description = description;
        this.tableNumber = tableNumber;
        this.startTime = startTime;
        this.finishTime = finishTime;
    }
}
