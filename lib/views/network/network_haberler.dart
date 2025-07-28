import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/network/job_congrat_card.dart';
import 'package:linkedin_clone/widgets/my_divider.dart';
import 'package:linkedin_clone/widgets/my_outlined_button.dart';
import 'package:linkedin_clone/widgets/my_text.dart';
import 'package:linkedin_clone/views/network/games_section.dart';

class NetworkHaberler extends StatefulWidget {
  const NetworkHaberler({super.key});

  @override
  State<NetworkHaberler> createState() => _NetworkHaberlerState();
}

class _NetworkHaberlerState extends State<NetworkHaberler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgPageColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // top buttons gelecek
          _buildTopButtonsRow(),
          SizedBox(height: 8),
          //tebrik kartları gelecek
          JobCongratCard(
            isWorkCongrats: true,
            profileImage: "assets/images/person_woman1.jpg",
            name: "Selda Bilici",
            year: "1 yıl",
            likedCount: 45,
            commentCount: 76,
            date: "",
          ),
          MyDivider(),
          JobCongratCard(
            isWorkCongrats: false,
            profileImage: "assets/images/person_man4.jpg",
            name: "Ömer Korkusuz",
            year: "",
            likedCount: 0,
            commentCount: 0,
            date: "12 Temmuz",
          ),
          // games section gelecek
          GamesSection(),
          MyDivider(),
          JobCongratCard(
            isWorkCongrats: true,
            profileImage: "assets/images/person_woman3.jpg",
            name: "Nehir Yıldız",
            year: "4 yıl",
            likedCount: 27,
            commentCount: 76,
            date: "",
          ),
          MyDivider(),
          JobCongratCard(
            isWorkCongrats: false,
            profileImage: "assets/images/person_man3.jpg",
            name: "Kaan Yılmaz",
            year: "",
            likedCount: 0,
            commentCount: 0,
            date: "17 Temmuz",
          ),
          MyDivider(),
          JobCongratCard(
            isWorkCongrats: true,
            profileImage: "assets/images/person_woman2.jpg",
            name: "Tülay Yıldırım",
            year: "5 yıl",
            likedCount: 90,
            commentCount: 38,
            date: "",
          ),
          MyDivider(),
          JobCongratCard(
            isWorkCongrats: true,
            profileImage: "assets/images/person_man1.jpg",
            name: "Osman Demir",
            year: "2 yıl",
            likedCount: 12,
            commentCount: 56,
            date: "",
          ),
          // tebrik kartları devam
        ],
      ),
    );
  }

  Container _buildTopButtonsRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [Constants.buttonRowShadow],
      ),
      height: Constants.butonsRowHeight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.mainGreenColor,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              onPressed: () {},
              child: MyText(
                textContent: "Tümü",
                textSize: Constants.buttonTextSize,
                textWeight: Constants.buttonTextWeight,
                textColor: Constants.buttonTextColor,
              ),
            ),
            SizedBox(width: 10),
            MyOutlinedButton(textButton: "İş değişiklikleri"),
            SizedBox(width: 10),
            MyOutlinedButton(textButton: "Doğum günleri"),
            SizedBox(width: 10),
            MyOutlinedButton(textButton: "İş yıldönümleri"),
            SizedBox(width: 10),
            MyOutlinedButton(textButton: "Eğitim"),
          ],
        ),
      ),
    );
  }
}
