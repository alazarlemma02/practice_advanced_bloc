import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupInitial> {
  SignupBloc() : super(SignupInitial()) {
    on<SignUpUsernameEvent>(usernameEvent);
    on<SignUpEmailEvent>(emailEvent);
    on<SignUpPhoneNumberEvent>(phoneNumberEvent);
    on<SignUpPasswordEvent>(passwordEvent);
    on<SignUpConfirmPasswordEvent>(confirmPasswordEvent);
  }

  FutureOr<void> usernameEvent(
      SignUpUsernameEvent event, Emitter<SignupInitial> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  FutureOr<void> emailEvent(
      SignUpEmailEvent event, Emitter<SignupInitial> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> phoneNumberEvent(
      SignUpPhoneNumberEvent event, Emitter<SignupInitial> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  FutureOr<void> passwordEvent(
      SignUpPasswordEvent event, Emitter<SignupInitial> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> confirmPasswordEvent(
      SignUpConfirmPasswordEvent event, Emitter<SignupInitial> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
