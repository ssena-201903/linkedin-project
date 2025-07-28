import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String iconPath;
  const SocialButton({super.key, required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: OutlinedButton.icon(
              onPressed: () {},
              label: Text(
                text,
                style: TextStyle(
                  color: Constants.mainDarkGreyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset(iconPath),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
