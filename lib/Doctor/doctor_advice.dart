import 'package:coronarytracker/Utils/main_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DoctorAdviceScreen extends StatefulWidget {
  const DoctorAdviceScreen({Key? key}) : super(key: key);

  @override
  State<DoctorAdviceScreen> createState() => _DoctorAdviceScreenState();
}

class _DoctorAdviceScreenState extends State<DoctorAdviceScreen> {
  @override
  final controller = WebViewController()
    ..loadRequest(Uri.parse("https://www.vezeeta.com/"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),
        title:  Text(
          "Explore Doctors",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: HexColor(mainColor),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
