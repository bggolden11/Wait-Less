

import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/src/models/list_waiter_model.dart';
import 'package:flutter_app/src/models/task_model.dart';
import 'package:flutter_app/src/models/waiter_model.dart';
import 'package:flutter_app/src/widgets/waiter_list.dart';

class TaskList {
  List<Task> taskList;


  TaskList({this.taskList});

  TaskList.taskListFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    taskList = arr.map((taskJson) => Task.taskFromJSON(taskJson)).toList();
  }

  TaskList.taskListWithWaitersFromJSON(String parsedJSON, List<Waiter> waiterList){
    print('awdoawdwd');
    var arr = jsonDecode(parsedJSON)['result'] as List;
    taskList = arr.map((taskJson) => Task.taskFromJSON(taskJson)).toList();
    taskList.forEach((t) => t.employeeName = waiterList.firstWhere((w) => w.employeeID == t.employeeID).toString());
    taskList.forEach((t) => print(t.employeeName));
  }

  void updateEmployeeNames() async {
    final List<Waiter> waiterList = await getWaiters(false);
    print('awaaaa');
  }

}