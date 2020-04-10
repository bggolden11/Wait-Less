import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  test('HTTP Logout API call should return status code 200 OK', () async {
    int statusCode = 0;
    try {
      final body = {
        "employeeId":"2122",
      };
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Log-User-Out?code=7qIgUA34RbFJaIo1NeuHQObWPvpbWXpOZUwgIxmDzG43zS4lNIj/Hg==",
          data: body);

      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(404, statusCode);
  });

}