package Models;

import java.sql.Time;

public class Task {
    public String Task_ID;
    public String Employee_ID;
    public String Status;
    public String Message;
    public Time Start_Time;
    public Time Finish_Time;

    public Task(String task_ID, String employee_ID,
                String status, String message, Time start_Time,
                Time finish_Time) {
        Task_ID = task_ID;
        Employee_ID = employee_ID;
        Status = status;
        Message = message;
        Start_Time = start_Time;
        Finish_Time = finish_Time;
    }
}
