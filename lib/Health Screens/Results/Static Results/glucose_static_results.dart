import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';

import '../../../Utils/main_variables.dart';



class GlucoseStaticResults extends StatefulWidget {
  const GlucoseStaticResults({Key? key}) : super(key: key);

  @override
  State<GlucoseStaticResults> createState() => _GlucoseStaticResultsState();
}

class _GlucoseStaticResultsState extends State<GlucoseStaticResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Container(
              height: 550,
              child: SfCartesianChart(
                title: const ChartTitle(text: "Glucose Measurement"),
                primaryXAxis: const CategoryAxis(
                ),
                primaryYAxis: const NumericAxis(
                  minimum: 0, // Set the minimum y-axis value to 0.
                  maximum: 100, // Set the maximum y-axis value to 100 (adjust based on your data range).
                  interval: 10,
                ),
                series: [
                  ColumnSeries <ResultsData, String> (
                    dataSource: getColumnData(),
                    xValueMapper: (ResultsData data,_) => data.x,
                    yValueMapper: (ResultsData data,_) => data.y,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  ),

                ],

              ),
            )
          ],
        ),
      ) ,
    );
  }

}



class ResultsData{
  String x;
  double y;

  ResultsData (this.x, this.y);

}

dynamic getColumnData () {

  List <ResultsData> columnData = <ResultsData>[
    ResultsData("Non-invasive Glucose", 90),
    ResultsData("Invasive Glucose", 85)
  ];

  return columnData;

}