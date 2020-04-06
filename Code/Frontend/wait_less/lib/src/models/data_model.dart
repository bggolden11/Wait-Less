

import 'dart:math';

class DataPoint {
  DateTime date;
  double avgTime;
  final int taskCount;

  DataPoint({this.date, this.avgTime, this.taskCount});

  DataPoint.dataPointFromJSON(Map<String, dynamic> parsedJSON,) :
        taskCount = parsedJSON['numberOfCompletedTasks'] ?? 0 {
    avgTime = parsedJSON['averageTimeTaken'] ?? 0.0;
    List<int> d = parsedJSON['date'].toString().split('-').map((s) => int.parse(s)).toList();
    date = DateTime(d[0], d[1], d[2]);

  }

  @override
  String toString() {
    return 'Date: ${date.month}-${date.day}-${date.year}\nAvg: $avgTime\nNumTasks: $taskCount\n\n';
  }

}