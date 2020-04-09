
class EmployeeRegisterCredentials {
  final String employeeId;
  final String temporaryPassword;

  EmployeeRegisterCredentials({this.employeeId, this.temporaryPassword});

  EmployeeRegisterCredentials.registerFromJSON(Map<String, dynamic> parsedJSON, String password)
      : employeeId = parsedJSON['employeeId'],
        temporaryPassword = password;


}