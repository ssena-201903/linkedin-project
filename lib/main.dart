import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/layout/main_shell.dart';
import 'package:linkedin_clone/post_detail_page.dart';
import 'package:linkedin_clone/views/login/login_page.dart';
import 'package:linkedin_clone/views/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.mainColor,
        // appbar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Constants.mainWhiteTone,
          iconTheme: IconThemeData(color: Constants.appbarIconColor),
        ),
        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: Constants.buttonElevation,
            backgroundColor: Constants.mainColor,
            shape: RoundedRectangleBorder(borderRadius: Constants.buttonRadius),
            padding: Constants.buttonPadding,
            foregroundColor: Constants.mainWhiteTone,
          ),
        ),
        // outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Constants.outlinedButtonForegroundColor,
            elevation: Constants.buttonElevation,
            shape: RoundedRectangleBorder(borderRadius: Constants.buttonRadius),
            padding: Constants.buttonPadding,
            side: BorderSide(color: Constants.outlinedButtonSideColor),
          ),
        ),
        // floating button theme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Constants.mainColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}
