part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}
final class AuthInitial extends AuthState {}

final class LoginObsecureOn extends AuthState {}
final class LoginObsecureOff extends AuthState {}

final class RememberMeOn extends AuthState {}
final class RememberMeOff extends AuthState {}

final class SignUpPassVisible extends AuthState {}
final class SignUpPassInVisible extends AuthState {}

final class SignUpConfirmPassVisible extends AuthState {}
final class SignUpConfirmPassInVisible extends AuthState {}

final class LoginSuccess extends AuthState{}
final class OnboardingPageChanged extends AuthState{}

