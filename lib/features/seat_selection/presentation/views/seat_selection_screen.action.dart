part of 'seat_selection_screen.dart';

extension _SeatSelectionScreenAction on _SeatSelectionScreenState {
  void blocListener(BuildContext context, SeatSelectionState state) {
    if (state.status == BlocStatusState.loading) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
      if (state.status == BlocStatusState.failed) {
        showOkAlertDialog(
          context: context,
          title: 'Error',
          message: state.errorMessage,
        );
      } else if (state.status == BlocStatusState.success) {
        if (state.ticket != null) {
          Navigator.pushNamed(
            context,
            TicketDetailRoute.routeName,
            arguments: TicketDetailScreenArg(
              ticket: state.ticket!,
            ),
          );
        }
      }
    }
  }
}
