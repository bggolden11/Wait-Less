import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// this screen is for the floating button to create tasks and you can add whatever you want here

class CreateTask extends StatefulWidget {

  final VoidCallback onAddPressed;

  CreateTask({this.onAddPressed});

  @override
  _CreateTask createState() => _CreateTask();
}

class _CreateTask extends State<CreateTask> {

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
                  "Add Task",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                )),
            SizedBox(
              height: 12,
            ),
            TextField( // each is a text field for different inputs
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),

                ),
                labelText: "Task Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),

                ),
                labelText: "Task Description",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),

                ),
                labelText: "Table",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row( // for buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: this.widget.onAddPressed,

                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),

                  ),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Add",
                  ),
                ),

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
            )


          ],
        ),
      ),
    );
  }
}