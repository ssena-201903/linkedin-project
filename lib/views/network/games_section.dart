import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';
import 'package:linkedin_clone/views/network/game_card.dart';

class GamesSection extends StatelessWidget {
  const GamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.paddingCard,
      decoration: BoxDecoration(
        color: Constants.mainWhiteTone,
        border: Border(
          bottom: BorderSide(
            color: Constants.horizontalDividerColor,
            width: 0.5,
          ),
          top: BorderSide(color: Constants.horizontalDividerColor, width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // games title
          _buildTitleText("Günlük oyunlar aracılığıyla iletişimde kalın"),
          SizedBox(height: 10),
          // games horizontal listview
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // games single container
                GameCard(
                  imagePath: "assets/icons/queens_logo.png",
                  name: "Queens",
                  dayCount: "438",
                  date: "2 Tem, Çarşamba",
                  buttonText: "Çöz",
                ),
                SizedBox(width: 10),
                // games single container
                GameCard(
                  imagePath: "assets/icons/tango_logo.png",
                  name: "Tango",
                  dayCount: "278",
                  date: "2 Tem, Çarşamba",
                  buttonText: "Çöz",
                ),
                SizedBox(width: 10),
                // games single container
                GameCard(
                  imagePath: "assets/icons/zip_logo.png",
                  name: "Zip",
                  dayCount: "117",
                  date: "2 Tem, Çarşamba",
                  buttonText: "Çöz",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MyText _buildTitleText(String textTitle) {
    return MyText(
      textContent: textTitle,
      textSize: Constants.fontSizeMidTitle,
      textWeight: FontWeight.w400,
      textColor: Constants.mainBlackColor,
    );
  }
}
