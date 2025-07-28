import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class JobCongratCard extends StatelessWidget {
  final bool isWorkCongrats;
  final String profileImage;
  final String name;
  final String year;
  final int likedCount;
  final int commentCount;
  final String date;

  const JobCongratCard({
    super.key,
    required this.isWorkCongrats,
    required this.profileImage,
    required this.name,
    required this.year,
    required this.likedCount,
    required this.commentCount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.mainWhiteTone,
      padding: Constants.paddingBigCard,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // profile picture circle avatar
          CircleAvatar(radius: 30, backgroundImage: AssetImage(profileImage)),
          SizedBox(width: 10),

          // info column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name and more_vert row
                Row(
                  children: [
                    MyText(
                      textContent: name,
                      textSize: Constants.fontSizeMidTitle,
                      textWeight: FontWeight.w600,
                      textColor: Constants.mainBlackColor,
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_vert,
                      color: Constants.mainLightGrey,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 4),

                // RichText veya Text
                isWorkCongrats
                    ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Linkedin Türkiye",
                            style: TextStyle(
                              fontSize: Constants.fontSizeMidTitle,
                              fontWeight: FontWeight.w600,
                              color: Constants.mainBlackColor,
                            ),
                          ),
                          TextSpan(
                            text: " şirketinde $year yılı tamamladı",
                            style: TextStyle(
                              fontSize: Constants.fontSizeMidTitle,
                              fontWeight: FontWeight.w400,
                              color: Constants.mainBlackColor,
                            ),
                          ),
                        ],
                      ),
                    )
                    : MyText(
                      textContent:
                          "$date tarihinde $name adlı kullanıcının doğum gününü kutlayın",
                      textSize: Constants.fontSizeMidTitle,
                      textWeight: FontWeight.w400,
                      textColor: Constants.mainBlackColor,
                    ),

                SizedBox(height: 10),

                // bottom row
                Row(
                  children: [
                    // Buton
                    Flexible(
                      flex: 1,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset(
                            "assets/icons/send_light_color.png",
                          ),
                        ),
                        label: MyText(
                          textContent:
                              isWorkCongrats
                                  ? "Tebrikler $name"
                                  : "Geçmiş doğum günün kutlu olsun $name",
                          textSize: Constants.buttonTextSize,
                          textWeight: Constants.buttonTextWeight,
                          textColor: Constants.mainLightGrey,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // if card is work congratulations
                    if (isWorkCongrats) ...[
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            // like row
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/icons/like.png"),
                                ),
                                SizedBox(width: 4),
                                MyText(
                                  textContent: "$likedCount",
                                  textSize: Constants.fontSizeMidTitle,
                                  textWeight: FontWeight.w400,
                                  textColor: Constants.mainDarkGreyColor,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            // comment row
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/icons/comment.png",
                                  ),
                                ),
                                SizedBox(width: 4),
                                MyText(
                                  textContent: "$commentCount",
                                  textSize: Constants.fontSizeMidTitle,
                                  textWeight: FontWeight.w400,
                                  textColor: Constants.mainDarkGreyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
