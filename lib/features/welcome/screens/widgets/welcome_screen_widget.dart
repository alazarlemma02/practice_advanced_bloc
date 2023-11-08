import 'package:advanced_bloc/demo.dart';
import 'package:advanced_bloc/features/authentication/screens/views/signin_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreenWidget extends StatelessWidget {
  const WelcomeScreenWidget(
      {super.key,
      required this.pageIndex,
      required this.title,
      required this.subtitle,
      required this.buttonTitle,
      required this.imageUrl,
      required this.context,
      required this.pageController});
  final int pageIndex;
  final String title;
  final String subtitle;
  final String buttonTitle;
  final String imageUrl;
  final BuildContext context;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          height: 400,
          width: double.infinity,
          child: Center(
            child: Image(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            shadowColor: Colors.black,
            // Adjust the elevation as needed
          ),
          onPressed: () {
            if (pageIndex < 2) {
              pageController.animateToPage(pageIndex + 1,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                  (route) => false);
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Center(
              child: Text(
                buttonTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
