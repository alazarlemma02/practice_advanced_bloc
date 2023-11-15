import 'package:advanced_bloc/demo.dart';
import 'package:advanced_bloc/features/authentication/data/services/signin_service.dart';
import 'package:advanced_bloc/features/authentication/data/services/signup_service.dart';
import 'package:advanced_bloc/features/authentication/screens/views/signin_screen.dart';
import 'package:advanced_bloc/features/authentication/screens/views/signup_screen.dart';
import 'package:flutter/material.dart';

class SignupAuthButtons extends StatelessWidget {
  const SignupAuthButtons({super.key, required this.formkey});
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.06),
            elevation: 4,
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () async {
            formkey.currentState!.validate();
            final response =
                await SignupService(context: context).handleSignup("email");
            if (response == true) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                  (route) => false);
            }
          },
          child: const Center(
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Divider(
                color: Colors.teal,
                thickness: 1,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Center(
                child: Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Divider(
                color: Colors.teal,
                thickness: 1,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.06),
            elevation: 4,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                (route) => false);
          },
          child: const Center(
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
