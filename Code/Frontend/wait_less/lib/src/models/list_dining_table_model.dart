

import 'dart:convert';

import 'package:flutter_app/src/models/dining_table_model.dart';
import 'dart:core';

class DiningTableList {
  List<DiningTable> diningTableList;

  DiningTableList({this.diningTableList});

  DiningTableList.diningTableListFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    diningTableList = arr.map((taskJson) => DiningTable.diningTableFromJSON(taskJson)).toList();
  }

}