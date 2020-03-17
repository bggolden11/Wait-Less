package Models;

public class Employee {
    public String employeeID;
    public String firstName;
    public String lastName;
    public String title;
    public boolean isLoggedIn;
    public boolean isManager;

    public Employee(String employeeID, String firstName, String lastName, boolean isManager, boolean isLoggedIn, String title) {
        this.employeeID = employeeID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.isManager = isManager;
        this.isLoggedIn = isLoggedIn;
        this.title = title;
    }
}
