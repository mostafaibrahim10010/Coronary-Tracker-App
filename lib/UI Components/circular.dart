import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CircularIndicatorWithValue extends StatelessWidget {
  final double value;
  final String text;
  final String color;

  const CircularIndicatorWithValue({
    Key? key,
    required this.value,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            value: value,
            backgroundColor: HexColor(color),
            strokeWidth: 6,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
