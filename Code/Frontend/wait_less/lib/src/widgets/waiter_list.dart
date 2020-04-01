

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/list_waiter_model.dart';
import 'package:flutter_app/src/models/waiter_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../HTTPClient/http_client.dart';
import '../screens/login_screen.dart';


final Dio httpClient = new HTTPClient().dio;

List<Waiter> listWaiters = [];

class Waiter_list extends ListTile{ // implementing the layout using list tile
  Waiter_list(Waiter waiter, BuildContext context, IconData trailingIcon, AssetImage waiterImage, Function(Waiter w) onWaiterPress) // for each
      : super( // super class
      title: Text(waiter.toString()), // get name
      //leading: CircleAvatar(backgroundColor: Colors.limeAccent[400], child: Text(waiter.name[0], style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
      trailing: new Icon(trailingIcon),
      leading: CircleAvatar( backgroundColor: Colors.transparent,
        backgroundImage: waiter.isBDayToday() ? AssetImage("assets/waiterbday.png") : waiterImage
      ),
      onTap: () => onWaiterPress(waiter)
  );
}


Future getWaiters(bool loggedIn) async {
  try {
    final Response response = await httpClient.get("https://waitless-functions-2.azurewebsites.net/api/Get-All-Employees?code=AiIkGSpsrYMJWydPjsZIGLLDc85VBtlplRpNS6qEJAZ12BQcrcci5Q==");

    if(loggedIn)
      listWaiters = WaiterList.waiterListFromJSON('{ "result" : ${response.data.toString()} }').getLoggedInWaiters();
    else
      listWaiters = WaiterList.waiterListFromJSON('{ "result" : ${response.data.toString()} }').getAllWaiters();

    listWaiters.forEach((e) => print('EID: ${e.employeeID}\nName: ${e.toString()}'));
    return listWaiters;
  } on DioError catch (e){
    print(e.response.toString());
    print(e.response.statusCode);
  }
  return null;
}

Widget BuildWaiterList({Function(Waiter w) onWaiterPress, IconData trailingIcon, AssetImage waiterImage, bool loggedIn}) {
  return FutureBuilder(
    future: getWaiters(loggedIn),
    builder: (context, snapshot) {
      return snapshot.hasData ?
      listWaiters.length == 0 ? new Container(child: Text('No Waiters!'))  // No tasks
          : new ListView.builder( // Has Tasks
        itemCount: listWaiters.length,
        itemBuilder: (BuildContext cxt, int index){
          Waiter waiter = listWaiters[index];
          return Waiter_list(waiter, cxt, trailingIcon, waiterImage,
              onWaiterPress);
        },
      )
          : new Center(child: SpinKitWave(color: Colors.cyan, size: 50)); //  Haven't gotten the tasks

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