import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainMenu extends StatelessWidget {

  /// Keep this line
  static final String route = '/mainMenu';

  @override
  Widget build(BuildContext context) {
    /// Keep this line
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);


    return Scaffold(
      body: Text(
          'Harsh, complete the main menu... don\'t delete the static route field and don\'t change the name of this class plzzzz'
      ),
      appBar: AppBar(
        title: Text('Change me plz'),
      ),
    );
  }

}