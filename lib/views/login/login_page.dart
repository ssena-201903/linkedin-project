import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/login/loading_page.dart';
import 'package:linkedin_clone/views/login/social_button.dart';
import 'package:linkedin_clone/views/register/register_page.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class LoginPage extends StatefulWidget {
  final String? email;
  final String? password;
  const LoginPage({super.key, this.email, this.password});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMeChecked = true;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      textContent: "Oturum aç",
                      textSize: 30,
                      textWeight: FontWeight.bold,
                      textColor: Constants.mainBlackColor,
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "veya ",
                        style: TextStyle(color: Constants.mainLightGrey),
                        children: [
                          TextSpan(
                            text: "Linkedin'e Katılın",
                            style: TextStyle(
                              color: Constants.mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SocialButton(
                      text: "Google ile oturum açın",
                      iconPath: "assets/images/google_logo.png",
                    ),
                    SizedBox(height: 10),
                    SocialButton(
                      text: "Apple ile oturum açın",
                      iconPath: "assets/images/apple_logo.png",
                    ),
                    SizedBox(height: 10),
                    SocialButton(
                      text: "Facebook ile oturum açın",
                      iconPath: "assets/images/facebook_logo.png",
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Constants.horizontalDividerColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text("veya"),
                        ),
                        Expanded(
                          child: Divider(color: Constants.horizontalDividerColor),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Eposta veya Telefon",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Eposta ya da telefon boş olamaz';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Şifre",
                              suffixIcon: Icon(Icons.visibility),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Şifre boş olamaz';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
              
                              TextButton(
                                onPressed: () {},
                                child: MyText(
                                  textContent: "Şifrenizi mi unuttunuz?",
                                  textSize: 16,
                                  textWeight: FontWeight.w400,
                                  textColor: Constants.mainColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const LoadingPage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Devam Et",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
