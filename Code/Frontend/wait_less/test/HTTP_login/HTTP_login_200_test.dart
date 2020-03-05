import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('HTTP Authentication API call should return status code 200 OK', () async {
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-20200207161542196.azurewebsites.net/api/Authenticate-User?code=PKBKwmotyqfjS35XeHYqzfDLAkIkeh0zT1UrQKbbqK3lgPanNwTgbg==",
          data: {"employeeID" : "2121", "passwordtoken" : "1234"});
      expect(response.statusCode, 200);
    } on DioError catch (e){ }
  });

}