import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../Utils/main_variables.dart';

class ResultsGraph extends StatefulWidget {
  const ResultsGraph({Key? key, required this.title}) : super(key: key);

  @override
  State<ResultsGraph> createState() => _ResultsGraphState();

  final String title;
}

class _ResultsGraphState extends State<ResultsGraph> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                color: Colors.white, // <-- SEE HERE
              ),
              backgroundColor: HexColor(mainColor),
              title: Text(
                "Results",
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    color: HexColor(mainColor),
                    xValueMapper: (LiveData sales, _) => sales.heartBeats,
                    yValueMapper: (LiveData sales, _) => sales.NoF,
                  )
                ],
                primaryXAxis: const NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 1,
                    title: AxisTitle(text: 'Heart Beats')),
                primaryYAxis: const NumericAxis(
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Number of beats per second')))));
  }

  int time = 19;

  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 60),
      LiveData(1, 70),
      LiveData(2, 65),
      LiveData(3, 75),
      LiveData(4, 84),
      LiveData(5, 78),
      LiveData(6, 67),
      LiveData(7, 64),
      LiveData(8, 80),
      LiveData(9, 91),
      LiveData(10, 87),
      LiveData(11, 0),
      LiveData(12, 0),
      LiveData(13, 0),
      LiveData(14, 0),
      LiveData(15, 0),
      LiveData(16, 0),
      LiveData(17, 0),
      LiveData(18, 0),
      LiveData(19, 90),
      LiveData(20, 76),
    ];
  }
}

class LiveData {
  LiveData(this.heartBeats, this.NoF);

  final int heartBeats;
  final num NoF;
}
