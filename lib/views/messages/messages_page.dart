import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/messages/message_card.dart';
import 'package:linkedin_clone/views/messages/message_container.dart';
import 'package:linkedin_clone/widgets/my_divider.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // created circle avatar inside sliver appbar
            // created "mesajlarda ara" textfield
            Expanded(
              // put the textfield inside a container because of giving height.
              child: Container(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      height: 12,
                      width: 12,
                      child: Icon(Icons.search),
                    ),
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: Color(0xffEEF3F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Mesajlarda ara",
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            // message icon to go message page
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black54,
                  builder: (context) {
                    return Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  // Görüşmeleri yönet
                                  Row(
                                    children: [
                                      Icon(Icons.fact_check, color: Constants.mainDarkGreyColor,),
                                      const SizedBox(width: 16),
                                      MyText(textContent: "Görüşmeleri yönet", textSize: 16, textWeight: FontWeight.w500, textColor: Constants.mainDarkGreyColor),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // uzakta mesajı ayarla
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month, color: Constants.mainDarkGreyColor,),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(textContent: "Uzakta mesajı ayarla", textSize: 16, textWeight: FontWeight.w500, textColor: Constants.mainDarkGreyColor),
                                          MyText(textContent: "Premium ile aç", textSize: 12, textWeight: FontWeight.w400, textColor: Constants.mainLightGrey),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // Ayarları yönet
                                  Row(
                                    children: [
                                      Icon(Icons.settings, color: Constants.mainDarkGreyColor,),
                                      const SizedBox(width: 16),
                                      MyText(textContent: "Ayarları yönet", textSize: 16, textWeight: FontWeight.w500, textColor: Constants.mainDarkGreyColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },

              child: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MessageContainer(),
            // message row
            MessageCard(
              isRead: true,
              profilePicture: "assets/images/pp_woman1.png",
              messageContent:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              date: "Pzr",
              senderName: "Ayşe Kaya",
            ),
            MyDivider(),
            MessageCard(
              isRead: true,
              profilePicture: "assets/images/pp_man1.png",
              messageContent:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              date: "24 Haz 2025",
              senderName: "Selim Güven",
            ),
            MyDivider(),
            MessageCard(
              isRead: false,
              profilePicture: "assets/images/pp_woman2.png",
              messageContent:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              date: "20 May 2025",
              senderName: "Nazlı Kuyu",
            ),
            MyDivider(),
            MessageCard(
              isRead: true,
              profilePicture: "assets/images/pp_woman3.png",
              messageContent:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              date: "20 May 2025",
              senderName: "Leyla Koşar",
            ),
            MyDivider(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
