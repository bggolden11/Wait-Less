package Models;

import Exceptions.ObtainingAverageException;

import java.sql.Date;
import java.sql.Time;
import java.util.OptionalDouble;

public class TaskStats {
    public String date;
    public int numberOfCompletedTasks;
    public String averageTimeTaken;

    public TaskStats(String date, int numberOfCompletedTasks, OptionalDouble averageTimeTaken) throws ObtainingAverageException {
        this.date = date;
        this.numberOfCompletedTasks = numberOfCompletedTasks;
        if(averageTimeTaken.isPresent())
            this.averageTimeTaken = (new Time((long)averageTimeTaken.getAsDouble())).toString();
        else
            throw new ObtainingAverageException();
    }
}
