package Requests;


/*
 * First name, last name, isManager (int), hiredate(auto gen), birthday, address, phone, token(generated from password, salary.
 */

/*

    "firstName":"Chris P the third.",
    "lastName":"Bacon the second",
    "birthday":"2001-12-12",
    "address":"123 drive",
    "phone":"111-111-111",
     "title":"Boss"
}
 */
public class CreateUserRequest {
    public String firstName, lastName, birthday, address, phone, title, encryptedPassword;

    public CreateUserRequest(String firstName, String lastName, String birthday, String address, String phone, String title, String encryptedPassword) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.title = title;
        this.encryptedPassword = encryptedPassword;
    }
}
