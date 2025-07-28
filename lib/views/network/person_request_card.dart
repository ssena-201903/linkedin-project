import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/models/person.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class PersonRequestCard extends StatefulWidget {
  // sended just person object
  final Person person;
  // onClose callback function to close card
  final VoidCallback onClose;

  const PersonRequestCard({
    super.key,
    required this.person,
    required this.onClose,
  });

  @override
  State<PersonRequestCard> createState() => _PersonRequestCardState();
}

class _PersonRequestCardState extends State<PersonRequestCard> {
  bool isPressedConnect = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320, // constant height
      constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.black12, offset: Offset(2, 2)),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              // top section (image)
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        widget.person.backgroundProfilePicture == ""
                            ? "assets/images/profile_top_placeholder.png"
                            : widget.person.backgroundProfilePicture,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),

              // bottom section (details)
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 0,
                      right: 0,
                      bottom: 12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.person.personName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 6),
                            // if person has premium account show premium logo
                            widget.person.isPremium
                                ? SizedBox(
                                  height: 14,
                                  width: 14,
                                  child: Image.asset(
                                    "assets/icons/premium_logo.png",
                                  ),
                                )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.person.personTitle,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        SizedBox(height: 6),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.person.commonPerson != null) ...[
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage(
                                      widget
                                          .person
                                          .commonPerson!
                                          .profilePicture,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Flexible(
                                    child: MyText(
                                      textContent:
                                          "${widget.person.commonPerson!.personName}, ortak bağlantı",
                                      textSize: 11,
                                      textWeight: FontWeight.w500,
                                      textColor: Constants.mainDarkGreyColor,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ] else ...[
                                  MyText(
                                    textContent: "Profiliniz esas alınmıştır",
                                    textSize: 11,
                                    textWeight: FontWeight.w500,
                                    textColor: Constants.mainDarkGreyColor,
                                  ),
                                ],
                              ],
                            ),

                            SizedBox(height: 10),
                            // connect button
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 35,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color:
                                              isPressedConnect
                                                  ? Constants.mainLightGrey
                                                  : Constants.mainColor,
                                        ),
                                        foregroundColor:
                                            isPressedConnect
                                                ? Constants.mainDarkGreyColor
                                                : Constants.mainColor,
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isPressedConnect = !isPressedConnect;
                                        });
                                      },
                                      child: Text(
                                        isPressedConnect
                                            ? "Beklemede"
                                            : "Bağlantı Kur",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // circle avatar
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  widget.person.profilePicture == ""
                      ? "assets/images/profile_picture_placeholder.png"
                      : widget.person.profilePicture,
                ),
              ),
            ),
          ),

          // close icon
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: widget.onClose,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black54,
                ),
                child: Icon(Icons.close, size: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
