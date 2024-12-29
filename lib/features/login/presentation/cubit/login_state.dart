part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginGetRequestTokenLoading extends LoginState {}

final class LoginGetRequestTokenSuccess extends LoginState {
  final RequestTokenModel? requestTokenModel;

  LoginGetRequestTokenSuccess(this.requestTokenModel);
}

final class LoginGetRequestTokenFailure extends LoginState {
  final ApiErrorModel? apiErrorModel;

  LoginGetRequestTokenFailure(this.apiErrorModel);
}

final class LoginCreateSessionLoading extends LoginState {}

final class LoginCreateSessionSuccess extends LoginState {}

final class LoginCreateSessionFailure extends LoginState {
  final ApiErrorModel? apiErrorModel;

  LoginCreateSessionFailure(this.apiErrorModel);
}

final class LoginGetUserIdLoading extends LoginState {}

final class LoginGetUserIdSuccess extends LoginState {}

final class LoginGetUserIdFailure extends LoginState {
  final ApiErrorModel? apiErrorModel;

  LoginGetUserIdFailure(this.apiErrorModel);
}
