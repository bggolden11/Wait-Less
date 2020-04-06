import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/src/models/employee_login_credentials.dart';

void main() {

  test('HTTP Update Task API call should return status code 200 OK for successful task update', () async {
    int statusCode = 0;
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Update-Task-User?code=tz6IzOzltKMXwHzljWBglCdjL3Zw7GeZ3VO2xjrpTxckXlz3XMrt8A==",
          data: {'taskId' : "1003", 'employeeToAssignId' : "2127"});
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(200, statusCode);
  });

}