package DBO.DBOTypes;

public class UserAuthenticationDBO {
    public String firstName;
    public String lastName;
    public String passwordtoken;
    public boolean isManager;

    public UserAuthenticationDBO(String firstName, String lastName, String passwordtoken, boolean isManager){
        this.firstName = firstName;
        this.lastName = lastName;
        this.passwordtoken = passwordtoken;
        this.isManager = isManager;
    }
}
