import 'package:flutter/material.dart';

class Constants {
  // app main color
  static final Color mainColor = Color(0xff0966C3);
  static final Color mainWhiteTone = Colors.white;
  static final Color bgPageColor = Color(0xffE9E6DE);
  static final Color mainGreenColor = Color(0xff017550);
  static final Color mainLightGrey = Color.fromARGB(255, 131, 131, 131);
  static final Color mainDarkGreyColor = const Color.fromARGB(255, 104, 104, 104);
  static final Color mainBlackColor = Color(0xff181818);
  static final Color mainLigthGreenColor = Color(0xffD8E9CF);

  // fontsizes
  static final double fontSizeTitle = 20;
  static final double fontSizeSubTitle = 16;
  static final double fontSizeMidTitle = 14;
  static final double fontSizeMiniTitle = 12;

  // profile texts
  static final double textHeaderSize = 20;
  static final FontWeight textHeaderWeight = FontWeight.w900;
  static final textHeaderColor = mainBlackColor;

  // appbar
  static final appbarIconColor = mainDarkGreyColor;
  static final double sliverAppbarHeight = 50;
  static final double appbarSizedBox = 16;
  static final double appbarCircleAvatarRadius = 16;
  static final double appbarSearchHeight = 30;
  static final double appbarSearchIconSize = 10;
  static final double appbarIconSize = 24;

  // tabbar
  static final FontWeight tabbarLabelWeight = FontWeight.w600;
  static final tabbarUnselectedLabelColor = mainDarkGreyColor;
  static final tabbarSelectedLabelColor = mainGreenColor;
  static final double tabbarFontsize = 16;

  // background tones
  static final backGroundBlueTone = Color(0xffE9F3FF);

  // button
  static final EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: 4,
    horizontal: 12,
  );
  static final double buttonElevation = 0;
  static final FontWeight buttonTextWeight = FontWeight.w600;
  static final double buttonTextSize = fontSizeMidTitle;
  static final BorderRadiusGeometry buttonRadius = BorderRadius.circular(20);
  static final buttonGreyBorder = Colors.black38;
  static final buttonBlueBorder = mainColor;
  static final buttonBlueTextColor = mainColor;
  static final buttonGreyTextColor = const Color.fromARGB(193, 0, 0, 0);
  static final buttonGreyTextWeight = FontWeight.w900;

  // outlined button
  static final outlinedButtonForegroundColor = const Color.fromARGB(
    193,
    0,
    0,
    0,
  );
  static final outlinedButtonSideColor = Colors.black38;

  // elevated button
  static final buttonBgGreen = mainGreenColor;
  static final buttonBgBlue = mainColor;
  static final buttonTextColor = Colors.white;

  // verticalDivider
  static final verticalDividerColor = Colors.black12;

  // horizontal dividers
  static final horizontalDividerColor = const Color.fromARGB(15, 0, 0, 0);

  //padding
  static final EdgeInsets paddingCard = EdgeInsets.all(10);
  static final EdgeInsets paddingBigCard = EdgeInsets.all(20);

  // buton row style
  static final double butonsRowHeight = 50;
  static final BoxShadow buttonRowShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(2, 2),
    blurRadius: 12,
  );
  static final buttonsRowSpacer = 10;

}
