

import 'package:intl/intl.dart';

class Waiter {
  final String employeeID;
  final String fName;
  final String lName;
  final String title;
  final bool isLoggedIn;
  final bool isManager;
  final String bday;
  final String tables;

  Waiter( {this.employeeID, this.fName, this.lName, this.title, this.isLoggedIn, this.isManager, this.bday, this.tables } );

  Waiter.waiterFromJSON(Map<String, dynamic> parsedJSON)
      : employeeID = parsedJSON['employeeId'] ?? parsedJSON['employeeID'] ?? '',
        fName = parsedJSON['firstName'] ?? '',
        lName = parsedJSON['lastName'] ?? '',
        title = parsedJSON['title'] ?? '',
        isLoggedIn = parsedJSON['isLoggedIn'] ?? false,
        isManager = parsedJSON['isManager'] ?? false,
        bday = parsedJSON['birthday'] ?? '',
        tables = parsedJSON['tables'] ?? '';

  bool isBDayToday(){
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMd('en_US');
    String formattedDate = formatter.format(now);
    var formatter2 = new DateFormat.yMMMMd('en_US');
    String formattedDate2 = formatter.format(now);
    print(formattedDate);
    print(formattedDate2);
  }

  @override
  String toString() {
    return '$fName $lName';
  }
}