import 'package:coronarytracker/Health%20Screens/Results/Static%20Results/glucose_static_results.dart';
import 'package:coronarytracker/Health%20Screens/Results/Static%20Results/heart_results_static.dart';
import 'package:coronarytracker/Health%20Screens/Results/Static%20Results/oxygen_static_results.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter/material.dart';

import '../../../Utils/main_variables.dart';

class ResultViewScreen extends StatefulWidget {
  const ResultViewScreen({Key? key}) : super(key: key);

  @override
  State<ResultViewScreen> createState() => _ResultViewScreenState();
}

class _ResultViewScreenState extends State<ResultViewScreen> {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: HexColor(mainColor)));
    return DefaultTabController(
        length: 3,
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
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      child: const Text("Heart",
                          style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Text("Oxygen",
                          style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Text("Glucose",
                          style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(children: <Widget>[
            ResultsGStatic(),
            OxygenStaticResults(),
            GlucoseStaticResults(),
          ]),
        ));
  }
}


