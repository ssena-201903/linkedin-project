import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String textContent;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? textHeight;

  const MyText({
    required this.textContent, 
    required this.textSize, 
    required this.textWeight, 
    required this.textColor,
    this.maxLines,
    this.textOverflow,
    this.textHeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      maxLines: maxLines,
      overflow: textOverflow, 
      style: TextStyle(
      color: textColor,
      fontSize: textSize,
      fontWeight: textWeight,
      height: textHeight
    ),);
  }
}