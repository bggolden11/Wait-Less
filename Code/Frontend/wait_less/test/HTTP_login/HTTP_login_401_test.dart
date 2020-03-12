import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('HTTP Authentication API call should return status code 401 UNAUTHORIZED (Invalid Password)', () async {
    int statusCode = 0;
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Authenticate-User?code=akKyCeyPLfZgmFZWFyrqhW43N3eZqq6I82aC2N8Tp4Drt9fEYrrVwA==",
          data: {"employeeID" : "2121", "passwordtoken" : "1111"});
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(401, statusCode);
  });

}

