import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WaiterPage extends StatefulWidget { // class for Waiter Page
  @override
  _WaiterPage createState() => _WaiterPage();
}

class _WaiterPage extends State<WaiterPage>{
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
        child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[

                      new Align(alignment: Alignment.centerLeft, child: new Text(
                        'Your Tasks', // for the area where the current tasks would be developed
                        style:TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                      )),
                    ],
                  ),
                  Padding( // provide padding to create some space between the title and the buttons
                    padding: EdgeInsets.only(top: 20.0),

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
//                            'Your Tasks', // for the area where the current tasks would be developed
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
                  )
                ],
              ),


            )



        ),

      ),

    );
  }
}