import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/src/models/employee_login_credentials.dart';

void main() {

  test('HTTP Get completed tasks API call should return status code 404 NOT FOUND invalid user', () async {
    int statusCode = 0;
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Get-Inactive-Tasks-Based-On-User?code=Ciyv62I26diHC58R7NFzBxZsMeiGIEe5IiLVuavOJo7ZzZR/L465eQ==",
          data: {"employeeId" : "2122"});
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(404, statusCode);
  });

}