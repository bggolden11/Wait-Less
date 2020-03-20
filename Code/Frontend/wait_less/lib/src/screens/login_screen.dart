

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_app/src/screens/main_menu.dart';
import 'package:flutter_app/src/screens/registration_screen.dart';
import 'package:flutter_app/src/toast/toast_message.dart';
import 'package:flutter_app/src/widgets/widget_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



final Dio httpClient = new HTTPClient().dio;

class LoginPage extends StatefulWidget {

  static final String route = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

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
//          image: new AssetImage("image/1.jpg"),
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
        message = 'Login Successful!';
        Navigator.pushReplacementNamed(context, MainMenu.route);
      }

    } on DioError catch (e){
      message = e.response.toString();
    }

    ToastMessage.show(message);
  }


  Widget _buildLoginFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//            _buildEmployeeIDField(),
            BuildTextField(
              controller: employeeIDController,
              text: 'Employee ID',
            ),
            SizedBox(
              height: 10.0,
            ),
            BuildTextField(
                controller: passwordController,
                text: 'Password'
            ),
            SizedBox(
              height: 20.0,
            ),
//            _buildSubmitButton(),
            BuildButton(
              buttonText: 'Submit',
              onPress: _loginOnPressed,
            ),
            SizedBox(
              height: 10.0,
            ),
            BuildButton(
              buttonText: 'Register',
              onPress: _registerOnPressed,
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  /// Controllers for the retrieval of text from username and password
  final employeeIDController = TextEditingController();
  final passwordController = TextEditingController();

  void _registerOnPressed() async{
    Navigator.pushNamed(context, RegistrationScreen.route);
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
      child:
      Image.asset(
        "assets/logo.png",
        width: ScreenUtil().setWidth(110),
        height: ScreenUtil().setHeight(110),
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