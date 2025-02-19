import 'package:flutter/material.dart';

import '../Utils/main_variables.dart';

class TimerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TimerButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: smallTextStyle,
        ));
  }
}
