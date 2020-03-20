
class EmployeeLoginCredentials {
  static String employeeId;
  static String fName;
  static String lName;
  static bool isManager;

  /// Singleton for the Employee Login class
  static final EmployeeLoginCredentials _singleton = new EmployeeLoginCredentials._internal();
  factory EmployeeLoginCredentials() {
    return _singleton;
  }

  static void loginFromJSON(Map<String, dynamic> parsedJSON, String nEmployeeId) {
    fName = parsedJSON['firstName'] ?? '';
    lName = parsedJSON['lastName'] ?? '';
    isManager = parsedJSON['isManager'] ?? false;
    employeeId = nEmployeeId;
  }


  EmployeeLoginCredentials._internal() {
    print('Hello');
  }

}