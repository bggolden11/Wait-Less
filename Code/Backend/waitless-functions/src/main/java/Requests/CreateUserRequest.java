package Requests;


/*
 * First name, last name, isManager (int), hiredate(auto gen), birthday, address, phone, token(generated from password, salary.
 */
public class CreateUserRequest {
    public String firstName, lastName, birthday, address, phone, passwordtoken;
    public double salary;
    public int isManager;
    public String title;
    //employee id not needed for request? to be returned from query
}
