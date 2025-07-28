import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/login/login_page.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // current step in the registration process
  // 0: email, 1: password, 2: name and surname
  int currentStep = 0;
  // is remember me checked
  bool isRememberMeChecked = true;

  // controllers for text fields
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController surnameController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

  void nextStep() {
    setState(() {
      currentStep++;
    });
  }

  // Function to navigate to login page with email and password
  void goToLoginPage() {
  if (emailController.text.isEmpty || passwordController.text.isEmpty) return;

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginPage(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    ),
  );
}


  double getProgressValue() {
    switch (currentStep) {
      case 0:
        return 0.3;
      case 1:
        return 0.6;
      case 2:
        return 0.9;
      default:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.mainWhiteTone,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Image.asset("assets/images/linkedin_logo_brand.png"),
            ),
            // progress indicator
            Column(
              children: [
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: getProgressValue(),
                  backgroundColor: Constants.horizontalDividerColor,
                  color: Constants.mainGreenColor,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const MyText(
                      textContent: "Hesap Oluşturun",
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      textColor: Colors.black54,
                    ),
                    Spacer(),
                    MyText(
                      textContent: "${currentStep + 1}/3",
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      textColor: Colors.black54,
                    ),
                  ],
                ),
              ],
            ),

            // LinearProgressIndicator(value: getProgressValue()),
            const SizedBox(height: 20),
            // title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  textContent: "LinkedIn'e Katılın",
                  textSize: 24,
                  textWeight: FontWeight.bold,
                  textColor: Constants.mainBlackColor,
                ),
                Row(
                  children: [
                    MyText(
                      textContent: "veya",
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      textColor: Constants.mainLightGrey,
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: MyText(
                        textContent: "Oturum Açın",
                        textSize: 14,
                        textWeight: FontWeight.w900,
                        textColor: Constants.mainColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // step form content
            if (currentStep == 0) ...[
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "E-posta veya Telefon*",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 60),
              RichText(
                text: TextSpan(
                  text:
                      "Kabul Et ve Katıl veya Devam Et seçeneklerinden birini tıklayarak, Linkedin",
                  style: TextStyle(color: Constants.mainLightGrey),
                  children: [
                    TextSpan(
                      text:
                          " Kullanıcı Anlaşmasını, Gizlilik Politikasını ve Çerez Politikalarını",
                      style: TextStyle(
                        color: Constants.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                          " kabul etmiş olursunuz. Telefon numarası ile yapılan kayıtlar için, SMS ile doğrulama kodu gönderiyoruz",
                      style: TextStyle(
                        color: Constants.mainLightGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                      onPressed:
                          emailController.text.trim().isNotEmpty
                              ? nextStep
                              : null,
                      child: const Text("Kabul et ve Katıl"),
                    ),
                  ),
                ],
              ),
            ] else if (currentStep == 1) ...[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "E-posta veya Telefon*",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Şifre"),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text:
                      "Kabul Et ve Katıl veya Devam Et seçeneklerinden birini tıklayarak, Linkedin",
                  style: TextStyle(color: Constants.mainLightGrey),
                  children: [
                    TextSpan(
                      text:
                          " Kullanıcı Anlaşmasını, Gizlilik Politikasını ve Çerez Politikalarını",
                      style: TextStyle(
                        color: Constants.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                          " kabul etmiş olursunuz. Telefon numarası ile yapılan kayıtlar için, SMS ile doğrulama kodu gönderiyoruz",
                      style: TextStyle(
                        color: Constants.mainLightGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                      onPressed:
                          passwordController.text.trim().length >= 6
                              ? nextStep
                              : null,
                      child: const Text("Kabul et ve Katıl"),
                    ),
                  ),
                ],
              ),
            ] else if (currentStep == 2) ...[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Ad"),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: surnameController,
                decoration: const InputDecoration(labelText: "Soyad"),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    activeColor: Constants.mainGreenColor,
                    value: isRememberMeChecked,
                    onChanged: (value) {
                      setState(() {
                        isRememberMeChecked = value!;
                      });
                    },
                  ),
                  MyText(
                    textContent: "Beni hatırla",
                    textSize: 16,
                    textWeight: FontWeight.w400,
                    textColor: Constants.mainDarkGreyColor,
                  ),
                  const SizedBox(width: 10),
                  MyText(
                    textContent: "Daha fazla bilgi",
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    textColor: Constants.mainColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                      onPressed:
                          emailController.text.trim().isNotEmpty
                              ? goToLoginPage
                              : null,
                      child: const Text("Devam Et"),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
