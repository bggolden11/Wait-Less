
import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiningTable {
  final String diningTableId;
  final int employeeID;
  final int seats;
  final bool isActive;
  final bool isOccupied;
  final String seatingTime;
  final String reservationName;
  final bool hasBirthday;
  final String specialRequest;
  final AssetImage image;

  DiningTable( {this.diningTableId, this.employeeID, this.seats, this.isActive, this.isOccupied, this.seatingTime, this.reservationName, this.hasBirthday, this.specialRequest, this.image } );

  DiningTable.diningTableFromJSON(Map<String, dynamic> parsedJSON)
      : diningTableId = parsedJSON['diningTableId'] ?? parsedJSON['diningTableID'] ?? '',
        employeeID = parsedJSON['employeeId'] ?? parsedJSON['employeeID'] ?? 0,
        seats = parsedJSON['seats'] ?? 0,
        isActive = parsedJSON['isActive'] ?? false,
        isOccupied = parsedJSON['isOccupied'] ?? false,
        seatingTime = parsedJSON['seatingTime'] ?? '',
        reservationName = parsedJSON['reservationName'] ?? '',
        hasBirthday = parsedJSON['hasBirthday'] ?? false,
        specialRequest = parsedJSON['specialRequest'] ?? '',
        image = AssetImage('assets/task${1+(Random.secure().nextInt(4))}.jpg');


}