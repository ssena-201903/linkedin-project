import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class ShowAllSection extends StatelessWidget {
  final String text;
  const ShowAllSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Constants.horizontalDividerColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              textContent: text,
              textSize: 14,
              textWeight: FontWeight.w600,
              textColor: Constants.mainBlackColor,
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward, size: 20),
          ],
        ),
      ),
    );
  }
}
