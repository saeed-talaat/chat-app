part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
final class AuthSuccess extends AuthState {
  
}
