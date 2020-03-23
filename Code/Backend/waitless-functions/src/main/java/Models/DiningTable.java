package Models;

import java.sql.Time;

public class DiningTable {
  public String diningTableId;
  public int employeeId;
  public int seats;
  public boolean isActive;
  public boolean isOccupied;
  public Time seatingTime;
  public String reservationName;
  public boolean hasBirthday;
  public String specialRequest;

  public DiningTable(
      String diningTableId,
      int employeeId,
      int seats,
      boolean isActive,
      boolean isOccupied,
      Time seatingTime,
      String reservationTime,
      boolean hasBirthday,
      String specialRequest) {
    this.diningTableId = diningTableId;
    this.employeeId = employeeId;
    this.seats = seats;
    this.isActive = isActive;
    this.isOccupied = isOccupied;
    this.seatingTime = seatingTime;
    this.reservationName = reservationTime;
    this.hasBirthday = hasBirthday;
    this.specialRequest = specialRequest;
  }
}
