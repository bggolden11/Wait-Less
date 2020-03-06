import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/employee_login_credentials.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/screens/successful_registration_screen.dart';
import 'package:flutter_app/src/widgets/SignUpCard.dart';
import 'package:flutter_app/src/widgets/widget_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../HTTPClient/http_client.dart';
import '../toast/toast_message.dart';


class RegistrationScreen extends StatefulWidget {

  static final String route = '/registrationScreen';


  @override
  _RegistrationScreen createState() => new _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {

  bool _isSelected = false;
  final signUpCard = SignUpCard();
  final Dio httpClient = new HTTPClient().dio;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _signUpOnPressed() async {
    String message = 'Error';
    final body = signUpCard.getBody();
    try{
      final Response response = await httpClient.post("https://waitless-functions-20200207161542196.azurewebsites.net/api/Add-User?code=Jl3tAkKyOz19Lk22aBLNwUSOJcTP0wG0BHaTZrmz6Mwsu5/GwkUVUw==",
          data: body);

      final EmployeeCredentials employeeLogin = EmployeeCredentials.fromJSON(json.decode(response.data.toString()));

      if(response.statusCode == 200) {
        message = 'Sign Up Successful!';
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>
                SuccessfulRegistrationScreen(
                    employeeCredentials: employeeLogin)));
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
    ScreenUtil.init(context, width: 750, height: 1300, allowFontScaling: true);
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
                child: Image.asset("assets/image_03.png"),
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
                  signUpCard,
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
////                          SizedBox(
////                            width: 1.0,
////                          ),
////                          GestureDetector(
////                            onTap: _radio,
////                            child: radioButton(_isSelected),
////                          ),
////                          SizedBox(
////                            width: 8.0,
////                          ),
////                          Text("Remember me",
////                              style: TextStyle(
////                                  fontSize: 12, fontFamily: "Poppins-Medium"))
//                        ],
//                      ),
//
                      BuildButton(
                        buttonText: 'Sign Up',
                        onPress: _signUpOnPressed,
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),
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
//                    height: ScreenUtil.getInstance().setHeight(40),
//                  ),
//
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(30),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
////                      Text(
////                        "New User? ",
////                        style: TextStyle(fontSize: 16,
////                            fontFamily: "Poppins-Medium"),
////                      ),
////                      InkWell(
////                        onTap: () {},
////                        child: Text("SignUp",
////                            style: TextStyle(
////                                color: Color(0xFF5d74e3),
////                                fontSize:16,
////                                fontFamily: "Poppins-Bold")),
////                      )
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
// images taken from https://www.vecteezy.com/vector-art/168355-canteen-vector-design
// tutorial follwed for the UI https://www.youtube.com/watch?v=1Pw_E7T9TXI
