import 'package:coronarytracker/UI%20Components/contact_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Utils/main_variables.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),
        backgroundColor: HexColor(mainColor),
        title:  Text(
          "Contact Us",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              ContactContainer(
                  imagePath: "assets/Images/Mostafa Photo.jpg",
                  name: "Mostafa Ibrahim",
                  email: "mostafagameover595@gmail.com",
                  phoneNumber: "01006793761",
                  qrPath: "assets/Images/Mostafa qr-code.png"),
              SizedBox(
                height: 15,
              ),

              ContactContainer(
                  imagePath: "assets/Images/Ahmed Image.jpeg",
                  name: "Ahmed Khaled",
                  email: "aabokhaled2006@gmail.com",
                  phoneNumber: "01025344556",
                  qrPath: "assets/Images/Ahmed qr-code.png"),
              SizedBox(
                height: 15,
              ),

              ContactContainer(
                  imagePath: "assets/Images/Mohamed Image.jpg",
                  name: "Mohamed Hatem",
                  email: "mohamedhatemmut@gmail.com",
                  phoneNumber: "01092068382",
                  qrPath: "assets/Images/Mohamed qr-code.png"),
              SizedBox(
                height: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
