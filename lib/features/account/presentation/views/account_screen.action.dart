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
          title: translate(context).error,
          message: state.errorMessage,
        );
      } else if (state.status == BlocStatusState.success) {
        if (state.toastMessage == AccountStateStringCode.logoutSuccessfully) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginRoute.routeName,
            (Route<dynamic> route) => false,
          );
          return;
        }
        state.toastMessage?.show(context);
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

  void onSaveAccountData(AccountEntity account) {
    bloc.add(AccountSaveEvent(account: account));
  }

  void onChangedAvatar(Uint8List avatarData) {
    final email = FirebaseAuth.instance.currentUser?.email;
    if (email == null) {
      showOkAlertDialog(
        context: context,
        message: translate(context).emailNotFound,
      );
      return;
    }
    bloc.add(AccountChangeAvatarEvent(avatarData: avatarData, email: email));
  }

  Future<void> signout() async {
    final res = await showAlertDialog(
      context: context,
      title: translate(context).inform,
      message: translate(context).areYouSureYouWantToSignOut,
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
      bloc.add(AccountSignoutEvent());
    }
  }
}
