import 'package:firebase_auth/firebase_auth.dart';
import '../models/sign_in_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserCredential?> sigin(SignInModel siginModel);
  Future<UserCredential?> siginWithGoogle();
  Future<UserCredential?> signinWithFacebook();
  Future<void> signout();
}
