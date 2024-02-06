import 'package:coronarytracker/UI%20Components/medicine_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Utils/main_variables.dart';

class MedicineReminderScreen extends StatelessWidget {
  const MedicineReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),
        backgroundColor: HexColor(mainColor),
        title: Text(
          "Medicine Reminder",
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                  SizedBox(
                    width: 15,
                  ),
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                  SizedBox(
                    width: 15,
                  ),
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                  SizedBox(
                    width: 15,
                  ),
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                  SizedBox(
                    width: 15,
                  ),
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                  SizedBox(
                    width: 15,
                  ),
                  MedicineContainer(
                      iconPath: "assets/Images/pill_rounded.png", medicineName: "medicineName"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child:  Icon(
          Icons.add,
          color: HexColor(mainColor),
        ),
      ),
    );
  }
}
