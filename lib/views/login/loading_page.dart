import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/layout/main_shell.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainShell()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.mainWhiteTone,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFF0077B5)),
            SizedBox(height: 20),
            MyText(
              textContent: "Oturum açılıyor...",
              textSize: 16,
              textWeight: FontWeight.w600,
              textColor: Color(0xFF0077B5),
            ),
          ],
        ),
      ),
    );
  }
}
