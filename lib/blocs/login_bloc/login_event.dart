part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginIsEyeButtonClickEvent extends LoginEvent {}

class LoginIsPrivacyButtonCheckEvent extends LoginEvent {}

class LoginSignInButtonEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSignInButtonEvent(this.email, this.password);
}
