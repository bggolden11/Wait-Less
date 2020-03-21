import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models/waiter_model.dart';
import 'package:flutter_app/src/widgets/waiter_list.dart';

// class to store the details for each waiter
//class Waiter{
//  Waiter({this.name});
//  final String name;
//
//
//}
//List<Waiter> listWaiters = [
//  Waiter(name: 'Iron Man'),
//  Waiter(name: 'Ant-Man'),
//  Waiter(name: 'Spider-Man'),
//  Waiter(name: 'Captain America'),
//  Waiter(name: 'Thanos'),
//  Waiter(name: 'Deadpool'),
//  Waiter(name: 'Black Panther'),
//  Waiter(name: 'Groot'),
//  Waiter(name: 'Nick Fury'),
//  Waiter(name: 'War Machine'),
//
//
//]; // for test will contain all the waiters
//class Waiter_list extends ListTile{ // implementing the layout using list tile
//  Waiter_list(Waiter waiter, BuildContext context) // for each
//      : super( // super class
//      title: Text(waiter.name), // get name
//      //leading: CircleAvatar(backgroundColor: Colors.limeAccent[400], child: Text(waiter.name[0], style: TextStyle(fontSize: 15.0, color: Colors.black87, fontFamily: "Poppins-Medium"))),
//      trailing: new Icon(Icons.details),
//      leading: CircleAvatar( backgroundColor: Colors.transparent,
//        backgroundImage: AssetImage("assets/waiter.png"),),
//      onTap: (){showDialog(context: context, builder: (context) => CustomDialog(
//        title: waiter.name,
//        description: "Currently working on tables A4, A8", // you can change the description later
//      ));} // if you want to add any action that happens when you click a waiter you can add it here
//  );
//}
//
//Widget _buildWaiterList() {
//  return ListView.builder(itemCount: listWaiters.length,
//      itemBuilder: (BuildContext content, int index){
//        Waiter waiter = listWaiters[index];
//        return Waiter_list(waiter, content);
//
//      });
//}

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

class WaiterList extends StatefulWidget { // class for Waiter Page
  @override
  _WaiterList createState() => _WaiterList();
}

class _WaiterList extends State<WaiterList>{


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
                          image: AssetImage("assets/chef.gif"), // insert the image here
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
                            child: Center(child: Text("Waiters Available", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),)),
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

                  child: BuildWaiterList(
                    onWaiterPress: (Waiter w) {
                      showDialog(context: context, builder: (context) => CustomDialog(
                        title: w.toString(),
                        description: "Currently working on tables A4, A8", /// TODO Change description
                      ));
                    },
                    trailingIcon: Icons.details,
                    waiterImage: AssetImage("assets/waiter.png")
                  ),
                )
              ],
            ),


          ),



        ),

      ),

    );
  }
}