

import 'dart:io';

import 'package:dio/dio.dart';

class HTTPClient {
  /// Singleton for the HTTP Client class
  static final HTTPClient _singleton = new HTTPClient._internal();
  factory HTTPClient() {
    return _singleton;
  }

  /// External package used for better HTTP requests
  final Dio dio = new Dio();


  HTTPClient._internal() {
    /// Set the default values for the Client
    //dio.options.baseUrl = 'https://waitless-functions-20200207161542196.azurewebsites.net';
    dio.options.connectTimeout = 10000; //5s
    dio.options.receiveTimeout = 10000;
  }


}