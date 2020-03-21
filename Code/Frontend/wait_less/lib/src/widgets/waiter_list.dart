

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/list_waiter_model.dart';
import 'package:flutter_app/src/models/waiter_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../screens/login_screen.dart';


List<Waiter> listWaiters = [];

class Waiter_list extends ListTile{ // implementing the layout using list tile
  Waiter_list(Waiter waiter, BuildContext context, IconData trailingIcon, AssetImage waiterImage, VoidCallback onWaiterTap) // for each
      : super( // super class
      title: Text(waiter.toString()), // get name
      //leading: CircleAvatar(backgroundColor: Colors.limeAccent[400], child: Text(waiter.name[0], style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
      trailing: new Icon(trailingIcon),
      leading: CircleAvatar( backgroundColor: Colors.transparent,
        backgroundImage: waiterImage,),
      onTap: onWaiterTap
  );
}

Future getWaiters() async {
  try {
    final Response response = await httpClient.get("https://waitless-functions-2.azurewebsites.net/api/Get-Logged-In-Users?code=4kq5Ed1tKRCVM1C3V27gLDhIJMU3vUdzyq3to69zKurMdW4pzTxmmQ==");

    listWaiters = WaiterList.waiterListFromJSON('{ "result" : ${response.data.toString()} }').waiterList;

    listWaiters.forEach((e) => print('EID: ${e.employeeID}\nName: ${e.toString()}'));
    return listWaiters;
  } on DioError catch (e){
    print(e.response.toString());
    print(e.response.statusCode);
  }
  return null;
}

Widget BuildWaiterList({VoidCallback onWaiterTap, IconData trailingIcon, AssetImage waiterImage}) {
  return FutureBuilder(
    future: getWaiters(),
    builder: (context, snapshot) {
      return snapshot.hasData ?
      listWaiters.length == 0 ? new Container(child: Text('No Waiters!'))  // No tasks
          : new ListView.builder( // Has Tasks
        itemCount: listWaiters.length,
        itemBuilder: (BuildContext cxt, int index){
          Waiter waiter = listWaiters[index];
          return Waiter_list(waiter, cxt, trailingIcon, waiterImage,
              onWaiterTap ?? (){
                showDialog(context: context, builder: (context) => CustomDialog(
                  title: waiter.toString(),
                  description: "Currently working on tables A4, A8", /// TODO Change description
                ));});
        },
      )
          : new Center(child: SpinKitWave(color: Colors.lightGreen, size: 100)); //  Haven't gotten the tasks

    },

  );
}

// class for completed tasks popup
class CustomDialog extends StatelessWidget{
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),

    );
  }
  dialogContent(BuildContext context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              top: 200,
              bottom: 16,
              left: 16,
              right: 16
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),

                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,

                ),

              ),
              SizedBox(height: 16.0),
              Text(description,
                style: TextStyle(
                  fontSize: 16.0,
                ),),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),

                  ),
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Close",
                  ),
                ),
              )
            ],
          ),

        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 100,
            backgroundImage: AssetImage('assets/waiterList.gif'),
          ),
        )
      ],
    );
  }
}