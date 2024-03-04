part of 'login_screen.dart';

extension _LoginScreenAction on _LoginScreenState {
  void blocListener(BuildContext context, LoginState state) {
    if (state is LoadingLoginState) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
    if (state is SuccessfullyLoginState) {
      // showOkAlertDialog(
      //   context: context,
      //   title: 'Success',
      //   message: state.successfulMessage,
      // );
      Navigator.popAndPushNamed(context, HomeRoute.routeName);
    }
    if (state is FailedLoginState) {
      showOkAlertDialog(
        context: context,
        title: 'Error',
        message: state.errorMessage,
      );
    }
  }

  void onLogin() {
    if (kDebugMode) {
      print('On login');
    }
    bloc.add(
      UserPasswordLoginEvent(
        username: 'thnhan.sdh212@hcmut.edu.vn',
        password: '123456',
      ),
    );
  }

  void onForgotPassword() {
    if (kDebugMode) {
      print('On forgot password');
    }
  }

  void onFacebookSignin() {
    if (kDebugMode) {
      print('On Facebook login');
    }
    bloc.add(ThirdPartyLoginEvent(isGoogle: false));
  }

  void onGoogleSignin() {
    if (kDebugMode) {
      print('On Google login');
    }
    bloc.add(ThirdPartyLoginEvent(isGoogle: true));
  }
}
