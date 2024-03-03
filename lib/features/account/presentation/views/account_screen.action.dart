part of 'account_screen.dart';

extension _AccountScreenAction on _AccountScreenState {
  void blocListener(BuildContext context, AccountState state) {
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
      }
    }
  }

  Future<void> deleteTicket(String ticketId) async {
    final res = await showAlertDialog(
      context: context,
      title: translate(context).inform,
      message: translate(context).areYouSureYouWantToDeleteThisTicket,
      barrierDismissible: false,
      actions: [
        AlertDialogAction(
          key: 'confirm',
          label: translate(context).confirm,
          isDestructiveAction: true,
        ),
        AlertDialogAction(
          key: 'cancel',
          label: translate(context).cancel,
          isDefaultAction: true,
        ),
      ],
    );
    if (res == 'confirm') {
      bloc.add(AccountDeleteTicketEvent(ticketId: ticketId));
    }

    // final res = showConfirmationDialog(
    //   context: context,
    //   title: translate(context).inform,
    //   message: translate(context).areYouSureYouWantToDeleteThisTicket,
    // );
  }
}
