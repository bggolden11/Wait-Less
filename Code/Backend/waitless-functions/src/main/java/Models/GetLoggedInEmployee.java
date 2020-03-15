package Models;

public class GetLoggedInEmployee {
    public String employeeId;
    public String firstName;
    public String lastName;

    public GetLoggedInEmployee(String employeeId, String firstName, String lastName) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
    }

}
