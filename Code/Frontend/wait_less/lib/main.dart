
import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/screens/main_menu.dart';
import 'package:flutter_app/src/screens/registration_screen.dart';
import 'package:flutter_app/src/screens/successful_registration_screen.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: LoginPage(),
      routes: {MainMenu.route : (context) => MainMenu(),
               RegistrationScreen.route : (context) => RegistrationScreen(),
               LoginPage.route : (context) => LoginPage(),
               SuccessfulRegistrationScreen.route : (context) => SuccessfulRegistrationScreen()}
    );
  }
}


