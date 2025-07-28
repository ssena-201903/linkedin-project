import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/models/experience.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({
    super.key, required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Constants.horizontalDividerColor))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // company logo
          SizedBox(height: 50, width: 50, child: Image.asset(experience.logoPicture),),
          const SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // person title
              MyText(textContent: experience.title, textSize: 16, textWeight: FontWeight.w600, textColor: Constants.mainBlackColor),
              // person company and type
              MyText(textContent: "${experience.companyName} · ${experience.location}", textSize: 14, textWeight: FontWeight.normal, textColor: Constants.mainBlackColor),
              // time
              MyText(textContent: "${experience.startDate} - ${experience.endDate} · ${experience.duration}", textSize: 14, textWeight: FontWeight.normal, textColor: Constants.mainLightGrey),
              // remote, ofis...
              MyText(textContent: experience.location, textSize: 14, textWeight: FontWeight.normal, textColor: Constants.mainLightGrey),
              const SizedBox(height: 20,),
              // gifts row
              experience.explanation.isNotEmpty 
              ? Row(
                children: [
                  // diamond icon
                  SizedBox(height: 20, width: 20, child: Image.asset("assets/icons/diamon_icon.png"),),
                  const SizedBox(width: 4,),
                  // gifts text
                  SizedBox(
                    width: 230,
                    child: MyText(textContent: experience.explanation, textSize: 14, textWeight: FontWeight.bold, textColor: Constants.mainBlackColor, textOverflow: TextOverflow.ellipsis,))
                ],
              ) 
              : OutlinedButton.icon(
                iconAlignment: IconAlignment.end,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Constants.mainDarkGreyColor)
                ),
                onPressed: (){}, 
                label: Text("Yeterlilik belgesini göster", style: TextStyle(
                  color: Constants.mainBlackColor,
                  fontWeight: Constants.buttonTextWeight,
                  fontSize: 16
                ),),
                icon: SizedBox(height: 20, width: 20, child: Image.asset("assets/icons/url_icon.png"),),
              ),
            ],
          )
        ],
      ),
    );
  }
}