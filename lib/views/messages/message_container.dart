import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/custom_outlined_button.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: Constants.butonsRowHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [Constants.buttonRowShadow],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.buttonBgGreen,
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      label: MyText(
                        textContent: "Odaklı",
                        textSize: 16,
                        textWeight: FontWeight.w600,
                        textColor: Colors.white,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 26,
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                    SizedBox(width: 10),
                    VerticalDivider(
                      width: 2,
                      color: Constants.verticalDividerColor,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(width: 10),
                    // outlined buttons
                    CustomOutlinedButton(textButton: "İş İlanları"),
                    SizedBox(width: 10),
                    CustomOutlinedButton(textButton: "Okunmayan"),
                    SizedBox(width: 10),
                    CustomOutlinedButton(textButton: "Taslaklar"),
                    SizedBox(width: 10),
                    CustomOutlinedButton(textButton: "InMail"),
                    // text button
                    TextButton(
                      onPressed: () {},
                      child: MyText(
                        textContent: "Tüm Filtreler",
                        textSize: 16,
                        textWeight: FontWeight.bold,
                        textColor: const Color.fromARGB(221, 51, 51, 51),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
