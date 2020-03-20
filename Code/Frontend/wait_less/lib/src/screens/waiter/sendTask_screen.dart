import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// class to store the details for each waiter
class Waiter{
  Waiter({this.name});
  final String name;


}
List<Waiter> listWaiters = [
  Waiter(name: 'Iron Man'),
  Waiter(name: 'Ant-Man'),
  Waiter(name: 'Spider-Man'),
  Waiter(name: 'Captain America'),
  Waiter(name: 'Thanos'),
  Waiter(name: 'Deadpool'),
  Waiter(name: 'Black Panther'),
  Waiter(name: 'Groot'),
  Waiter(name: 'Nick Fury'),
  Waiter(name: 'War Machine'),


]; // for test will contain all the waiters
class WaiterList extends ListTile{ // implementing the layout using list tile
  WaiterList(Waiter waiter, BuildContext context) // for each
      : super( // super class
      title: Text(waiter.name), // get name
      //leading: CircleAvatar(backgroundColor: Colors.limeAccent[400], child: Text(waiter.name[0], style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
      trailing: new Icon(Icons.send),
      leading: CircleAvatar( backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("assets/user.png"),),
      onTap: (){} // if you want to add any action that happens when you click a waiter you can add it here
  );
}

Widget _buildWaiterList() {
  return ListView.builder(itemCount: listWaiters.length,
      itemBuilder: (BuildContext content, int index){
        Waiter waiter = listWaiters[index];
        return WaiterList(waiter, content);

      });
}
class SendTask extends StatefulWidget {
  @override
  _SendTask createState() => _SendTask();
}

class _SendTask extends State<SendTask> {

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

                child: _buildWaiterList(),
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