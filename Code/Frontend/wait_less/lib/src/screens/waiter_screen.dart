
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
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: Icon(Icons.menu),

        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("1")),
            ),
          )

        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[ // Drawer class for the navbar and edit User Header if needed to change anything on the User Header Section (Image)
            new UserAccountsDrawerHeader(accountName: new Text("Harsh Gupta", style: TextStyle(color: Colors.black87)), accountEmail: new Text("1024023", style: TextStyle(color: Colors.black87)), decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/waiter.jpg"),
                fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop)
              )
            ),
            ),
            new ListTile(
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/image_02.png")
            ],
          ),

        ],
      ),

    );
  }
}


























