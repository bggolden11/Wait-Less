import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('HTTP Authentication API call should return status code 404 NOT_FOUND (User not found)', () async {
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-20200207161542196.azurewebsites.net/api/Authenticate-User?code=PKBKwmotyqfjS35XeHYqzfDLAkIkeh0zT1UrQKbbqK3lgPanNwTgbg==",
          data: {"employeeID" : "1111", "passwordtoken" : "1234"});

    } on DioError catch (e){
      expect(e.response.statusCode, 404);
    }
  });

}

