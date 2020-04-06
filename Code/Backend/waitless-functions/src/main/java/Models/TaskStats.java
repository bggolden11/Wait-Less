package Models;

import Exceptions.ObtainingAverageException;

import java.sql.Time;
import java.util.OptionalDouble;

public class TaskStats {
    public String date;
    public int numberOfCompletedTasks;
    public Double averageTimeTaken;

    public TaskStats(String date, int numberOfCompletedTasks, OptionalDouble averageTimeTaken) throws ObtainingAverageException {
        this.date = date;
        this.numberOfCompletedTasks = numberOfCompletedTasks;
    if (averageTimeTaken.isPresent())
      this.averageTimeTaken =
          Double.valueOf(new Time((long) averageTimeTaken.getAsDouble())
              .toString()
              .substring(3)
              .replace(":", "."));
    else throw new ObtainingAverageException();
    }
}
