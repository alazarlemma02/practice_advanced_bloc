part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeState {}

final class WelcomeInitial extends WelcomeState {
  int pageIndex;

  WelcomeInitial({this.pageIndex = 0});
}

