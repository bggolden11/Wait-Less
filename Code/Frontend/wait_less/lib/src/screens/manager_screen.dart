import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/models/dining_table_model.dart';
import 'package:flutter_app/src/models/stats_model.dart';

import 'registration_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models/task_model.dart' as taskModel;
import 'package:flutter_app/src/widgets/create_task.dart';
import '../models/employee_login_credentials.dart';
import '../models/employee_login_credentials.dart';
import '../toast/toast_message.dart';
import 'login_screen.dart';
import 'manager/tableList_screen.dart';
import 'manager/waiterList_screen.dart';
import 'manager/all_employee_stats_screen.dart';
import 'manager/summary_screen.dart';
import 'registration_screen.dart';
import 'waiter/sendTask_screen.dart' as sendTaskClass;

final Dio httpClient = new HTTPClient().dio;

class ManagerPage extends StatefulWidget { // class for Manager Page

  final EmployeeLoginCredentials employeeCredentials;

  ManagerPage({ this.employeeCredentials});

  @override
  _ManagerPage createState() => _ManagerPage();
}

Stats stats;

Future getStats() async {
  try {
    final Response response = await httpClient.get("https://waitless-functions-2.azurewebsites.net/api/Get-Statistics-For-Tasks?code=RGNAyFaYqThnYIdiW/41HVT5X8UDyhXQar0dqJ8RRUiItBFsXDfxCQ==");
    stats = Stats.statsFromJSON('{ "result" : ${response.data.toString()} }');
    return stats;
  } on DioError catch (e){
    print(e.response.toString());
    print(e.response.statusCode);
  }
  return null;
}

class _ManagerPage extends State<ManagerPage>{
  // list of all the screens
  int currentPage = 0; // index of the pages in the list
  // list of pages
  List<Widget> pagesManager = [TablesList(), StatsScreen(stats), SummaryList(), WaiterList()];
  Widget currentScreen = TablesList();
  final PageStorageBucket bucket = PageStorageBucket(); // to store the current screen a flutter widget look up the documentation

  List<DiningTable> diningTableList;

  Timer reloadTimer;

  @override
  void initState() {
    super.initState();
    reloadTimer = Timer.periodic(Duration(seconds: 1), (Timer t) => this.reloadScreen());
    getData();
  }

  void getData() async {
    diningTableList = await getDiningTables();
    stats = await getStats();
    setState(() {
      pagesManager = [TablesList(),StatsScreen(stats), SummaryList(), WaiterList()];
    });
    print('got data');
  }

  void reloadScreen() {
    setState(() {
      pagesManager = [TablesList(),StatsScreen(stats), SummaryList(), WaiterList()];
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
          //title: new Center(child: new Text("Wait Less", style: TextStyle(color: Colors.black, fontFamily: "Poppins-Bold"))), // center the name of the app
          //leading: Icon(Icons.menu),

          actions: <Widget>[ // for the menu and the notifications center
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Wait Time: 5 mins", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Poppins-Bold"))), // once notifications are implemented we can increase and decrease the counter accordingly and implement this
              ),
            )

          ],
        ),
        drawer: new Drawer( // this is for the navBar or the sideBar, don't edit unless you want to edit something on the menu
          child: new ListView(
            children: <Widget>[ // Drawer class for the navbar and edit User Header if needed to change anything on the User Header Section (Image)
              new UserAccountsDrawerHeader(accountName: new Text("Harsh Gupta", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium")), accountEmail: new Text("1024023", style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "Poppins-Medium",)), decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/task4.jpg"),

                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.red.withOpacity(0.1), BlendMode.darken)
                  )
              ),
              ),

              new Divider(), // like a padding divides the image with the options in the menu

              new ListTile(
                title: new Text("Tables"),
                trailing: new Icon(Icons.assignment),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => ManagerPage()));},
              ),
              new ListTile(
                title: new Text("Waiter List"),
                trailing: new Icon(Icons.assignment_turned_in),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => ManagerPage()));},
              ),
              new ListTile(
                title: new Text("Add Employee"),
                trailing: new Icon(Icons.assignment_turned_in),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => RegistrationScreen()));},
              ),
              new ListTile(
                title: new Text("Logout"),
                trailing: new Icon(Icons.cancel),
                onTap: () {
                  _logout();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
//        PageView.builder(itemCount: pagesTasks.length,
//          itemBuilder: (context, index) => pagesTasks[index],),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(Icons.add),
          onPressed: (){ showDialog(context: context,
              builder: (BuildContext context){
                return Dialog(
                  child: CreateTask(
                    diningTableList: diningTableList,
                    onAddPressed: (taskModel.Task t) {
                    showDialog(
                        context: context,
                        builder: (BuildContext buildContext) {
                          return Dialog(
                              child: sendTaskClass.SendTask(task: t,),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12)))
                          );
                        }
                    );
                  }),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                );
              });},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = TablesList();
                          currentPage = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.apps,
                            // a conditional statement for showing if selected
                            color: currentPage == 0 ? Colors.redAccent[200] : Colors.grey,
                          ),
                          Text(
                            'Full Tables',
                            style: TextStyle(
                              color: currentPage == 0 ? Colors.redAccent[200] : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = StatsScreen(stats);
                          currentPage = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.assessment,
                            // a conditional statement for showing if selected
                            color: currentPage == 1 ? Colors.redAccent[200] : Colors.grey,
                          ),
                          Text(
                            'Statistics',
                            style: TextStyle(
                              color: currentPage == 1 ? Colors.redAccent[200] : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // icons for right side
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = SummaryList();
                          currentPage = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.assignment,
                            // a conditional statement for showing if selected
                            color: currentPage == 2 ? Colors.redAccent[200] : Colors.grey,
                          ),
                          Text(
                            'Summary',
                            style: TextStyle(
                              color: currentPage == 2 ? Colors.redAccent[200] : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = WaiterList();
                          currentPage = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            // a conditional statement for showing if selected
                            color: currentPage == 3 ? Colors.redAccent[200] : Colors.grey,
                          ),
                          Text(
                            'Waiters',
                            style: TextStyle(
                              color: currentPage == 3 ? Colors.redAccent[200] : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),

    );
  }
}