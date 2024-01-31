import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vinemas_app/features/login/data/datasource/auth_remote_datasource.dart';
import 'package:vinemas_app/features/login/data/models/sign_in_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<UserCredential?> sigin(SignInModel siginModel) async {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: siginModel.username, password: siginModel.password);
    return result;
  }

  @override
  Future<UserCredential?> siginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final result = FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  @override
  Future<UserCredential?> signinWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}
