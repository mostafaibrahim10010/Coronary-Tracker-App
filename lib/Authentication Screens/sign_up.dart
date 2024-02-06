import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../UI Components/auth_text_field.dart';
import '../Utils/main_variables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String selected = "None Selected";

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
                child: CircularProgressIndicator(
              color: HexColor(mainColor),
            )));
    try {
      if (password.text == confirmPassword.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
      } else {
        //Alert
      }
    } on FirebaseAuthException catch (e) {
      //Alert
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(
                    "assets/Images/view-anatomic-heart-model-educational-purpose-with-stethoscope.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    HexColor(mainColor).withOpacity(0.9), BlendMode.darken)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Images/Capstone Logo - no back.png",
                  height: 230,
                  width: 230,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Coronary Tracker",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Sign Up",
                            style: GoogleFonts.montserrat(
                                color: HexColor(mainColor),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "Email",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          AuthTextField(controller: email, isPassword: false),
                          const SizedBox(height: 30),
                          Text(
                            "Password",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          AuthTextField(controller: password, isPassword: true),
                          const SizedBox(height: 30),
                          Text(
                            "Confirm Password",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          AuthTextField(
                              controller: confirmPassword, isPassword: true),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 200,
                            child: RadioMenuButton(
                                value: 'Patient',
                                groupValue: selected,
                                onChanged: (selectedValue) {
                                  setState(() {
                                    selected = selectedValue!;
                                  });
                                },
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  elevation: const MaterialStatePropertyAll(2),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 50,
                                      child: Image.asset(
                                          "assets/Images/patient.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Patient",
                                      style: GoogleFonts.montserrat(
                                          color: HexColor(mainColor),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 200,
                            child: RadioMenuButton(
                                value: 'Doctor',
                                groupValue: selected,
                                onChanged: (selectedValue) {
                                  setState(() {
                                    selected = selectedValue!;
                                  });
                                },
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  elevation: const MaterialStatePropertyAll(2),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 50,
                                      child: Image.asset(
                                          "assets/Images/doctor.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    Text("Doctor",
                                        style: GoogleFonts.montserrat(
                                            color: HexColor(mainColor),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                              onTap: signUp,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: HexColor(mainColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            )),
          )),
    );
  }
}
