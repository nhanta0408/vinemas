part of 'home_screen.dart';

extension _HomeScreenAction on _HomeScreenState {
  void blocListener(BuildContext context, HomeState state) {
    if (state.status == BlocStatusState.loading) {
      EasyLoading.show();
    } else if (state.status == BlocStatusState.failed) {
      EasyLoading.dismiss();
      showOkAlertDialog(
        context: context,
        title: 'Error',
        message: 'Replace error message',
      );
    }
  }
}
