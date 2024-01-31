import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinemas_app/features/login/data/datasource/auth_remote_datasource.dart';
import 'package:vinemas_app/features/login/data/datasource/auth_remote_datasource.impl.dart';

import '../../data/models/sign_in_model.dart';

part 'login_repo.implement.dart';

abstract class LoginRepo {
  Future<UserCredential?> siginWithUserPassword(
      {required SignInModel signInModel});
  Future<UserCredential?> signinWithGoogle();
  Future<UserCredential?> signinWithFacebook();
}
