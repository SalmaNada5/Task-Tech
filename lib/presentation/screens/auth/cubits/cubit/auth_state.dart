part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSuccessState extends AuthState {}
final class AuthFailState extends AuthState {}


