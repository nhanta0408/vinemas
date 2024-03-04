import 'dart:typed_data';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/enums/gender.dart';
import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../core/utils/localizations.dart';
import '../../domain/entities/account_entity.dart';
import '../bloc/account_bloc.dart';
import '../bloc/account_event.dart';
import '../bloc/account_state.dart';
import 'widgets/account_avatar_name_widget.dart';
import 'widgets/account_information_widget.dart';
import 'widgets/account_payment_history_widget.dart';
import 'widgets/account_saved_card_widget.dart';
import 'widgets/account_settings_widget.dart';

part 'account_screen.action.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;

  OutlineInputBorder get normalBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: _colorScheme.primaryContainer,
        ),
      );

  AccountBloc get bloc => BlocProvider.of<AccountBloc>(context);
  @override
  void initState() {
    super.initState();
    bloc.add(
      AccountFirstGetEvent(
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      ),
    );
  }

  AccountEntity? _account;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return BlocConsumer<AccountBloc, AccountState>(
      listener: blocListener,
      buildWhen: (previous, current) {
        if (current.status == BlocStatusState.loading) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        _account = state.accountEntity ?? _account;
        return Scaffold(
          appBar: _buildAppbar(context),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    AccountAvatarNameWidget(
                      name: _account?.fullName,
                      avatarUrl: _account?.avatarUrl,
                      onChangeAvatar: (imageData) {
                        onChangedAvatar(imageData);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AccountInformationWidget(
                      currentAccount: _account,
                      onSaveChanged: (account) {
                        print(account.toString());
                        onSaveAccountData(account);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const AccountSettingsWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    const AccountSavedCardWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    AccountPaymentHistoryWidget(
                      tickets: state.tickets ?? [],
                      onDelete: (ticketId) async {
                        await deleteTicket(ticketId);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.chevron_left,
          color: _colorScheme.primaryContainer,
          size: 32,
        ),
      ),
      title: Text(
        'Profile',
        style: _textTheme.titleMedium,
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              Assets.svg.icLogout,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
