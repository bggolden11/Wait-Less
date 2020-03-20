
class EmployeeLoginCredentials {
  static String employeeId;
////  final String Fname;
////  final String Lname;
  static bool isManager;
//
//  EmployeeLoginCredentials({this.isManager, this.employeeId});
//
//  EmployeeLoginCredentials.loginfromJSON(Map<String, dynamic> parsedJSON, {this.employeeId})
//      : isManager = parsedJSON['isManager'];

  /// Singleton for the Employee Login class
  static final EmployeeLoginCredentials _singleton = new EmployeeLoginCredentials._internal();
  factory EmployeeLoginCredentials() {
    return _singleton;
  }

  static void loginFromJSON(Map<String, dynamic> parsedJSON, String nEmployeeId) {
    isManager = parsedJSON['isManager'];
    employeeId = nEmployeeId;
  }


  EmployeeLoginCredentials._internal() {
    print('Hello');
  }

}