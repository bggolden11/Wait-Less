import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('HTTP Registration API call should return status code 200 OK', () async {
    int statusCode = 0;
    try{
      final body = {
        "firstName" : "Test",
        "lastName" : "Case",
        "birthday" : "2010-12-12",
        "address" : "1234 Lane Drive",
        "phone" : "123-123-1234",
        "title" : "Manager",
        "encryptedPassword" : "${EncrypterUtil.encrypt('1234')}"
      };
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Add-User?code=qbKCJmMn8zHVga9kZ/p9Uwh03U9RKOrKGmfUdWL8sMsMOuVZJ12DKQ==",
          data: body);
      statusCode = response.statusCode;
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(200, statusCode);
  });

}