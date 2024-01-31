part of 'login_screen.dart';

extension _LoginScreenAction on _LoginScreenState {
  void blocListener(BuildContext context, LoginState state) {
    if (state is LoadingLoginState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
    if (state is SuccessfullyLoginState) {
      showOkAlertDialog(
          context: context, title: 'Success', message: state.successfulMessage);
    }
    if (state is FailedLoginState) {
      showOkAlertDialog(
          context: context, title: 'Error', message: state.errorMessage);
    }
  }

  void onLogin() {
    print('On login');
    // Navigator.pushNamed(context, HomeRoute.routeName);
    bloc.add(UserPasswordLoginEvent(
        username: 'thnhan.sdh212@hcmut.edu.vn', password: '123456'));
  }

  void onForgotPassword() {
    print('On forgot password');
  }

  void onFacebookSignin() {
    print('On Facebook login');
    bloc.add(ThirdPartyLoginEvent(isGoogle: false));
  }

  void onGoogleSignin() {
    print('On Google login');
    bloc.add(ThirdPartyLoginEvent(isGoogle: true));
  }
}
