part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginLodging extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}

class ResetPasswordSuccess extends LoginState {}

class ResetPasswordFailure extends LoginState {
  final String errMessage;
  ResetPasswordFailure({required this.errMessage});
}
