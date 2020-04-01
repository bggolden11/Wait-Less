import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_app/src/models/employee_login_credentials.dart';
import 'package:flutter_app/src/models/waiter_model.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/screens/manager_screen.dart';
import 'package:flutter_app/src/screens/waiter_screen.dart';
import 'package:flutter_app/src/toast/toast_message.dart';
import 'package:flutter_app/src/widgets/FormCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'registration_screen.dart';

final Dio httpClient = new HTTPClient().dio;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => new _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  /// Controllers for the retrieval of text from username and password
  final employeeIDController = TextEditingController();
  final passwordController = TextEditingController();

  void _loginOnPressed() async{
    final String employeeID = employeeIDController.text.toString().trim();
    final String password  = passwordController.text.toString().trim();
    String message = 'Error';
    try {
      final body = {
        "employeeID":"$employeeID",
        "passwordtoken":"${EncrypterUtil.encrypt(password)}"
      };

      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Authenticate-User?code=akKyCeyPLfZgmFZWFyrqhW43N3eZqq6I82aC2N8Tp4Drt9fEYrrVwA==",
          data: body);

      if(response.statusCode == 200) {
        EmployeeLoginCredentials.loginFromJSON(json.decode(response.data.toString()), employeeID);
        message = 'Login Successful!';

        if(EmployeeLoginCredentials.isManager)
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>
                  ManagerPage()));
        else
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>
                  WaiterPage()));
      }

    } on DioError catch (e){
      message = e.response.toString();
    }

    ToastMessage.show(message);
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: ScreenUtil().setWidth(110),
                        height: ScreenUtil().setHeight(110),
                      ),
                      Text(" Wait Less",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: ScreenUtil().setSp(46),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(180),
                  ),
                  FormCard(employeeIDController: employeeIDController, passwordController: passwordController,),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Remember me",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium"))
                        ],
                      ),
                      InkWell(

                        child: Container(
                          width: ScreenUtil().setWidth(330),
                          height: ScreenUtil().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _loginOnPressed, // this is for the
                              child: Center(
                                child: Text("SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
//                  SizedBox(
//                    height: ScreenUtil().setHeight(40),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      horizontalLine(),
//                      Text("Sign Up",
//                          style: TextStyle(
//                              fontSize: 20.0, fontFamily: "Poppins-Medium")),
//                      horizontalLine()
//                    ],
//                  ),
//                  SizedBox(
//                    height: ScreenUtil().setHeight(40),
//                  ),
//
//                  SizedBox(
//                    height: ScreenUtil().setHeight(30),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        "New User? ",
//                        style: TextStyle(fontSize: 16,
//                            fontFamily: "Poppins-Medium"),
//                      ),
//                      InkWell(
//                        onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => RegistrationScreen()));},
//                        child: Text("SignUp",
//                            style: TextStyle(
//                                color: Color(0xFF5d74e3),
//                                fontSize:16,
//                                fontFamily: "Poppins-Bold")),
//                      )
//                    ],
//                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}