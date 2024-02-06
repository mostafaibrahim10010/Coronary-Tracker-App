import 'package:coronarytracker/Utils/main_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MedicineContainer extends StatelessWidget {
  const MedicineContainer(
      {Key? key, required this.iconPath, required this.medicineName})
      : super(key: key);

  final String iconPath;

  final String medicineName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 150,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: HexColor(mainColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(iconPath),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            medicineName,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
