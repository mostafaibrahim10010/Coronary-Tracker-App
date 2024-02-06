import 'package:coronarytracker/Utils/main_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeButton extends StatelessWidget {
  const HomeButton(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.link})
      : super(key: key);

  final String iconPath;
  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 160,
      child: ElevatedButton(
        onPressed: () {
          launcher.launchUrl(
            Uri.parse(link),
            mode: launcher.LaunchMode.externalApplication,
          );
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white // Background color
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: HexColor(mainColor).withOpacity(0.9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: SizedBox(
                    height: 26, width: 30, child: Image.asset(iconPath)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style:  GoogleFonts.montserrat(
                  color: HexColor(mainColor).withOpacity(0.9),
                  fontSize: 11,
                  fontWeight: FontWeight.bold)
            )
          ],
        ),
      ),
    );
  }
}
