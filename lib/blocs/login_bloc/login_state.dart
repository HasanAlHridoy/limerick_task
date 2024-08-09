part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginScreenState extends LoginState {
  final bool isShowPassword;
  final bool isChecked;

  LoginScreenState(this.isShowPassword, this.isChecked);
}
