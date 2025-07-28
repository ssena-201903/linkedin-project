// experience and education section widget
import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/models/experience.dart';
import 'package:linkedin_clone/views/profile/experience_card.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class ExperienceSectionWidget extends StatelessWidget {
  const ExperienceSectionWidget({
    super.key,
    required this.myExperiences,
    required this.title,
  });

  final List<Experience> myExperiences;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // title
          Row(
            children: [
              MyText(
                textContent: title,
                textSize: Constants.textHeaderSize,
                textWeight: Constants.textHeaderWeight,
                textColor: Constants.textHeaderColor,
              ),
              Spacer(),
              // plus and edit icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // plus icon
                  Icon(Icons.add, size: 34, color: Constants.mainDarkGreyColor),
                  const SizedBox(width: 10),
                  // edit icon
                  SizedBox(
                    height: 26,
                    width: 26,
                    child: Image.asset("assets/icons/pencil.png"),
                  ),
                ],
              ),
            ],
          ),
          // experience cards
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: myExperiences.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ExperienceCard(experience: myExperiences[index]);
            },
          ),
        ],
      ),
    );
  }
}
