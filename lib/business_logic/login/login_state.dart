part of 'login_cubit.dart';

// @immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class OnNameChanged extends LoginState {}

class OnPhoneChanged extends LoginState {}