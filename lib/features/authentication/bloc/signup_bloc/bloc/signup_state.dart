part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  SignupInitial({
    this.userName="",
    this.email="",
    this.phoneNumber="",
    this.password="",
    this.confirmPassword="",
  });

  SignupInitial copyWith({
    String? userName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
  }) {
    return SignupInitial(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
