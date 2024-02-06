import 'package:coronarytracker/Authentication%20Screens/sign_up.dart';
import 'package:coronarytracker/UI%20Components/auth_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Utils/main_variables.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // sign user in method
  void showSnackbarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(
            seconds: 2), // Optional: Set the duration to display the snackbar
      ),
    );
  }

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: HexColor(mainColor),
          ),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: HexColor(mainColor),
          title: const Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: HexColor(mainColor),
          title: const Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
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
                            "Login",
                            style: GoogleFonts.montserrat(
                                color: HexColor(mainColor),
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "Email",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          AuthTextField(controller: email, isPassword: false),
                          const SizedBox(height: 30),
                          Text(
                            "Password",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          AuthTextField(controller: password, isPassword: true),
                          const SizedBox(height: 20),
                          GestureDetector(
                              onTap: signUserIn,
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
                                    "Login",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account yet ?",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey.withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              TextButton(
                                child: Text(" Sign Up",
                                    style: GoogleFonts.montserrat(
                                        color: HexColor(mainColor),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const SignUpScreen()));
                                },
                              )
                            ],
                          )
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
