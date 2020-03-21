import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/widgets/waiter_list.dart';

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

                child: BuildWaiterList(
                    onWaiterTap: () {},
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