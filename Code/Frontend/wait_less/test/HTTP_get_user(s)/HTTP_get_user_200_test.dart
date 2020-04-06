import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('HTTP Get User API call should return status code 200 OK', () async {
    int statusCode = 0;
    try{

      final body = {
        'employeeId' : "2121"
      };
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Get-Employee?code=Jh5OOXXRJuUt4fSaV1t3392tWgsvVbYNRbfvayefUg0vKquDKei4aw==",
          data: body);
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(200, statusCode);

  });

}