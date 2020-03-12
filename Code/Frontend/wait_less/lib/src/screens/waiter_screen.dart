import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WaiterPage extends StatefulWidget { // class for Waiter Page
  @override
  _WaiterPage createState() => _WaiterPage();
}

class _WaiterPage extends State<WaiterPage>{
  // make a list of all the task which can be updated with a call to the backend
  // for now I am implementing it with 8 of these tasks and populating the list with the same images but you can later add the
  // other functionality here
  // also this is a nice tutorial for the same, I couldn't understand it that well so I tried to implement as much as possible
  // All the images are from vecteezy, <a href="https://www.vecteezy.com/free-vector/food">Food Vectors by Vecteezy</a>
  final List<String> taskList = [
    'assets/task1.jpg','assets/task2.jpg','assets/task3.jpg','assets/task4.jpg','assets/task1.jpg','assets/task2.jpg','assets/task3.jpg','assets/task4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( // to edit anything in the appbar
        backgroundColor: Colors.transparent, // no background color
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 90, // provides the appbar with 40 elevation to remove the shadow
        title: new Center(child: new Text("Wait Less", style: TextStyle(color: Colors.black, fontFamily: "Poppins-Bold"))), // center the name of the app
        //leading: Icon(Icons.menu),

        actions: <Widget>[ // for the menu and the notifications center
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("1")), // once notifications are implemented we can increase and decrease the counter accordingly and implement this
            ),
          )

        ],
      ),
      drawer: new Drawer( // this is for the navBar or the sideBar, don't edit unless you want to edit something on the menu
        child: new ListView(
          children: <Widget>[ // Drawer class for the navbar and edit User Header if needed to change anything on the User Header Section (Image)
            new UserAccountsDrawerHeader(accountName: new Text("Harsh Gupta", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Poppins-Medium")), accountEmail: new Text("1024023", style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Poppins-Medium",)), decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/task4.jpg"),

                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                )
            ),
            ),

            new Divider(), // like a padding divides the image with the options in the menu
            new ListTile( // different options and their icons from Icons package
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
            ),
            new ListTile(
              title: new Text("Account"),
              trailing: new Icon(Icons.account_circle),
            ),
            new ListTile(
              title: new Text("Current Task"),
              trailing: new Icon(Icons.assignment),
            ),
            new ListTile(
              title: new Text("Completed Task"),
              trailing: new Icon(Icons.assignment_turned_in),
            ),
            new ListTile(
              title: new Text("Call Manager"),
              trailing: new Icon(Icons.call),
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.cancel),
            ),
          ],
        ),
      ),
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

                      new Align(alignment: Alignment.centerLeft, child: new Text(
                        'Your Tasks', // for the area where the current tasks would be developed
                        style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                      )),
                    ],
                  ),
                  Padding( // provide padding to create some space between the title and the buttons
                    padding: EdgeInsets.only(top: 10.0),

                  ),
                  Container( // this button is for completed tasks
                    width: double.infinity,
                    height: 180,
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
                                  Colors.black.withOpacity(0.4), // adding opacity in order to increase visibility
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
                              child: Center(child: Text("Completed Tasks", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                            ),
                            SizedBox(height: 20,),
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 20,), // just for padding
                  Column(
                    children: <Widget>[

                      new Align(alignment: Alignment.centerLeft, child: new Text(
                        'Current Tasks', // for the area where the current tasks would be developed
                        style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                      )),
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