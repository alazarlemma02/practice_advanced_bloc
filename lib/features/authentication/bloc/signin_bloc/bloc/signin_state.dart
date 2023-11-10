part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {
  final String email;
  final String password;

  SigninInitial({this.email="", this.password=""});

  SigninInitial copyWith({String? email, String? password}) {
    return SigninInitial(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
