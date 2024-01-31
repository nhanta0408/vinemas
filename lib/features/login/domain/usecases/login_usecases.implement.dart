part of 'login_usecases.dart';

class LoginUsecasesImpl implements LoginUsecases {
  final LoginRepo _loginRepo = LoginRepoImpl();
  @override
  Future<UserCredential?> siginWithUserPassword(
      {required SignInModel signInModel}) {
    return _loginRepo.siginWithUserPassword(signInModel: signInModel);
  }

  @override
  Future<UserCredential?> signinWithFacebook() {
    return _loginRepo.signinWithFacebook();
  }

  @override
  Future<UserCredential?> signinWithGoogle() {
    return _loginRepo.signinWithGoogle();
  }
}
