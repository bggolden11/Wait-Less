import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/src/models/employee_login_credentials.dart';

void main() {

  test('HTTP Authentication API call should return status code 200 OK for waiter login', () async {
    int statusCode = 0;
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Authenticate-User?code=akKyCeyPLfZgmFZWFyrqhW43N3eZqq6I82aC2N8Tp4Drt9fEYrrVwA==",
          data: {"employeeID" : "2127", "passwordtoken" : "${EncrypterUtil.encrypt('1234')}"});
      EmployeeLoginCredentials.loginFromJSON(json.decode(response.data.toString()), "2127");
      if(EmployeeLoginCredentials.isManager)
        statusCode = 408;
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(200, statusCode);
  });

}