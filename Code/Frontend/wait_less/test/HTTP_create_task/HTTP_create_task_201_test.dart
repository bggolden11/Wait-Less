import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/src/models/employee_login_credentials.dart';

void main() {

  test('HTTP Create Task API call should return status code 200 OK for successful task.dart creation', () async {
    int statusCode = 0;
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Create-Task?code=7ppCvZncW81fJggMNpSX1MbiuaklafIQR7bilfa0IMrkGtcNy6KUPA==",
          data: {'employeeId' : "2121", "title" : "Clean", "description" : "Clean the table", "table": "A1"});
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(201, statusCode);
  });

}