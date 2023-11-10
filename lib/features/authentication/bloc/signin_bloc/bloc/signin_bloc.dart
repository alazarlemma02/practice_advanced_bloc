import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninInitial> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignInEmailEvent>(signInEmailEvent);
    on<SignInPasswordEvent>(signInPasswordEvent);
  }

  FutureOr<void> signInEmailEvent(
      SignInEmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> signInPasswordEvent(
      SignInPasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
