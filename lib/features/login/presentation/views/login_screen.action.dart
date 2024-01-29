part of 'login_screen.dart';

extension LoginScreenAction on _LoginScreenState {
  void blocListener(BuildContext context, LoginState state) {
    if (state is LoadingLoginState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
    if (state is SuccessfullyLoginState) {
      showOkAlertDialog(context: context, message: state.successfulMessage);
    }
  }

  void onLogin() {
    print('On login');
    // Navigator.pushNamed(context, HomeRoute.routeName);
    bloc.add(UserPasswordLoginEvent(username: 'nhanta', password: '123456'));
  }

  void onForgotPassword() {
    print('On forgot password');
  }

  void onFacebookSignin() {
    print('On Facebook login');
  }

  void onGoogleSignin() {
    print('On Google login');
  }
}
