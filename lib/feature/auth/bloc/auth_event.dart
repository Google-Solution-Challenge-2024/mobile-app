part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginAuthEvent extends AuthEvent {}

class AppStartedAuthEvent extends AuthEvent {}

class LogoutAuthEvent extends AuthEvent {}
