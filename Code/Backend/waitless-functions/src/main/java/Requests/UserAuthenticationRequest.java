package Requests;

public class UserAuthenticationRequest {
    public String employeeID;
    public String passwordtoken;

    public UserAuthenticationRequest(String employeeID, String passwordtoken) {
        this.employeeID = employeeID;
        this.passwordtoken = passwordtoken;
    }
}
