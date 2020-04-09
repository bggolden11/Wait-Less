
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/employee_register_credentials.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/screens/newlogin.dart';
import 'package:flutter_app/src/widgets/successful_card.dart';
import 'package:flutter_app/src/widgets/widget_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SuccessfulRegistrationScreen extends StatelessWidget{

  static final String route = '/successfulCard';
  final EmployeeRegisterCredentials employeeCredentials;

  SuccessfulRegistrationScreen({@required this.employeeCredentials});


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1900, allowFontScaling: true);

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
                    height: ScreenUtil().setHeight(500),
                  ),
                  SuccessfulCard(employeeCredentials: employeeCredentials,),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BuildButton(
                        buttonText: 'OK',
                        onPress: () => Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen())),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}