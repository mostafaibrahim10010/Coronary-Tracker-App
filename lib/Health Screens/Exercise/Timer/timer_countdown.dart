import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../UI Components/timer_button.dart';
import '../../../Utils/main_variables.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key}) : super(key: key);

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

final _countDownController = CountDownController();

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),
        backgroundColor: HexColor(mainColor),
        title: Text(
          "Timer",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularCountDownTimer(
              controller: _countDownController,
              duration: 600,
              isReverse: true,
              fillColor: HexColor(mainColor),
              height: 250,
              width: 250,
              strokeWidth: 40,
              onComplete: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Finished',
                    style: smallTextStyle,
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  backgroundColor: HexColor(mainColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // padding: const EdgeInsets.only(left: 20, top: 20),
                ));
              },
              strokeCap: StrokeCap.round,
              isReverseAnimation: true,
              ringColor: Colors.grey,
              autoStart: true,
              textStyle: largeTextStyle,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimerButton(
                  text: 'Restart',
                  onPressed: () => _countDownController.start()),
              TimerButton(
                  text: 'Pause', onPressed: () => _countDownController.pause()),
              TimerButton(
                  text: 'Resume',
                  onPressed: () => _countDownController.resume()),
            ],
          )
        ],
      ),
    );
  }
}
