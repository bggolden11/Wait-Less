import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/models/data_model.dart';
import 'package:flutter_app/src/models/stats_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

final Dio httpClient = new HTTPClient().dio;

Stats stats;

class StatsScreen extends StatefulWidget { // class for Waiter Page

  StatsScreen(Stats s){
    stats = s;
  }

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class Data {
  Data({this.x, this.y});
  final DateTime x;
  final double y;
}

class _StatsScreenState extends State<StatsScreen>{


  DateTime rangeStart = stats.rangeValues.start;
  DateTime rangeEnd = stats.rangeValues.end;


  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
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




                Container(
                  height: _mediaQueryData.size.height * 0.40,
                  padding: EdgeInsets.only(right: 20),
                  child: SfCartesianChart(
                    margin: const EdgeInsets.all(0),
                    onPointTapped: (pt) {
                      DataPoint clickedPoint = stats.graphData[pt.pointIndex];
                      List<String> times = clickedPoint.avgTime.toString().split('.');
                      String avgTime = '${times[0]}m ${times[1]}s';
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialog(avg: avgTime, taskCount: clickedPoint.taskCount, date: DateFormat.yMMMd().format(clickedPoint.date),)
                      );
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
                    series: <SplineAreaSeries<DataPoint, DateTime>>[
                      SplineAreaSeries<DataPoint, DateTime>(
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
                          dataSource: stats.graphData,
                          xValueMapper: (DataPoint tasks, _) => tasks.date,
                          yValueMapper: (DataPoint tasks, _) => tasks.avgTime)
                    ],
                  ),
                ),

                SafeArea(
//              child: SfRangeSliderTheme(
//                data: SfRangeSliderThemeData(
//                  tickOffset: Offset(0.0, 20.0),
//                  tickSize: Size(3.0, 12.0),
//                  minorTickSize: Size(3.0, 8.0),
//                ),
                  child: SfRangeSelector(
                    min: stats.minDate,
                    max: stats.maxDate,
                    interval: 7,
                    showLabels: true,
                    minorTicksPerInterval: 1,
                    showTicks: true,
                    showTooltip: true,
                    dateFormat: DateFormat('MMMd'),
                    dateIntervalType: DateIntervalType.days,
                    initialValues: stats.rangeValues,
                    onChanged: (values) {
                      setState(() {
                        rangeStart = values.start;
                        rangeEnd = values.end;
                      });
                    },
                    child: Container(
                      height: _mediaQueryData.size.height * 0.20,
                      child: SfCartesianChart(
                        margin: const EdgeInsets.all(0),
                        primaryXAxis: DateTimeAxis(
                            minimum: stats.minDate,
                            maximum: stats.maxDate,
                            isVisible: false,
                            dateFormat: DateFormat('MMMd')
                        ),
                        primaryYAxis: NumericAxis(isVisible: false),
                        plotAreaBorderWidth: 0,
                        series: <SplineAreaSeries<DataPoint, DateTime>>[
                          SplineAreaSeries<DataPoint, DateTime>(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.cyanAccent.withOpacity(0.9), // adding opacity in order to increase visibility
                                    Colors.blueAccent.withOpacity(0.4),
                                  ]
                              ),
                              dataSource: stats.graphData,
                              xValueMapper: (DataPoint tasks, _) => tasks.date,
                              yValueMapper: (DataPoint tasks, _) => tasks.avgTime)
                        ],
                      ),
                    ),
                  ),

//              ),
                ),






              ],
            ),


          ),



        ),

      ),

    );
  }
}

class CustomDialog extends StatelessWidget{ // this is a custom dialog box and for adding anything in the popup edit this
  String avg;
  int taskCount;
  String date;

  CustomDialog({this.date, this.avg, this.taskCount});
  @override
  Widget build(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),

    );
  }
  dialogContent(BuildContext context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              top: 200,
              bottom: 16,
              left: 16,
              right: 16
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),

                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Completed Tasks: $taskCount',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,

                ),

              ),
              SizedBox(height: 16.0),
              Text('Average Completion Time: $avg',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                ),),
              SizedBox(height: 24.0),
              Text('Date of Tasks: $date',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                ),),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[


                  RaisedButton(
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
              ),
            ],
          ),

        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 100,
            backgroundImage: AssetImage('assets/completed.gif'),
          ),
        )
      ],
    );
  }
}




