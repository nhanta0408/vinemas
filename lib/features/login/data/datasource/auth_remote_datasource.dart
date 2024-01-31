import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinemas_app/features/login/data/models/sign_in_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserCredential?> sigin(SignInModel siginModel);
  Future<UserCredential?> siginWithGoogle();
  Future<UserCredential?> signinWithFacebook();
}
