


import 'dart:convert';

import 'package:flutter_app/src/models/data_model.dart';

class Stats {
  List<DataPoint> graphData;

  Stats.statsFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    graphData = arr.map((graphJson) => DataPoint.dataPointFromJSON(graphJson)).toList();
    graphData.forEach(print);
  }



}