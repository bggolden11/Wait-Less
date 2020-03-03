package Models;

public class Employee {
    public String firstName;
    public String lastName;
    public boolean isManager;
    public String hireDate;
    public String birthday;
    public String address;
    public String phone;
    public double salary;
    public String title;

    public Employee(String firstName, String lastName, boolean isManager, String hireDate, String birthday, String address, String phone, double salary, String title) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.isManager = isManager;
        this.hireDate = hireDate;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.salary = salary;
        this.title = title;
    }
}
