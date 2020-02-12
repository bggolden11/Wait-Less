import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(
            primarySwatch: Colors.lightGreen
        )
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        children: <Widget>[
          new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image(
                  image: new AssetImage("image/logo.jpg"),
                  fit: BoxFit.cover,
//          color: Colors.black54,
//          colorBlendMode:BlendMode.darken,
                )
              ]
          )
        ],
      ),
    );
  }
}