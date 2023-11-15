part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignUpUsernameEvent extends SignupEvent {
  final String userName;

  SignUpUsernameEvent({required this.userName});
}

class SignUpEmailEvent extends SignupEvent {
  final String email;

  SignUpEmailEvent({required this.email});
}

class SignUpPhoneNumberEvent extends SignupEvent {
  final String phoneNumber;

  SignUpPhoneNumberEvent({required this.phoneNumber});
}

class SignUpPasswordEvent extends SignupEvent {
  final String password;

  SignUpPasswordEvent({required this.password});
}

class SignUpConfirmPasswordEvent extends SignupEvent {
  final String confirmPassword;

  SignUpConfirmPasswordEvent({required this.confirmPassword});
}
