part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

class SignInEmailEvent extends SigninEvent {
  final String email;

  SignInEmailEvent({required this.email});
}

class SignInPasswordEvent extends SigninEvent {
  final String password;

  SignInPasswordEvent({required this.password});
}
