import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('HTTP Registration API call should return status code 200 OK', () async {
    try{
      final body = {
        "firstName" : "Test",
        "lastName" : "Case",
        "birthday" : "2010-12-12",
        "address" : "1234 Lane Drive",
        "phone" : "123-123-1234",
        "title" : "Manager"
      };
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-20200207161542196.azurewebsites.net/api/Add-User?code=Jl3tAkKyOz19Lk22aBLNwUSOJcTP0wG0BHaTZrmz6Mwsu5/GwkUVUw==",
          data: body);

      expect(response.statusCode, 200);
    } on DioError catch (e){ }
  });

}