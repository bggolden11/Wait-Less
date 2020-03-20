import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// class to store the details for each task.dart
class Task{
  Task({this.name, this.table, this.description});
  final String name;
  final String table;
  final String description;

}
List<Task> listComTasks = [
  Task(description: 'Can you please wipe the table' , name: 'Wipe Table', table: 'A1'),
  Task(description: 'Can you please wipe the floor' , name: 'Wipe Floor', table: 'B3'),
  Task(description: 'Can you please serve the table' , name: 'Serve Table', table: 'F3'),
  Task(description: 'Can you please get the order' , name: 'Get Order', table: 'F5'),
  Task(description: 'Can you please call the manager' , name: 'Get Manager', table: 'A4'),
  Task(description: 'Can you please get water' , name: 'Get Water', table: 'F2'),
  Task(description: 'Can you please get main course' , name: 'Get Main Course', table: 'B2'),

]; // for test will contain all the tasks
class CompletedList extends ListTile{ // implementing the layout using list tile
  CompletedList(Task task, BuildContext context) // for each
      : super( // super class
      title: Text(task.name), // get name
      leading: CircleAvatar(backgroundColor: Colors.limeAccent[400], child: Text(task.table, style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
      trailing: new Icon(Icons.assignment_turned_in),
      onTap: (){showDialog(context: context, builder: (context) => CustomDialog(
        title: task.name,
        description: task.description,
      ));}
  );
}

Widget _buildCompletedList() {
  return ListView.builder(itemCount: listComTasks.length,
      itemBuilder: (BuildContext content, int index){
        Task task = listComTasks[index];
        return CompletedList(task, content);

      });
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
              color: Colors.greenAccent[400],
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
            backgroundImage: AssetImage('assets/summary.gif'),
          ),
        )
      ],
    );
  }
}
class SummaryList extends StatefulWidget { // class for Waiter Page
  @override
  _SummaryList createState() => _SummaryList();
}

class _SummaryList extends State<SummaryList>{


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
                  height: 185,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/manager.gif"), // insert the image here
                          fit: BoxFit.cover

                      )
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.1), // adding opacity in order to increase visibility
                                Colors.black.withOpacity(0.0),
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
                                color: Colors.tealAccent[400]
                            ),
                            child: Center(child: Text("Summary List", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),)),
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