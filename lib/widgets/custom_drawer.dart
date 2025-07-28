import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/profile/profile_page.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Constants.mainWhiteTone,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:
                          MainAxisSize.min, // içeriğe göre yükseklik al
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/profile_picture_placeholder.png',
                          ),
                          radius: 30,
                        ),
                        SizedBox(height: 10),
                        // name row
                        Row(
                          children: [
                            // name
                            GestureDetector(
                              onTap: () {
                                // close the drawer and navigate to profile page
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(),
                                  ),
                                );
                              },
                              child: MyText(
                                textContent: "Safiye Sena Merdin",
                                textSize: Constants.fontSizeSubTitle,
                                textWeight: FontWeight.w700,
                                textColor: Constants.mainBlackColor,
                              ),
                            ),
                            SizedBox(width: 6),
                            // premium logo
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/premium_logo.png",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        MyText(
                          textContent:
                              "Mobile Developer | UI/UX Principles | Firebase",
                          textSize: Constants.fontSizeMiniTitle,
                          textWeight: FontWeight.w400,
                          textColor: Constants.mainBlackColor,
                          textOverflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 5),
                        MyText(
                          textContent: "İstanbul, Türkiye",
                          textSize: Constants.fontSizeMiniTitle,
                          textWeight: FontWeight.w400,
                          textColor: Constants.mainLightGrey,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/images/infogenix_labs.png",
                              ),
                            ),
                            SizedBox(width: 6),
                            Expanded(
                              child: MyText(
                                textContent: "Infogenix Labs",
                                textSize: Constants.fontSizeMiniTitle,
                                textWeight: FontWeight.w700,
                                textColor: Constants.mainBlackColor,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Constants.mainBlackColor, thickness: 0.1),

                  // views column
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // profile view count
                        RichText(
                          text: TextSpan(
                            text: "139",
                            style: TextStyle(
                              fontSize: Constants.fontSizeMiniTitle,
                              fontWeight: FontWeight.bold,
                              color: Constants.mainColor,
                            ),
                            children: [
                              TextSpan(
                                text: " profil görüntülemesi",
                                style: TextStyle(
                                  fontSize: Constants.fontSizeMiniTitle,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.mainDarkGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // post view count
                        RichText(
                          text: TextSpan(
                            text: "806",
                            style: TextStyle(
                              fontSize: Constants.fontSizeMiniTitle,
                              fontWeight: FontWeight.bold,
                              color: Constants.mainColor,
                            ),
                            children: [
                              TextSpan(
                                text: " gönderi gösterimi",
                                style: TextStyle(
                                  fontSize: Constants.fontSizeMiniTitle,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.mainDarkGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(color: Constants.mainBlackColor, thickness: 0.1),

                  // menu
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // oyunlar
                        MyText(
                          textContent: "Oyunlar",
                          textSize: 18,
                          textWeight: FontWeight.w800,
                          textColor: Constants.mainBlackColor,
                        ),
                        SizedBox(height: 20),
                        // Kaydedilen gönderiler
                        MyText(
                          textContent: "Kaydedilen gönderiler",
                          textSize: 18,
                          textWeight: FontWeight.w800,
                          textColor: Constants.mainBlackColor,
                        ),
                        SizedBox(height: 20),
                        // gruplar
                        MyText(
                          textContent: "Gruplar",
                          textSize: 18,
                          textWeight: FontWeight.w800,
                          textColor: Constants.mainBlackColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // bottom container, ayarlar
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Constants.horizontalDividerColor,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // settings icon
                        Icon(
                          Icons.settings,
                          color: Constants.mainDarkGreyColor,
                        ),
                        SizedBox(width: 10),
                        MyText(
                          textContent: "Ayarlar",
                          textSize: 16,
                          textWeight: FontWeight.w800,
                          textColor: Constants.mainBlackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
