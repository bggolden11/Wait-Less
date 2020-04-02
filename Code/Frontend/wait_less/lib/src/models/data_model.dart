

class DataPoint {
   DateTime date;
  final double avgTime;
  final int taskCount;

  DataPoint({this.date, this.avgTime, this.taskCount});

//  DataPoint.dataPointFromJSON(Map<String, dynamic> parsedJSON,)
//      : date = DateTime( int.parse(parsedJSON['date'].toString().split(' ')[2]),
//                         monthToNum(parsedJSON['date'].toString().split(' ')[0]),
//                         int.parse(parsedJSON['date'].toString().split(' ')[1].split(',')[0]) ) ?? DateTime(2020,1,1),
//        avgTime = parsedJSON['averageTimeTaken'] ?? 0.0,
//        taskCount = parsedJSON['numberOfCompletedTasks'] ?? 0;

  DataPoint.dataPointFromJSON(Map<String, dynamic> parsedJSON,) :
        avgTime = parsedJSON['averageTimeTaken'] ?? 0.0,
        taskCount = parsedJSON['numberOfCompletedTasks'] ?? 0 {
    List<String> d = parsedJSON['date'].toString().split(' ');
    date = DateTime(int.parse(d[2]), monthToNum(d[0]), int.parse(d[1].substring(0,3)));

  }

  static int monthToNum(String m){
    switch(m){
      case 'Jan': return 1; break;
      case 'Feb': return 2; break;
      case 'Mar': return 3; break;
      case 'Apr': return 4; break;
      case 'May': return 5; break;
      case 'Jun': return 6; break;
      case 'Jul': return 7; break;
      case 'Aug': return 8; break;
      case 'Sep': return 9; break;
      case 'Oct': return 10; break;
      case 'Nov': return 11; break;
      case 'Dec': return 12; break;
    }
    return 0;
  }

  @override
  String toString() {
    return 'Date: ${date.month}-${date.day}-${date.year}\nAvg: $avgTime\nNumTasks: $taskCount\n\n';
  }

}