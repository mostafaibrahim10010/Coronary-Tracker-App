import 'package:coronarytracker/UI%20Components/results_container.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coronarytracker/Utils/main_variables.dart';

import '../Exercise/exercise.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Health Status Analysis",
              style: GoogleFonts.montserrat(
                  color: HexColor(mainColor),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResultsContainer(
                  color: "#2E86C1",
                  iconPath: "assets/Images/Results/oxygen.png",
                  value: "75",
                  sub: "Cholesterol Level (mg/dl)",
                  circularColor: '#2E86C1',
                  circularValue: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                ResultsContainer(
                  color: "#CB4335",
                  iconPath: "assets/Images/Results/heart.png",
                  value: "75",
                  sub: "Cholesterol Level (mg/dl)",
                  circularColor: '#CB4335',
                  circularValue: 45,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResultsContainer(
                  color: "#F39C12",
                  iconPath: "assets/Images/Results/cholesterol.png",
                  value: "75",
                  sub: "Cholesterol Level (mg/dl)",
                  circularColor: '#F39C12',
                  circularValue: 200,
                ),
                SizedBox(
                  width: 10,
                ),
                ResultsContainer(
                  color: "#884EA0",
                  iconPath: "assets/Images/Results/diabetes.png",
                  value: "75",
                  sub: "Cholesterol Level (mg/dl)",
                  circularColor: '#884EA0',
                  circularValue: 100,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 220,
              child: ElevatedButton(
                  onPressed: () {
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ExerciseScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: HexColor(mainColor) // Background color
                      ),
                  child: Text(
                    'Begin Workout',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 30,
                width: 170,
                child: Text(
                  'Embark on a Fitness Journey yo Enhance Your Well-being',
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
