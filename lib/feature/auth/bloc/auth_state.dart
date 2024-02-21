part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthenticatedAuthState extends AuthState {}

final class UnauthenticatedAuthState extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class FailedAuthState extends AuthState {
  final String error;

  FailedAuthState({required this.error});
}
