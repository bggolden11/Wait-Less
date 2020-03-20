import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// this page is here just to keep a track of previous UI please don't delete this at all

class Task{
  Task({this.name, this.table, this.description});
  final String name;
  final String table;
  final String description;

}


class CurrentTasks extends StatefulWidget { // class for Waiter Page
  @override
  _CurrentTasks createState() => _CurrentTasks();
}

class _CurrentTasks extends State<CurrentTasks>{
  // make a list of all the task which can be updated with a call to the backend
  // for now I am implementing it with 8 of these tasks and populating the list with the same images but you can later add the
  // other functionality here
  // also this is a nice tutorial for the same, I couldn't understand it that well so I tried to implement as much as possible
  // All the images are from vecteezy, <a href="https://www.vecteezy.com/free-vector/food">Food Vectors by Vecteezy</a>
  List<String> taskList = [
    'assets/task2.jpg','assets/task1.jpg','assets/task3.jpg','assets/task4.jpg','assets/task2.jpg','assets/task1.jpg','assets/task3.jpg','assets/task4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // this is the main body and has bunch of containers
        //fit: StackFit.expand,
        child: Container(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Align(alignment: Alignment.centerLeft, child: new Text(
                      'Current Tasks', // for the area where the current tasks would be developed
                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                    )),
                  ],
                ),
                Padding( // provide padding to create some space between the title and the buttons
                  padding: EdgeInsets.only(top: 1.0),

                ),
//                Container( // this button is for completed tasks
//                  width: double.infinity,
//                  height: 180,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20),
//                      image: DecorationImage(
//                          image: AssetImage("assets/ctasks.jpg"), // insert the image here
//                          fit: BoxFit.cover
//
//                      )
//                  ),
//                  child: Container(
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(20),
//                          gradient: LinearGradient(
//                              begin: Alignment.bottomRight,
//                              colors: [
//                                Colors.black.withOpacity(0.4), // adding opacity in order to increase visibility
//                                Colors.black.withOpacity(0.2),
//                              ]
//                          )
//                      ),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        children: <Widget>[
////                          Text(
////                            'Completed Tasks', // for the area where the current tasks would be developed
////                            style:TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Poppins-Medium"),
////
////                          ),
//                          SizedBox(height: 10,),
//                          Container(
//                            height: 50,
//                            margin: EdgeInsets.symmetric(horizontal: 40),
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(10),
//                                color: Colors.redAccent[200]
//                            ),
//                            child: Center(child: Text("Completed Tasks", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
//                          ),
//                          SizedBox(height: 20,),
//                        ],
//                      )
//                  ),
//                ),
                SizedBox(height: 20,), // just for padding
                Column(
                  children: <Widget>[

//                    new Align(alignment: Alignment.centerLeft, child: new Text(
//                      'Current Tasks', // for the area where the current tasks would be developed
//                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
//                    )),
                  ],
                ),
                Expanded( // for the grid view, currently it goes through the list called task list and makes those many tasks, once we can populate the tasks you
                  // can change the image at line 166 to a fixed one and it will work
                    child: GridView.count( // using GridView layout by flutter and you don't need to use scroll becuase it does it for us
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: taskList.map((item) => Card( // making a card for each using the card layout
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(

                          decoration: BoxDecoration( // dimension of the box and the image
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.cover
                              )
                          ),

                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(0.3), // adding opacity in order to increase visibility
                                      Colors.black.withOpacity(0.1),
                                    ]
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[


                                //SizedBox(height: 20,),
                                Container(
                                  child: Transform.translate( // this is just for an optional icon we can use it to enhance capablities by showing it's pending, current or almost done
                                    // it's a future job
                                    offset: Offset(50, -50),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white70
                                      ),
                                      child: Icon(Icons.assignment, size: 30,), // you can change the icon if you want

                                    ),

                                  ),
                                ),
                                Container(
                                  height: 20,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white70,
                                  ),
                                  child: Center(child: Text("Task Name", style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: "Poppins-Medium"),)),
                                ),
                              ],
                            ),
                          ),
                        ),

                      )).toList(),
                    )
                )
              ],
            ),


          ),



        ),

      ),

    );
  }
}