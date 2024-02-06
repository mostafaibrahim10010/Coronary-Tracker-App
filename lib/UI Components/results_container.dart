import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'circular.dart';

class ResultsContainer extends StatelessWidget {
  const ResultsContainer(
      {Key? key,
      required this.color,
      required this.iconPath,
      required this.value,
      required this.sub,
      required this.circularColor,
      required this.circularValue})
      : super(key: key);

  final String color;

  final String circularColor;

  final String iconPath;

  final String value;

  final double circularValue;

  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      height: 230,
      width: 170,
      decoration: BoxDecoration(
        color: HexColor(color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 55,
            child: Image.asset(iconPath),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: CircularIndicatorWithValue(
              value: circularValue, // Adjust value between 0.0 and 1.0
              text: value, color: circularColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            sub,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
