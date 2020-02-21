
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  /// Singleton for the HTTP Client class
  static final ToastMessage _singleton = new ToastMessage._internal();
  factory ToastMessage() {
    return _singleton;
  }

  static void show(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

  ToastMessage._internal();
}