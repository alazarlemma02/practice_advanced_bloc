import 'package:advanced_bloc/features/authentication/screens/widgets/auth_buttons.dart';
import 'package:advanced_bloc/features/authentication/screens/widgets/social_media_buttons.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double get sH => MediaQuery.of(context).size.height;
  double get sW => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: sH * 0.05, bottom: sH * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: sH * 0.03,
              ),
              height: sH * 0.07,
              child: const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: sW * 0.2,
                left: sW * 0.2,
                bottom: sH * 0.03,
              ),
              height: 100,
              width: sH,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialMediaButtons(
                        logoPath: "assets/images/google_logo.png",
                        onPressed: () {
                          print("google clicked!");
                        },
                      ),
                      SocialMediaButtons(
                          logoPath: "assets/images/apple_logo.png",
                          onPressed: () {
                            print("apple clicked!");
                          }),
                      SocialMediaButtons(
                          logoPath: "assets/images/facebook_logo.png",
                          onPressed: () {
                            print("facebook clicked!");
                          }),
                    ],
                  ),
                  SizedBox(
                    width: sH * 0.3,
                    child: const Text("Or use your email account to login"),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: sW * 0.05, left: sW * 0.05),
              height: sH * 0.3,
              width: sW,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Email"),
                  Container(
                    padding: EdgeInsets.only(left: sW * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter your email address',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Text("Password"),
                  Container(
                    padding: EdgeInsets.only(left: sW * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter your Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("forgot password clicked!");
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: sH * 0.03,
              ),
              padding: EdgeInsets.only(right: sW * 0.05, left: sW * 0.05),
              // color: Colors.red[600],
              height: sH * 0.25,
              width: sW,
              child: const AuthButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
