

import 'dart:convert';

import 'package:flutter_app/src/models/task_model.dart';

class TaskList {
  List<Task> taskList;


  TaskList({this.taskList});

  TaskList.taskListFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    taskList = arr.map((taskJson) => Task.taskFromJSON(taskJson)).toList();
  }


}