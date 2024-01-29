// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginState {}

class InitialLoginState extends LoginState {
  InitialLoginState();
}

class LoadingLoginState extends LoginState {
  LoadingLoginState();
}

class SuccessfullyLoginState extends LoginState {
  final String? successfulMessage;
  SuccessfullyLoginState({
    this.successfulMessage,
  });
}

class FailedLoginState extends LoginState {
  final String? errorMessage;
  FailedLoginState({
    this.errorMessage,
  });
}
