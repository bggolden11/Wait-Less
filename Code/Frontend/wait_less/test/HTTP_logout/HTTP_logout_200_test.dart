import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/src/screens/login_screen.dart';

void main() {

  test('HTTP Logout API call should return status code 200 OK', () async {
    int statusCode = 0;
    try {
      final body = {
        "employeeId":"2127",
      };

      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Log-User-Out?code=7qIgUA34RbFJaIo1NeuHQObWPvpbWXpOZUwgIxmDzG43zS4lNIj/Hg==",
          data: body);

      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
  });

}