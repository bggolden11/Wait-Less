package DBO.DBOTypes;

public class CreateUserDBO {

  public String firstName, lastName, birthday, address, phone, passwordtoken;
  public int isManager;
  public double salary;

  public CreateUserDBO(
      String firstName,
      String lastName,
      int isManager,
      String hiredate,
      String birthday,
      String address,
      String phone,
      double salary,
      String passwordtoken) {
    this.passwordtoken = passwordtoken;

    this.firstName = firstName;
    this.lastName = lastName;
    this.isManager = isManager;
    this.birthday = birthday;
    this.address = address;
    this.phone = phone;
    this.salary = salary;
  }
}
