package Models;

public class UserAuthenticateResponse {
    public String firstName;
    public String lastName;
    public boolean isManager;

    public UserAuthenticateResponse(String firstName, String lastName, boolean isManager) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.isManager = isManager;
    }


}
