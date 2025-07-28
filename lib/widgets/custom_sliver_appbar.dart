import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/messages/messages_page.dart';

class CustomSliverAppBar extends StatelessWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onMessageTap;

  const CustomSliverAppBar({super.key, this.onProfileTap, this.onMessageTap});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Constants.mainWhiteTone,
      toolbarHeight: Constants.sliverAppbarHeight,
      automaticallyImplyLeading:
          false, // avoid creating menu button automatically
      title: Row(
        children: [
          // Profile CircleAvatar with GestureDetector
          Builder(
            builder:
                (innerContext) => GestureDetector(
                  onTap:
                      onProfileTap ??
                      () {
                        Scaffold.maybeOf(
                          innerContext,
                        )?.openDrawer(); // burada innerContext kullanıyoruz
                      },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/profile_picture_placeholder.png',
                    ),
                    radius: Constants.appbarCircleAvatarRadius,
                  ),
                ),
          ),
          SizedBox(width: Constants.appbarSizedBox),
          // Search TextField
          Expanded(
            child: Container(
              height: Constants.appbarSearchHeight,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                    height: Constants.appbarSearchIconSize,
                    width: Constants.appbarSearchIconSize,
                    child: Icon(Icons.search),
                  ),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Color(0xffEEF3F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Arama Yap",
                ),
              ),
            ),
          ),
          SizedBox(width: Constants.appbarSizedBox),
          // Message Icon
          GestureDetector(
            onTap:
                onMessageTap ??
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MessagesPage()),
                  );
                },
            child: SizedBox(
              height: Constants.appbarIconSize,
              width: Constants.appbarIconSize,
              child: Image.asset("assets/icons/message.png"),
            ),
          ),
        ],
      ),
    );
  }
}
