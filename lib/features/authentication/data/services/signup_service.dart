import 'package:advanced_bloc/common/services/field_validator.dart';
import 'package:advanced_bloc/common/widgets/snackbar_toast_msg.dart';
import 'package:advanced_bloc/features/authentication/bloc/signup_bloc/bloc/signup_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupService {
  final BuildContext context;
  const SignupService({required this.context});

  Future<bool> handleSignup(String type) async {
    final String email = BlocProvider.of<SignupBloc>(context).state.email;
    final String password = BlocProvider.of<SignupBloc>(context).state.password;
    final String userName = BlocProvider.of<SignupBloc>(context).state.userName;
    final String phoneNumber =
        BlocProvider.of<SignupBloc>(context).state.phoneNumber;
    final snackbarMsg = SnackbarMsg(context: context);

    try {
      if (type == "email") {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (credential.user != null) {
            await credential.user!.sendEmailVerification();
            await credential.user!.updateDisplayName(userName);
            snackbarMsg.showSnackBar(
              "An email Verification has been sent to your email address. Please verify your email address to continue",
              Colors.green,
              Colors.white,
              6,
            );
            return true;
          }
        } on FirebaseAuthException catch (e) {
          var emailValidate = Validator.validateEmail(email: email);
          var passwordValidate = Validator.validatePassword(password: password);
          var userNameValidate = Validator.validateUsername(userName: userName);
          var phoneNumberValidate =
              Validator.validatePhoneNumber(phoneNumber: phoneNumber);
          if (email.isNotEmpty &&
              password.isNotEmpty &&
              userName.isNotEmpty &&
              phoneNumber.isNotEmpty &&
              emailValidate == null &&
              passwordValidate == null &&
              userNameValidate == null &&
              phoneNumberValidate == null) {
            snackbarMsg.showSnackBar(
              "Invalid Credentials Provided",
              Colors.red,
              Colors.white,
              6,
            );
            return false;
          }
        }
      }
    } catch (e) {
      snackbarMsg.showSnackBar(
        "Some error occurred!",
        Colors.red,
        Colors.white,
        6,
      );
      return false;
    }
    return false;
  }
}
