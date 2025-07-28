import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class MessageCard extends StatelessWidget {
  final bool isRead;
  final String senderName;
  final String profilePicture;
  final String messageContent;
  final String date;

  const MessageCard({
    super.key,
    required this.isRead,
    required this.senderName,
    required this.profilePicture,
    required this.messageContent,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isRead ? Colors.white : Constants.backGroundBlueTone,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 26,
              child: Image.asset(profilePicture),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    //  top: name and date
                    Row(
                      children: [
                        MyText(
                          textContent: senderName,
                          textSize: 18,
                          textWeight:
                              isRead ? FontWeight.w400 : FontWeight.w600,
                          textColor: Constants.mainBlackColor,
                        ),
                        Spacer(),
                        MyText(
                          textContent: date,
                          textSize: 14,
                          textWeight: FontWeight.w300,
                          textColor: Constants.mainDarkGreyColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    // bottom, content and count
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: MyText(
                            textContent: messageContent,
                            textSize: 14,
                            textWeight: FontWeight.w400,
                            textColor: Colors.black,
                            maxLines: 2,
                          ),
                        ),
                        Spacer(),
                        !isRead
                            ? Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Constants.mainColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: MyText(
                                  textContent: "2",
                                  textSize: 12,
                                  textWeight: FontWeight.w400,
                                  textColor: Colors.white,
                                ),
                              ),
                            )
                            : SizedBox.shrink(), // shows nothing
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
