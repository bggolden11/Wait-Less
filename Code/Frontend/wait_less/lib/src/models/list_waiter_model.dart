

import 'dart:convert';

import 'package:flutter_app/src/models/waiter_model.dart';

import 'employee_login_credentials.dart';


class WaiterList {
  List<Waiter> waiterList;
  List<Waiter> loggedInWaiterList;
  List<Waiter> loggedOutWaiterList;

  WaiterList({this.waiterList});

  WaiterList.waiterListFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    waiterList = arr.map((waiterJson) => Waiter.waiterFromJSON(waiterJson)).toList();
//    waiterList.removeWhere((w) => !w.isLoggedIn || w.employeeID == EmployeeLoginCredentials.employeeId);
//    loggedInWaiterList = waiterList.takeWhile((w) => w.isLoggedIn);
//    loggedOutWaiterList = waiterList.takeWhile((w) => !w.isLoggedIn);
//    loggedInWaiterList.forEach(print);
//    loggedOutWaiterList.forEach(print);
  }


}