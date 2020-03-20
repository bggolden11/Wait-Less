package Models;

import java.sql.Time;

public class Task {
    public String taskID;
    public String employeeID;
    public String status;
    public String message;
    public Time startTime;
    public Time finishTime;

    public Task(String taskID, String employeeID, String status, String message, Time startTime, Time finishTime) {
        this.taskID = taskID;
        this.employeeID = employeeID;
        this.status = status;
        this.message = message;
        this.startTime = startTime;
        this.finishTime = finishTime;
    }
}
