
class Task {
  final String taskID;
  final String employeeID;
  String employeeName;
  final String status;
  final String title;
  final String description;
  final String tableNumber;

  Task({this.taskID, this.employeeID, this.status, this.title, this.description, this.tableNumber});

  Task.taskFromJSON(Map<String, dynamic> parsedJSON,)
      : taskID = parsedJSON['taskID'] ?? parsedJSON['taskId'] ?? '',
        employeeID = parsedJSON['employeeId'] ?? parsedJSON['employeeID'] ?? '',
        status = parsedJSON['status'] ?? '',
        title = parsedJSON['title'] ?? '',
        description = parsedJSON['description'] ?? '',
        tableNumber = parsedJSON['tableNumber'] ?? '';


}