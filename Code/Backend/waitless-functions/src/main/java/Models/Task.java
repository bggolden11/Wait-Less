package Models;

import java.sql.Date;
import java.sql.Time;

public class Task {
    public String taskID;
    public String employeeID;
    public String status;
    public String title;
    public String description;
    public Time completionTime;
    public String tableNumber;

    public Task(String taskID, String employeeID, String status, String title, String description, Time completionTime, String tableNumber) {
        this.taskID = taskID;
        this.employeeID = employeeID;
        this.status = status;
        this.title = title;
        this.description = description;
        this.tableNumber = tableNumber;
        this.completionTime = completionTime;
    }
}
