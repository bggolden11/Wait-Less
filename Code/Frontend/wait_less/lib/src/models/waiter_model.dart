

class Waiter {
  final String employeeID;
  final String fName;
  final String lName;
  final String title;
  final bool isLoggedIn;
  final bool isManager;

  Waiter( {this.employeeID, this.fName, this.lName, this.title, this.isLoggedIn, this.isManager} );

  Waiter.waiterFromJSON(Map<String, dynamic> parsedJSON)
      : employeeID = parsedJSON['employeeId'] ?? parsedJSON['employeeID'] ?? '',
        fName = parsedJSON['firstName'] ?? '',
        lName = parsedJSON['lastName'] ?? '',
        title = parsedJSON['title'] ?? '',
        isLoggedIn = parsedJSON['isLoggedIn'] ?? false,
        isManager = parsedJSON['isManager'] ?? false;

  @override
  String toString() {
    return '$fName $lName';
  }
}