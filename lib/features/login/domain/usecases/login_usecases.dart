import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinemas_app/features/login/data/models/sign_in_model.dart';
import 'package:vinemas_app/features/login/domain/repo/login_repo.dart';

part 'login_usecases.implement.dart';

abstract class LoginUsecases {
  Future<UserCredential?> siginWithUserPassword(
      {required SignInModel signInModel});
  Future<UserCredential?> signinWithGoogle();
  Future<UserCredential?> signinWithFacebook();
}
