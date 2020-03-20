package DBO.DBOTypes;

public class UserAuthenticationDBO {
    public String employeeID;
    public String passwordtoken;
    public boolean isManager;

    public UserAuthenticationDBO(String employeeID, String passwordtoken, boolean isManager){
        this.employeeID = employeeID;
        this.passwordtoken = passwordtoken;
        this.isManager = isManager;
    }
}
