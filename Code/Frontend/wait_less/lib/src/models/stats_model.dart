import 'dart:convert';

import 'package:flutter_app/src/models/data_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Stats {
  List<DataPoint> graphData;
  DateTime minDate;
  DateTime maxDate;
  SfRangeValues rangeValues;

  Stats.statsFromJSON(String parsedJSON){
    var arr = jsonDecode(parsedJSON)['result'] as List;
    graphData = arr.map((graphJson) => DataPoint.dataPointFromJSON(graphJson)).toList();
    minDate = graphData[0].date;
    maxDate = graphData[graphData.length-1].date;
    rangeValues = SfRangeValues(graphData[(graphData.length ~/ 2) - 3].date, graphData[(graphData.length ~/ 2) + 3].date);
    graphData.forEach(print);
  }



}