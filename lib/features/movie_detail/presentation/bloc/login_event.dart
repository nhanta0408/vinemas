// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginEvent {}

class UserPasswordLoginEvent extends LoginEvent {
  final String username;
  final String password;
  UserPasswordLoginEvent({
    required this.username,
    required this.password,
  });
}

class ThirdPartyLoginEvent extends LoginEvent {
  final bool isGoogle;
  ThirdPartyLoginEvent({
    required this.isGoogle,
  });
}

class ForgotPasswordLoginEvent extends LoginEvent {
  final String username;
  ForgotPasswordLoginEvent({
    required this.username,
  });
}
