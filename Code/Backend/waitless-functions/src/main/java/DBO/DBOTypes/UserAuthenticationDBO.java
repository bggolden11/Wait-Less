package DBO.DBOTypes;

public class UserAuthenticationDBO {
    public String employeeID;
    public String passwordtoken;

    public UserAuthenticationDBO(String employeeID, String passwordtoken){
        this.employeeID = employeeID;
        this.passwordtoken = passwordtoken;
    }
}
