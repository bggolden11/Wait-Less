

import 'dart:convert';

import 'package:flutter_app/src/models/waiter_model.dart';


class WaiterList {
  List<Waiter> waiterList;


  WaiterList({this.waiterList});

  WaiterList.waiterListFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    waiterList = arr.map((waiterJson) => Waiter.waiterFromJSON(waiterJson)).toList();
  }


}