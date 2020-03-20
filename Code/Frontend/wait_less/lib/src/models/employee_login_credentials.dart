
class EmployeeLoginCredentials {
  final String employeeId;
//  final String Fname;
//  final String Lname;
  final bool isManager;

  EmployeeLoginCredentials({this.isManager, this.employeeId});

  EmployeeLoginCredentials.loginfromJSON(Map<String, dynamic> parsedJSON, {this.employeeId})
      : isManager = parsedJSON['isManager'];


}