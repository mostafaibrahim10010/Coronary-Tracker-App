import 'package:coronarytracker/Health%20Screens/Results/results_graph.dart';
import 'package:coronarytracker/Health%20Screens/Results/results_numerical.dart';
import 'package:coronarytracker/Health%20Screens/Results/Static%20Results/heart_results_static.dart';
import 'package:coronarytracker/Health%20Screens/Results/results_view.dart';
import 'package:coronarytracker/Utils/main_variables.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({Key? key}) : super(key: key);

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  int index = 0;

  final screens = [
    const ResultsGraph(title: "Graph Results"),
    const ResultViewScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: HexColor(mainColor),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[//Icon
          Icon(
            Icons.monitor_heart_outlined,
            color: Colors.white,
            size: 25,
          ), //Icon
          Icon(
            Icons.auto_graph_outlined,
            color: Colors.white,
            size: 25,
          ),//Icon
        ],
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ), //CurvedN,
    );
  }
}