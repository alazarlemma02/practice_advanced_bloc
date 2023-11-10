import 'package:advanced_bloc/common/services/field_validator.dart';
import 'package:advanced_bloc/common/widgets/snackbar_toast_msg.dart';
import 'package:advanced_bloc/features/authentication/bloc/signin_bloc/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninService {
  final BuildContext context;

  const SigninService({required this.context});

  Future<bool> handleSignin(String type) async {
    final snackbarMsg = SnackbarMsg(context: context);
    try {
      if (type == "email") {
        final state = BlocProvider.of<SigninBloc>(context).state;
        final emailAddress = state.email;
        final password = state.password;
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (!credential.user!.emailVerified) {
            snackbarMsg.showSnackBar(
              "Verify your email first",
              Colors.red,
              Colors.white,
              6,
            );
            return false;
          }
          var user = credential.user;
          if (user != null) {
            return true;
          }
        } on FirebaseAuthException catch (e) {
          var emailValidate = Validator.validateEmail(email: emailAddress);
          var passwordValidate = Validator.validatePassword(password: password);
          if (emailAddress.isNotEmpty &&
              password.isNotEmpty &&
              emailValidate == null &&
              passwordValidate == null) {
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
    }
    return false;
  }
}
