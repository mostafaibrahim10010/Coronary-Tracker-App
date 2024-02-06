import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';

import '../../../Utils/main_variables.dart';

class OxygenStaticResults extends StatefulWidget {
  const OxygenStaticResults({Key? key}) : super(key: key);

  @override
  State<OxygenStaticResults> createState() => _OxygenStaticResultsState();
}

class _OxygenStaticResultsState extends State<OxygenStaticResults> {
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
                title: const ChartTitle(text: "Oxygen Level"),
                primaryXAxis: const CategoryAxis(
                  title: AxisTitle(
                      text: "Oxygen Saturation"
                  ),
                ),
                primaryYAxis: const NumericAxis(
                  minimum: 90, // Set the minimum y-axis value to 0.
                  maximum: 100, // Set the maximum y-axis value to 100 (adjust based on your data range).
                  interval: 1,
                  title: AxisTitle(
                      text: "Percentage"
                  ),
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
    ResultsData("SpO2 actual", 98),
    ResultsData("SpO2 estimated", 99)
  ];

  return columnData;

}