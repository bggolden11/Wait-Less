import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models/task_model.dart';
import 'package:flutter_app/src/models/waiter_model.dart';
import 'package:flutter_app/src/widgets/waiter_list.dart';

import '../../models/employee_login_credentials.dart';
import '../../toast/toast_message.dart';

class SendTask extends StatefulWidget {

  final Task task;

  SendTask({ this.task });

  @override
  _SendTask createState() => _SendTask();
}

class _SendTask extends State<SendTask> {

  void createAndSendTask(Task t) async {
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
        message = 'Sent Task!';
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } on DioError catch (e){
      message = e.message;
    }
    ToastMessage.show(message);
  }

  void sendTask(Task t) async {
    print('${t.employeeID}, ${t.taskID}');
    String message = 'Failed to send Task!';
    try {
      final body = {
        'taskId' : "${t.taskID}",
        'employeeToAssignId' : "${t.employeeID}"
      };
      final Response response = await httpClient.post("https://waitless-functions-2.azurewebsites.net/api/Update-Task-User?code=tz6IzOzltKMXwHzljWBglCdjL3Zw7GeZ3VO2xjrpTxckXlz3XMrt8A==",
          data: body);
      if(response.statusCode == 200) {
        message = 'Sent Task!';
        Navigator.pop(context);
        Navigator.pop(context);
        setState(() {

        });
      }
    } on DioError catch (e){
      message = e.message;
    }
    ToastMessage.show(message);
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            Center(
                child: Text(
                  "Send Task",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                )),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(

              child: Container( // for the list view, currently it goes through the list called waiter list and makes those many waiters, once we can populate the waiters list you
                // can add more
                height: 400,
                width: 500,

                child: BuildWaiterList(
                    onWaiterPress: (Waiter w) {
                      print('${w.employeeID}, ${widget.task.taskID}');
                      Task sendingTask = new Task(
                        taskID: widget.task.taskID,
                        employeeID: w.employeeID,
                        title: widget.task.title,
                        description: widget.task.description,
                        tableNumber: widget.task.tableNumber
                      );
                      if(EmployeeLoginCredentials.isManager)
                        createAndSendTask(sendingTask);
                      else
                        sendTask(sendingTask);
                    },
                    trailingIcon: Icons.send,
                    waiterImage: AssetImage("assets/user.png")
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                RaisedButton( // close button
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
            )


          ],
        ),
      ),
    );
  }
}