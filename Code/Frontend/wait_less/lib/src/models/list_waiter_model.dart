

import 'dart:convert';

import 'package:flutter_app/src/models/waiter_model.dart';

import 'employee_login_credentials.dart';


class WaiterList {
  List<Waiter> waiterList;
  static bool isPopulated = false;

  WaiterList.waiterListFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    waiterList = arr.map((waiterJson) => Waiter.waiterFromJSON(waiterJson)).toList();
    isPopulated = true;
  }

  List<Waiter> getLoggedInWaiters(){
    return waiterList.where((w) => w.isLoggedIn && (w.employeeID != EmployeeLoginCredentials.employeeId)).toList();
  }

  List<Waiter> getAllWaiters(){
    return waiterList;
  }

}