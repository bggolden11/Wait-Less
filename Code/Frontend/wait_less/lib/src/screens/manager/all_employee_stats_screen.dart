import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class StatsScreen extends StatefulWidget { // class for Waiter Page
  @override
  _StatsScreenState createState() => _StatsScreenState();
}
class Data {
  Data({this.x, this.y});
  final DateTime x;
  final double y;
}


class _StatsScreenState extends State<StatsScreen>{


  DateTime rangeStart = DateTime(2020, 02, 28);
  DateTime rangeEnd = DateTime(2020, 03, 14);
  final DateTime _min = DateTime(2020, 02, 19);
  final DateTime _max = DateTime(2020, 04, 02);
  SfRangeValues _values = SfRangeValues(DateTime(2020, 02, 28), DateTime(2020, 03, 14));

  final List<Data> chartData = <Data>[
    Data(x: DateTime(2020, 02, 19), y: 4),
    Data(x: DateTime(2020, 02, 23), y: 3.4),
    Data(x: DateTime(2020, 02, 28), y: 2.8),
    Data(x: DateTime(2020, 03, 01), y: 1.6),
    Data(x: DateTime(2020, 03, 9), y: 2.3),
    Data(x: DateTime(2020, 03, 14), y: 2.5),
    Data(x: DateTime(2020, 03, 22), y: 2.9),
    Data(x: DateTime(2020, 03, 30), y: 3.8),
    Data(x: DateTime(2020, 04, 02), y: 3.7),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // this is the main body and has bunch of containers
        //fit: StackFit.expand,
        child: Container(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Align(alignment: Alignment.centerLeft, child: new Text(
                      'Task Statistics', // for the area where the current tasks would be developed
                      style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: "Poppins-Medium"),
                    )),
                  ],
                ),
                Padding( // provide padding to create some space between the title and the buttons
                  padding: EdgeInsets.only(top: 1.0),

                ),
                SizedBox(height: 30,), // just for padding




//                AspectRatio(
//                  aspectRatio: 1,
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: const BorderRadius.all(
//                          Radius.circular(18),
//                        ),
//                        color: const Color(0xff232d37)),
//                    child: Padding(
//                      padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
//                      child: LineChart(
//                        mainData(),
//                      ),
//                    ),
//                  ),
//                ),


//                SfRangeSelector(
//                  min: _min,
//                  max: _max,
//                  showLabels: true,
//                  showTicks: true,
//                  interval: 1,
//                  dateFormat: DateFormat.y(),
//                  dateIntervalType: DateIntervalType.years,
//                  initialValues: _values,
//                  child: Container(
//                    height: 130,
//                    child: SfCartesianChart(
//                      margin: const EdgeInsets.all(0),
//                      primaryXAxis: DateTimeAxis(
//                        minimum: _min,
//                        maximum: _max,
//                        isVisible: false,),
//                      primaryYAxis: NumericAxis(isVisible: false),
//                      plotAreaBorderWidth: 0,
//                      series: <SplineAreaSeries<Data, DateTime>>[
//                        SplineAreaSeries<Data, DateTime>(
//                            color: Color.fromARGB(255, 126, 184, 253),
//                            dataSource: chartData,
//                            xValueMapper: (Data sales, _) => sales.x,
//                            yValueMapper: (Data sales, _) => sales.y)


                Container(
                  height: 400,
                  padding: EdgeInsets.only(right: 20),
                  child: SfCartesianChart(
                    margin: const EdgeInsets.all(0),
                    onPointTapped: (pt) {
                      print('${pt.pointIndex}');
                    },
                    primaryXAxis: DateTimeAxis(
                      title: AxisTitle(text: 'Date'),
                      interval: 3,
                      minimum: rangeStart,
                      maximum: rangeEnd,
                      isVisible: true,
                      dateFormat: DateFormat('MMMd'),
                    ),
                    primaryYAxis: NumericAxis(
                      isVisible: true,
                      title: AxisTitle(text: 'Average Task Completion Time'),
                    ),
                    plotAreaBorderWidth: 0,
                    title: ChartTitle(text: 'Avg Task Completion Timer Per Day'),
                    series: <SplineAreaSeries<Data, DateTime>>[
                      SplineAreaSeries<Data, DateTime>(
                          markerSettings: MarkerSettings(
                              isVisible: true,
                              width: 10,
                              height: 10,
                              borderWidth: 5,
                              borderColor: Colors.cyan
                          ),
//                          color: Color.fromARGB(255, 126, 184, 253),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.cyanAccent.withOpacity(0.9), // adding opacity in order to increase visibility
                                Colors.blueAccent.withOpacity(0.4),
                              ]
                          ),
                          dataSource: chartData,
                          xValueMapper: (Data sales, _) => sales.x,
                          yValueMapper: (Data sales, _) => sales.y)
                    ],
                  ),
                ),

              Center(
                child: SfRangeSliderTheme(
                  data: SfRangeSliderThemeData(
                    tickOffset: Offset(0.0, 20.0),
                    tickSize: Size(3.0, 12.0),
                    minorTickSize: Size(3.0, 8.0),
                  ),
                  child: SfRangeSelector(
                    min: _min,
                    max: _max,
                    interval: 7,
                    showLabels: true,
                    minorTicksPerInterval: 1,
                    showTicks: true,
                    showTooltip: true,
                    dateFormat: DateFormat('MMMd'),
                    dateIntervalType: DateIntervalType.days,
                    initialValues: _values,
                    onChanged: (values) {
                      setState(() {
                        rangeStart = values.start;
                        rangeEnd = values.end;
                      });
                    },
                    child: Container(
                      height: 100,
                      child: SfCartesianChart(
                        margin: const EdgeInsets.all(0),
                        primaryXAxis: DateTimeAxis(
                            minimum: _min,
                            maximum: _max,
                            isVisible: false,
                            dateFormat: DateFormat('MMMd')
                        ),
                        primaryYAxis: NumericAxis(isVisible: false),
                        plotAreaBorderWidth: 0,
                        series: <SplineAreaSeries<Data, DateTime>>[
                          SplineAreaSeries<Data, DateTime>(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.cyanAccent.withOpacity(0.9), // adding opacity in order to increase visibility
                                    Colors.blueAccent.withOpacity(0.4),
                                  ]
                              ),
                              dataSource: chartData,
                              xValueMapper: (Data sales, _) => sales.x,
                              yValueMapper: (Data sales, _) => sales.y)
                        ],
                      ),
                    ),
                  ),

                ),
              ),





              ],
            ),


          ),



        ),

      ),

    );
  }
}






