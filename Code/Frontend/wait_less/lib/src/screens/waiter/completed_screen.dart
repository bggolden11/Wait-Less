import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models/list_task_model.dart';
import 'package:flutter_app/src/models/task_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../models/employee_login_credentials.dart';
import '../login_screen.dart';


List<Task> listComTasks = []; // for test will contain all the tasks
class CompletedList extends ListTile{ // implementing the layout using list tile
  CompletedList(Task task, BuildContext context) // for each
  : super( // super class
    title: Text(task.title), // get name
    leading: CircleAvatar(backgroundColor: Colors.limeAccent[400], child: Text(task.tableNumber, style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
    trailing: new Icon(Icons.assignment_turned_in),
    onTap: (){showDialog(context: context, builder: (context) => CustomDialog(
      title: task.title,
      description: task.description,
    ));}
  );
}

Future getTasks() async {
  try {
    final body = {
      "employeeId":"${EmployeeLoginCredentials.employeeId}"
    };

    final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Get-Inactive-Tasks-Based-On-User?code=Ciyv62I26diHC58R7NFzBxZsMeiGIEe5IiLVuavOJo7ZzZR/L465eQ==",
        data: body);


    listComTasks = TaskList.taskListFromJSON('{ "result" : ${response.data.toString()} }').taskList;
    listComTasks.forEach((e) => print('TID: ${e.taskID}\nEID: ${e.employeeID}'));
    return listComTasks;
  } on DioError catch (e){
    print(e.response.toString());
    print(e.response.statusCode);
  }
  return null;
}

Widget _buildCompletedList() {
  return FutureBuilder(
    future: getTasks(),
    builder: (context, snapshot) {
      return snapshot.hasData ?
      listComTasks.length == 0 ? new Container(child: Text('No Completed Tasks!'))  // No tasks
          : new ListView.builder( // Has Tasks
        itemCount: listComTasks.length,
        itemBuilder: (BuildContext content, int index){
          Task task = listComTasks[index];
          return CompletedList(task, content);
        },
      )
          : new Center(child: SpinKitWave(color: Colors.lightGreen, size: 100)); //  Haven't gotten the tasks

    },

  );

}

// define popup function
Widget _popupFunction(context){
  showModalBottomSheet(context: context, builder: (BuildContext context){
    return Container(
      height: 400,
      decoration: BoxDecoration(

        color: Colors.limeAccent[400],
        border: Border.all(color: Colors.black),

      ),

    );
  });
}
// class for completed tasks popup
class CustomDialog extends StatelessWidget{ // this is a custom dialog box and for adding anything in the popup edit this
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
            color: Colors.white,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[


                  RaisedButton(
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

                ],
              ),
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
            backgroundImage: AssetImage('assets/completed.gif'),
          ),
        )
      ],
    );
  }
}
class CompletedTasks extends StatefulWidget { // class for Waiter Page
  @override
  _CompletedTasks createState() => _CompletedTasks();
}

class _CompletedTasks extends State<CompletedTasks>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea( // this is the main body and has bunch of containers
        //fit: StackFit.expand,
        child: Container(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[

//                    new Align(alignment: Alignment.centerLeft, child: new Text(
//                      'Completed Tasks', // for the area where the current tasks would be developed
//                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
//                    )),
                  ],
                ),
                Padding( // provide padding to create some space between the title and the buttons
                  padding: EdgeInsets.only(top: 1.0),

                ),
                Container( // this button is for completed tasks
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/ctasks.jpg"), // insert the image here
                          fit: BoxFit.cover

                      )
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.5), // adding opacity in order to increase visibility
                                Colors.black.withOpacity(0.2),
                              ]
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
//                          Text(
//                            'Completed Tasks', // for the area where the current tasks would be developed
//                            style:TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Poppins-Medium"),
//
//                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.redAccent[200]
                            ),
                            child: Center(child: Text("Completed Tasks", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),)),
                          ),
                          SizedBox(height: 20,),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 20,), // just for padding
                Column(
                  children: <Widget>[

//                    new Align(alignment: Alignment.centerLeft, child: new Text(
//                      'Current Tasks', // for the area where the current tasks would be developed
//                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
//                    )),
                  ],
                ),
                Expanded( // for the list view, currently it goes through the list called task list and makes those many tasks, once we can populate the tasks you
                  // can add more

                    child: _buildCompletedList(),
                )
              ],
            ),


          ),



        ),

      ),

    );
  }
}