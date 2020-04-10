/**
 *
 * Widget Builder class used to build the same style widgets throughout the
 * application
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BuildTextField extends StatelessWidget{

  BuildTextField({
    @required this.controller,
    @required this.text,
    this.hintText = ''
  });

  final TextEditingController controller;
  final String text;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: text, hintText: hintText),
    );
  }

}

class BuildButton extends StatelessWidget {

  BuildButton({
    @required this.buttonText,
    @required this.onPress
  });

  final VoidCallback onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            onTap: onPress, // this is for the
            child: Center(
              child: Text(buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      letterSpacing: 1.0)),
            ),
          ),
        ),
      ),
    );
  }

}