import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models/dining_table_model.dart';
import 'package:flutter_app/src/models/task_model.dart';
import 'package:flutter_app/src/screens/manager/tableList_screen.dart';
import 'package:flutter_app/src/widgets/create_task.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../HTTPClient/http_client.dart';
import '../models/employee_login_credentials.dart';
import '../models/employee_login_credentials.dart';
import '../models/employee_login_credentials.dart';
import '../toast/toast_message.dart';
import '../toast/toast_message.dart';
import 'login_screen.dart';
import 'waiter/completed_screen.dart';
import 'waiter/current_screen.dart';

final Dio httpClient = new HTTPClient().dio;

class WaiterPage extends StatefulWidget { // class for Manager Page

  @override
  _WaiterPage createState() => _WaiterPage();
}

class _WaiterPage extends State<WaiterPage>{
  // list of pages 
  List<Widget> pagesTasks =[CurrentTasks(), CompletedTasks()];
  List<DiningTable> diningTableList;
  Timer reloadTimer;

  @override
  void initState() {
    super.initState();
    reloadTimer = Timer.periodic(Duration(seconds: 1), (Timer t) => this.reloadScreen());
    getTables();
  }

  void getTables() async {
    diningTableList = await getDiningTables();
  }

  void reloadScreen() {
    setState(() {
      pagesTasks =[CurrentTasks(), CompletedTasks()];
    });
  }

  @override
  void dispose() {
    reloadTimer?.cancel();
    _logout();
    super.dispose();
  }

  void _logout() async{
    String message = 'Error';
    try {
      final body = {
        "employeeId":"${EmployeeLoginCredentials.employeeId}",
      };

      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Log-User-Out?code=7qIgUA34RbFJaIo1NeuHQObWPvpbWXpOZUwgIxmDzG43zS4lNIj/Hg==",
          data: body);

      if(response.statusCode == 200)
        message = 'Logout Successful!';

    } on DioError catch (e){
      message = e.response.toString();
    }

    ToastMessage.show(message);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( // to edit anything in the appbar
        backgroundColor: Colors.transparent, // no background color
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0, // provides the appbar with 40 elevation to remove the shadow
        title: new Center(child: new Text("Wait Less", style: TextStyle(color: Colors.black, fontFamily: "Poppins-Bold"))), // center the name of the app
        //leading: Icon(Icons.menu),

        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => this.reloadScreen(),
              child: Container(
                width: 36,
                height: 30,
                child: Center(child: Icon(Icons.refresh)),
              ),
            )
          )

        ],
      ),
      drawer: new Drawer( // this is for the navBar or the sideBar, don't edit unless you want to edit something on the menu
        child: new ListView(
          children: <Widget>[ // Drawer class for the navbar and edit User Header if needed to change anything on the User Header Section (Image)
            new UserAccountsDrawerHeader(accountName: new Text("${EmployeeLoginCredentials.fName} ${EmployeeLoginCredentials.lName}", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium")), accountEmail: new Text("1024023", style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "Poppins-Medium",)), decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/task4.jpg"),

                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.red.withOpacity(0.1), BlendMode.darken)
                )
            ),
            ),

            new Divider(), // like a padding divides the image with the options in the menu

            new ListTile( // these are options for the drawer
              title: new Text("Current Task"),
              trailing: new Icon(Icons.assignment),
              // edit to change what happens on tap
              onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => WaiterPage()));},
            ),
            new ListTile(
              title: new Text("Completed Task"),
              trailing: new Icon(Icons.assignment_turned_in),
              // edit to change what happens on tap
              onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => WaiterPage()));},
            ),
            new ListTile(
              title: new Text("Call Manager"),
              trailing: new Icon(Icons.call),
              // edit to change what happens on tap
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.cancel),
              onTap: () {
                _logout();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              // edit to change what happens on tap
            ),
          ],
        ),
      ),
      body: PageView.builder(itemCount: pagesTasks.length, // page view builder will run for each item in the list, edit the function for changes
      itemBuilder: (context, index) => pagesTasks[index],),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){ showDialog(context: context,
            builder: (BuildContext context){
              return Dialog(
                  child: CreateTask(
                    diningTableList: diningTableList,
                    onAddPressed: (Task t) {
                      createTask(t);
                    }),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
              );
            });},
      ),
//      SpeedDial( // this is the floating point button for creating tasks
//        backgroundColor: Colors.red, // sets the background color
//        closeManually: false, // toggle to switch between manual closing or on tap
//        overlayColor: Colors.redAccent, // change the color to make the background have an overlay
//        curve: Curves.bounceIn, // for animations of the labels
//        overlayOpacity: 0.4, // overlay opacity edit it to make it more transparent
//        animatedIcon: AnimatedIcons.menu_close, // icon for the button
//        children: [
//          SpeedDialChild( // options each will be a child
//
//            child: Icon(Icons.assignment), // icon for create task
//            label: "Create Task",
//            onTap: (){
//              showDialog(context: context,
//              builder: (BuildContext context){
//                return Dialog(
//                  child: CreateTask(
//                    diningTableList: diningTableList,
//                    onAddPressed: (Task t) {
//                      createTask(t);
//                    }),
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(12))
//                  ),
//                );
//              });
//            }
//          )
//        ],
//      ),

    );
  }


  void createTask(Task t) async {
    String message = 'Failed to create Task!';
    try {
      final body = {
        'employeeId' : "${t.employeeID}",
        "title" : "${t.title}",
        "description" : "${t.description}",
        "table": "${t.tableNumber}"};
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Create-Task?code=7ppCvZncW81fJggMNpSX1MbiuaklafIQR7bilfa0IMrkGtcNy6KUPA==",
          data: body);
      if(response.statusCode == 201) {
        message = 'Created Task!';
        Navigator.pop(context);
      }
    } on DioError catch (e){
      message = e.message;
    }
    ToastMessage.show(message);
  }

}