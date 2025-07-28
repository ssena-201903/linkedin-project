import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String textButton;
  const CustomOutlinedButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(color: Constants.buttonGreyBorder),
      ),
      onPressed: () {},
      child: MyText(
        textContent: textButton,
        textSize: 16,
        textWeight: FontWeight.w600,
        textColor: Constants.buttonGreyTextColor,
      ),
    );
  }
}
