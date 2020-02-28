package Response;

public class CreateUserResponse {
    String employeeId;
    String temporaryPassword;

    public CreateUserResponse(String employeeId, String temporaryPassword){
        this.employeeId = employeeId;
        this.temporaryPassword = temporaryPassword;
    }
}
