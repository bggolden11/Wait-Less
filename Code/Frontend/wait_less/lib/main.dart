
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

final Dio httpClient = new HTTPClient().dio;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainter(),
        child: _buildLoginLayout(),
      ),
    );
  }

  Widget _buildLoginLayout() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
//        new Image(
//          image: new AssetImage("image/logo.jpg"),
//          fit: BoxFit.cover,
//          color: Colors.white,
//          colorBlendMode: BlendMode.darken,
//        ),
        Align(
          alignment: Alignment.topCenter,
          child: AppLogo(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLoginFields(),
        )
      ],
    );
  }

  Widget _buildLoginFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildEmployeeIDField(),
            SizedBox(
              height: 10.0,
            ),
            _buildPasswordField(),
            SizedBox(
              height: 20.0,
            ),
            _buildSubmitButton(),
            SizedBox(
              height: 10.0,
            ),
            _buildRegisterText(),
          ],
        ),
      ),
    );
  }

  /// Controllers for the retrieval of text from username and password
  final employeeIDController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _buildEmployeeIDField() {
    return TextFormField(
      controller: employeeIDController,
      decoration: InputDecoration(labelText: 'Employee ID'),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  void _loginOnPressed() async{
    final String employeeID = employeeIDController.text.toString().trim();
    final String password  = passwordController.text.toString().trim();
    try {
      final body = {
        "username":"$employeeID",
        "password":"$password"
      };

      final Response response = await httpClient.post("https://waitless-functions-20200207161542196.azurewebsites.net/api/AuthenticateUser?code=QONIYXuRMDrvPaYBRCOyhfj5Rc7xSEBeNV3tPQ9lOmwJYIhpLm/aGA==",
           data: body);
      print(response.statusCode);
      switch (response.statusCode){
        case 200:
          /// TODO: Harsh, make the main menu screen and switch to it here

          Fluttertoast.showToast(
              msg: "Login Successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 14.0
          );
          print("200");

          break;
        case 400:
          print("Flutter Error: Didn't pass the right JSON file");
          break;
        case 401:
          /// TODO: Prompt the user to type in a different password, password was invalid
          break;
        case 404:
          // TODO Prompt the user to type in a different username, username was invalid
          break;
        case 500:
          print("Internal server Error");
          break;

      }

    } on Exception catch (_){
      print(_.toString());
    }

  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      onPressed: _loginOnPressed ,
      color: Colors.blueAccent[200],
      child: Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildRegisterText() {
    return Text(
      'REGISTER',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      width: 100.0,
      height: 100.0,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.grey[800]),
      child: Icon(
        Icons.home,
        color: Colors.white,
        size: 40.0,
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
