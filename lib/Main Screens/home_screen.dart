import 'package:coronarytracker/Doctor/doctor_advice.dart';
import 'package:coronarytracker/Health%20Screens/Computer%20Vision/computer_vision.dart';
import 'package:coronarytracker/Health%20Screens/Exercise/exercise.dart';
import 'package:coronarytracker/Health%20Screens/Medicine%20Reminder/medicine_reminder.dart';
import 'package:coronarytracker/Main%20Screens/contact_us.dart';
import 'package:coronarytracker/UI%20Components/home_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Health Screens/Results/main_results.dart';
import '../Health Screens/Results/results_numerical.dart';
import '../Utils/main_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 41,
                              width: 160,
                              child: Text(
                                "Hello, Man",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    color: HexColor(mainColor),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                                height: 41,
                                width: 35,
                                child: Image.asset("assets/Images/hello.png"))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            height: 50,
                            width: 197,
                            child: Text(
                              "Today is A Good Day to Improve Your Health.",
                              style: GoogleFonts.montserrat(
                                  color: HexColor(mainColor),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/Images/Real Doctor.png")),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: const AssetImage("assets/Images/Results.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            HexColor(mainColor).withOpacity(0.8),
                            BlendMode.darken)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                    "assets/Images/Home/profile.png")),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Coronary Ultra Care Suit",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Your Participation From Dec. is Ready",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: SizedBox(
                            height: 40,
                            width: 180,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor:
                                        Colors.white // Background color
                                    ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ResultsView()));
                                },
                                child: Text(
                                  "Check Results",
                                  style: GoogleFonts.montserrat(
                                      color: HexColor(mainColor),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomeButton(
                            iconPath: "assets/Images/Home/Location.png",
                            title: "Live Location",
                            link: "https://maps.app.goo.gl/24jfacc44hPiiGVVA"),
                        SizedBox(
                          width: 10,
                        ),
                        HomeButton(
                            iconPath: "assets/Images/Home/Chat.png",
                            title: "AI Assistant",
                            link: "https://poe.com/ChatGPT"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomeButton(
                            iconPath: "assets/Images/Home/Email.png",
                            title: "Contact Us",
                            link: "mailto:cucs.cad@gmail.com"),
                        SizedBox(
                          width: 10,
                        ),
                        HomeButton(
                            iconPath: "assets/Images/Home/Survey.png",
                            title: "Fill Survey",
                            link: "https://forms.gle/2GRWHJXpUzJRdAJA7"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: HexColor(mainColor),
              ), //BoxDecoration

              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: HexColor(mainColor)),
                currentAccountPicture:
                    Image.asset('assets/Images/Capstone Logo - no back.png'),
                currentAccountPictureSize: const Size.square(40),
                accountName: Text(
                  "Coronary Tracker",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  user.email!,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.graphic_eq_outlined),
              title: Text(
                ' Track Your Status ',
                style: GoogleFonts.montserrat(
                    color: HexColor(mainColor),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const ResultsView()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.medication_outlined),
              title: Text(' Medicine Reminder ',
                  style: GoogleFonts.montserrat(
                      color: HexColor(mainColor),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MedicineReminderScreen()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.accessibility_new_outlined),
              title: Text(' CV Assistant ',
                  style: GoogleFonts.montserrat(
                      color: HexColor(mainColor),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CVAssistantScreen()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.sports_gymnastics_outlined),
              title: Text(' Exercise ',
                  style: GoogleFonts.montserrat(
                      color: HexColor(mainColor),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const ExerciseScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_information_outlined),
              title: Text(' Explore Doctors ',
                  style: GoogleFonts.montserrat(
                      color: HexColor(mainColor),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const DoctorAdviceScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(' Contact Us ',
                  style: GoogleFonts.montserrat(
                      color: HexColor(mainColor),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ContactUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Log Out',
                  style: GoogleFonts.montserrat(
                      color: HexColor(mainColor),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              onTap: handleLoginOutPopup,
            ),
          ],
        ),
      ),
    );
  }

  handleLoginOutPopup() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Login Out",
      desc: "Do you want to login out now?",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: HexColor(mainColor),
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: signUserOut,
          color: HexColor(mainColor),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
