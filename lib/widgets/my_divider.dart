import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(indent: 70, endIndent: 0, height: 0, color: Constants.horizontalDividerColor);
  }
}