import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class GameCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String dayCount;
  final String date;
  final String buttonText;

  const GameCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.dayCount,
    required this.date,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Constants.verticalDividerColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40, width: 40, child: Image.asset(imagePath)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // rich text
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$name",
                        style: TextStyle(
                          color: Constants.mainBlackColor,
                          fontSize: Constants.fontSizeMidTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " #$dayCount",
                        style: TextStyle(
                          color: Constants.mainBlackColor,
                          fontSize: Constants.fontSizeMidTitle,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                MyText(
                  textContent: "$date",
                  textSize: Constants.fontSizeMiniTitle,
                  textWeight: FontWeight.normal,
                  textColor: Constants.mainBlackColor,
                ),
              ],
            ),
            SizedBox(width: 30),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Constants.buttonBlueBorder),
              ),
              onPressed: () {},
              child: MyText(
                textContent: "$buttonText",
                textSize: Constants.fontSizeMidTitle,
                textWeight: Constants.buttonTextWeight,
                textColor: Constants.buttonBlueTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
