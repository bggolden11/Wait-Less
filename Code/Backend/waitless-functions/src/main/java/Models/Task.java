package Models;


import java.sql.Date;
import java.sql.Time;

public class Task {
    public String taskID;
    public String employeeID;
    public String status;
    public String title;
    public String description;
    public String completionTime;
    public Date taskDate;
    public String tableNumber;

    public Task(String taskID, String employeeID, String status, String title, String description, String completionTime, Date taskDate, String tableNumber) {
        this.taskID = taskID;
        this.employeeID = employeeID;
        this.status = status;
        this.title = title;
        this.description = description;
        this.tableNumber = tableNumber;
        this.taskDate = taskDate;
        if (completionTime != null && completionTime.contains("."))
            completionTime = completionTime.substring(0, completionTime.indexOf("."));
        this.completionTime = completionTime;

    }
}
