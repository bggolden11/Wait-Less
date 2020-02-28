import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/src/widgets/widget_builder.dart';

class SignUpCard extends StatelessWidget {

  Map<String, String> getBody() {
    final String address = '${_streetController.text.toString().trim()} ${_cityController.text.toString().trim()} ${_stateController.text.toString().trim()} ${_zipController.text.toString().trim()}';
    return {
      "firstName": "${_fNameController.text.toString().trim()}",
      "lastName": "${_lNameController.text.toString().trim()}",
      "birthday": "${_bdayController.text.toString().trim()}",
      "address": "$address",
      "phone": "${_phoneController.text.toString().trim()}",
      "title": "${_roleController.text.toString().trim()}"
    };
  }

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _roleController = TextEditingController();
  final _bdayController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(1800),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Sign Up",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
//            Text("First Name",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "First Name",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
            BuildTextField(
              text: 'First Name',
              controller: _fNameController,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
//            Text("Last Name",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              obscureText: true,
//              decoration: InputDecoration(
//                  hintText: "Last Name",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
            BuildTextField(
              text: 'Last Name',
              controller: _lNameController,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),



//            Text("Role",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "Manager/Waiter",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),

//            Text("Birthday",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "Birthday",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
            BuildTextField(
              text: 'Role',
              controller: _roleController,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            BuildTextField(
              text: 'Birthday',
              controller: _bdayController,
              hintText: 'YYYY-MM-DD',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
//            Text("Address",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "Address",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
            BuildTextField(
              text: 'Street Address',
              controller: _streetController,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
//            Text("City",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "City",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
            BuildTextField(
              text: 'City',
              controller: _cityController,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
//            Text("State",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "State",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
//            SizedBox(
//              height: ScreenUtil().setHeight(35),
//            ),
//            Text("ZIP Code",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "ZIP Code",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: BuildTextField(
                    text: 'State',
                    controller: _stateController,
                  ),
                ),
                SizedBox(width: 35),
                Expanded(
                  child: BuildTextField(
                    text: 'Zip Code',
                    controller: _zipController,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
//            Text("Phone Number",
//                style: TextStyle(
//                    fontFamily: "Poppins-Medium",
//                    fontSize: ScreenUtil().setSp(26))),
//            TextField(
//              decoration: InputDecoration(
//                  hintText: "Phone Number",
//                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//            ),
            BuildTextField(
              text: 'Phone Number',
              controller: _phoneController,
              hintText: 'xxx-xxx-xxxx',
            ),




//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Text(
//                  "Forgot Password?",
//                  style: TextStyle(
//                      color: Colors.blue,
//                      fontFamily: "Poppins-Medium",
//                      fontSize: ScreenUtil.getInstance().setSp(28)),
//                )
//              ],
//            )
          ],
        ),
      ),
    );
  }
}
