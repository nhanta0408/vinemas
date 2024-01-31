part of 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final AuthRemoteDatasource _authRemoteDatasource = AuthRemoteDatasourceImpl();
  @override
  Future<UserCredential?> siginWithUserPassword(
      {required SignInModel signInModel}) {
    return _authRemoteDatasource.sigin(signInModel);
  }

  @override
  Future<UserCredential?> signinWithFacebook() {
    return _authRemoteDatasource.signinWithFacebook();
  }

  @override
  Future<UserCredential?> signinWithGoogle() {
    return _authRemoteDatasource.siginWithGoogle();
  }
}
