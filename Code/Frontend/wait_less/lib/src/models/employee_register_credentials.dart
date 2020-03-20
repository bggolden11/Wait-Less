
class EmployeeRegisterCredentials {
  final String employeeId;
  final String temporaryPassword;

  EmployeeRegisterCredentials({this.employeeId, this.temporaryPassword});

  EmployeeRegisterCredentials.registerfromJSON(Map<String, dynamic> parsedJSON)
      : employeeId = parsedJSON['employeeId'],
        temporaryPassword = parsedJSON['temporaryPassword'];


}