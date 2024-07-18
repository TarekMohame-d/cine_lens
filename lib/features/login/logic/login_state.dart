part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginGetRequestTokenLoading extends LoginState {}

final class LoginGetRequestTokenSuccess extends LoginState {}

final class LoginGetRequestTokenFailure extends LoginState {}

final class LoginCreateSessionLoading extends LoginState {}

final class LoginCreateSessionSuccess extends LoginState {}

final class LoginCreateSessionFailure extends LoginState {}

final class LoginGetUserDataLoading extends LoginState {}

final class LoginGetUserDataSuccess extends LoginState {}

final class LoginGetUserDataFailure extends LoginState {}
