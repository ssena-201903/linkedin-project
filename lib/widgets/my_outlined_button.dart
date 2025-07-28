import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

// grey buttons
class MyOutlinedButton extends StatelessWidget {
  final String textButton;
  const MyOutlinedButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: Constants.buttonRadius),
        side: BorderSide(color: Constants.buttonGreyBorder),
      ),
      onPressed: () {},
      child: MyText(
        textContent: textButton,
        textSize: Constants.buttonTextSize,
        textWeight: Constants.buttonTextWeight,
        textColor: Constants.buttonGreyTextColor,
      ),
    );
  }
}