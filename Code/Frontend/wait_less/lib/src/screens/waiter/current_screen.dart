import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/screens/waiter/sendTask_screen.dart';

// class to store the details for each task
class Task{
  Task({this.name, this.table, this.description});
  final String name;
  final String table;
  final String description;

}
List<Task> listCurrentTasks = [
  Task(description: 'Can you please wipe the table' , name: 'Wipe Table', table: 'A1'),
  Task(description: 'Can you please wipe the floor' , name: 'Wipe Floor', table: 'B3'),
  Task(description: 'Can you please serve the table' , name: 'Serve Table', table: 'F3'),
  Task(description: 'Can you please get the order' , name: 'Get Order', table: 'F5'),
  Task(description: 'Can you please call the manager' , name: 'Get Manager', table: 'A4'),
  Task(description: 'Can you please get water' , name: 'Get Water', table: 'F2'),
  Task(description: 'Can you please get main course' , name: 'Get Main Course', table: 'B2'),

]; // for test will contain all the tasks
class CurrentList extends ListTile{ // implementing the layout using list tile
  CurrentList(Task task, BuildContext context) // for each
      : super( // super class
      title: Text(task.name), // get name
      subtitle: Text(task.description),
      leading: CircleAvatar(backgroundColor: Colors.redAccent[200], child: Text(task.table, style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
      trailing: new Icon(Icons.assignment),
      onTap: (){showDialog(context: context, builder: (context) => CustomDialog( // calling the custome dialog I created
        title: task.name,
        description: task.description,
      ));}
  );
}

Widget _buildCurrentList() {
  return ListView.builder(itemCount: listCurrentTasks.length, // will run for each item in the list
      itemBuilder: (BuildContext content, int index){
        Task task = listCurrentTasks[index];
        return CurrentList(task, content);

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
              Row( // all the buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),

                    ),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Finish",
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return Dialog(
                              child: SendTask(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                            );
                          });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),

                    ),
                    textColor: Colors.white,
                    color: Colors.amber,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Send",
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
              ),
//              Align(
//                alignment: Alignment.bottomRight,
//                child: FlatButton(
//                  onPressed: (){
//                    Navigator.pop(context);
//                  },
//                  child: Text("Close"),
//                ),
//
//              ),

            ],
          ),

        ),
        Positioned( // for the gif
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 100,
            backgroundImage: AssetImage('assets/current.gif'),
          ),
        )
      ],
    );
  }
}
class CurrentTasks extends StatefulWidget { // class for current tasks
  @override
  _CurrentTasks createState() => _CurrentTasks();
}

class _CurrentTasks extends State<CurrentTasks>{


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
                          image: AssetImage("assets/image_03.png"), // insert the image here
                          fit: BoxFit.cover

                      )
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.2), // adding opacity in order to increase visibility
                                Colors.black.withOpacity(0.1),
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
                                color: Colors.limeAccent[400]
                            ),
                            child: Center(child: Text("Current Tasks", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),)),
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

                  child: _buildCurrentList(),
                )
              ],
            ),


          ),



        ),

      ),

    );
  }
}