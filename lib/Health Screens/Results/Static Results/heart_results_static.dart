import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';

import '../../../Utils/main_variables.dart';

class ResultsGStatic extends StatefulWidget {
  const ResultsGStatic({Key? key}) : super(key: key);

  @override
  State<ResultsGStatic> createState() => _ResultsGStaticState();
}

class _ResultsGStaticState extends State<ResultsGStatic> {
  triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: "Alert Notification",
            body: "Check Your Health Status"));
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          if (!isAllowed)
            {AwesomeNotifications().requestPermissionToSendNotifications()}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          onPressed: triggerNotification,
          backgroundColor: HexColor(mainColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 550,
              child: SfCartesianChart(
                title: const ChartTitle(text: "Heart Rate"),
                primaryXAxis: const CategoryAxis(
                  title: AxisTitle(text: "Heart Beats"),
                ),
                primaryYAxis: const NumericAxis(
                  minimum: 50,
                  // Set the minimum y-axis value to 0.
                  maximum: 60,
                  // Set the maximum y-axis value to 100 (adjust based on your data range).
                  interval: 1,
                  title: AxisTitle(text: "Number of beats per minute"),
                ),
                series: [
                  ColumnSeries<ResultsData, String>(
                    dataSource: getColumnData(),
                    xValueMapper: (ResultsData data, _) => data.x,
                    yValueMapper: (ResultsData data, _) => data.y,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultsData {
  String x;
  double y;

  ResultsData(this.x, this.y);
}

dynamic getColumnData() {
  List<ResultsData> columnData = <ResultsData>[
    ResultsData("HR actual", 57),
    ResultsData("HR estimated", 58.62)
  ];

  return columnData;
}
