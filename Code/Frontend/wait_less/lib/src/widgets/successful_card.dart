import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/employee_register_credentials.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/src/widgets/widget_builder.dart';

class SuccessfulCard extends StatelessWidget {

  final employeeCredentials;

  SuccessfulCard({@required this.employeeCredentials});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(320),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Employee ID: ${employeeCredentials.employeeId}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            Text("Password: ${employeeCredentials.temporaryPassword}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
          ],
        ),
      ),
    );
  }
}
