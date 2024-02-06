import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import '../Utils/main_variables.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.qrPath})
      : super(key: key);

  final String imagePath;
  final String qrPath;
  final String name;
  final String phoneNumber;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: HexColor(mainColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          ClipOval(child: Image.asset(imagePath, height: 150)),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 150,
              width: 320,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Name: $name",
                        style: GoogleFonts.montserrat(
                            color: HexColor(mainColor),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Grade: 12",
                        style: GoogleFonts.montserrat(
                            color: HexColor(mainColor),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Phone No.: $phoneNumber",
                        style: GoogleFonts.montserrat(
                            color: HexColor(mainColor),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(height: 100, width: 100, child: Image.asset(qrPath)),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                launcher.launchUrl(
                  Uri.parse(
                      'mailto:$email?subject=For inquiries about the Smart Green System&body=I want to ask about....'),
                  mode: launcher.LaunchMode.externalApplication,
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.white // Background color
                  ),
              child: Text(
                'Contact Me',
                style: GoogleFonts.montserrat(
                    color: HexColor(mainColor),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
