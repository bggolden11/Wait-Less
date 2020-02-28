
class EmployeeCredentials {
  final String employeeId;
  final String temporaryPassword;

  EmployeeCredentials({this.employeeId, this.temporaryPassword});

  EmployeeCredentials.fromJSON(Map<String, dynamic> parsedJSON)
      : employeeId = parsedJSON['employeeId'],
        temporaryPassword = parsedJSON['temporaryPassword'];


}