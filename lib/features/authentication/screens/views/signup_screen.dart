import 'package:advanced_bloc/common/concerns/constant_colors.dart';
import 'package:advanced_bloc/common/services/field_validator.dart';
import 'package:advanced_bloc/features/authentication/bloc/signin_bloc/bloc/signin_bloc.dart';
import 'package:advanced_bloc/features/authentication/bloc/signup_bloc/bloc/signup_bloc.dart';
import 'package:advanced_bloc/features/authentication/screens/widgets/signup_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  double get sH => MediaQuery.of(context).size.height;
  double get sW => MediaQuery.of(context).size.width;
  final _formkey = GlobalKey<FormState>();
  final String initialCountry = 'ET';
  PhoneNumber number = PhoneNumber(isoCode: 'ET');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: sH * 0.05, bottom: sH * 0.01),
        child: BlocBuilder<SigninBloc, SigninState>(
          builder: (context, state) {
            return Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: sH * 0.01),
                    child: const Center(
                      child: Text(
                        "Enter your details below to create an account",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: sW * 0.05, left: sW * 0.05),
                    // height: sH * 0.7,
                    width: sW,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Username:",
                          style: TextStyle(color: CommonColors.primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: sW * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: TextFormField(
                            // controller: _emailController,
                            validator: (value) =>
                                Validator.validateUsername(userName: value!),
                            onChanged: (value) {
                              BlocProvider.of<SignupBloc>(context)
                                  .add(SignUpUsernameEvent(userName: value));
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Enter your username',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text(
                          "Email:",
                          style: TextStyle(color: CommonColors.primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: sW * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: TextFormField(
                            // controller: _emailController,
                            validator: (value) =>
                                Validator.validateEmail(email: value!),
                            onChanged: (value) {
                              BlocProvider.of<SignupBloc>(context)
                                  .add(SignUpEmailEvent(email: value));
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Enter your email address',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text(
                          "Phone number:",
                          style: TextStyle(color: CommonColors.primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: sW * 0.02),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              BlocProvider.of<SignupBloc>(context).add(
                                  SignUpPhoneNumberEvent(
                                      phoneNumber: number.phoneNumber!));
                            },
                            initialValue: number,
                            validator: (value) => Validator.validatePhoneNumber(
                                phoneNumber: value!),
                          ),
                        ),
                        const Text(
                          "Password:",
                          style: TextStyle(color: CommonColors.primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: sW * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: TextFormField(
                            // controller: _passwordController,
                            validator: (value) =>
                                Validator.validatePassword(password: value!),
                            onChanged: (value) {
                              BlocProvider.of<SignupBloc>(context)
                                  .add(SignUpPasswordEvent(password: value));
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Enter your Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text(
                          "Confirm password:",
                          style: TextStyle(color: CommonColors.primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: sW * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: TextFormField(
                            // controller: _passwordController,
                            validator: (value) =>
                                Validator.validatePassword(password: value!),
                            onChanged: (value) {
                              BlocProvider.of<SignupBloc>(context).add(
                                  SignUpConfirmPasswordEvent(
                                      confirmPassword: value));
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Re-enter your Password',
                              border: InputBorder.none,
                            ),
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
                    height: sH * 0.25,
                    width: sW,
                    child: SignupAuthButtons(formkey: _formkey),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
