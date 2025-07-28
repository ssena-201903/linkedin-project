import 'package:flutter/material.dart';
import 'package:linkedin_clone/widgets/custom_outlined_button.dart';

class JobsTopContainer extends StatelessWidget {
  const JobsTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height: 40,
              child: CustomOutlinedButton(textButton: "Tercihler"),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 40,
              child: CustomOutlinedButton(textButton: "İş İlanlarım"),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 40,
              child: CustomOutlinedButton(textButton: "Ücretsiz iş ilanı ver"),
            ),
          ],
        ),
      ),
    );
  }
}
