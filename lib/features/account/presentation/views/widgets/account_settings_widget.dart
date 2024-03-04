import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/bloc/app_bloc/app_bloc.dart';
import '../../../../../core/common/bloc/app_bloc/app_event.dart';
import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/utils/localizations.dart';

class AccountSettingsWidget extends StatefulWidget {
  const AccountSettingsWidget({super.key});

  @override
  State<AccountSettingsWidget> createState() => _AccountSettingsWidgetState();
}

class _AccountSettingsWidgetState extends State<AccountSettingsWidget> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;

  bool isSelectedVn = true;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(context).settings,
          style: _textTheme.titleMedium
              ?.copyWith(color: _colorScheme.primaryContainer),
        ),
        _buildLanguage(),
        _buildNotification(),
      ],
    );
  }

  Widget _buildLanguage() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).language,
            style: _textTheme.titleSmall,
          ),
          Row(
            children: [
              _buildLanguageItem(isVn: true, isSelected: isSelectedVn),
              const SizedBox(
                width: 8,
              ),
              _buildLanguageItem(isVn: false, isSelected: !isSelectedVn),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem({required bool isVn, required bool isSelected}) {
    final color =
        isSelected ? _colorScheme.onPrimary : _colorScheme.primaryContainer;
    return GestureDetector(
      onTap: () async {
        final res = await showAlertDialog(
          context: context,
          title: translate(context).inform,
          message: translate(context).areYouSureYouWantToChangeLanguage,
          barrierDismissible: false,
          actions: [
            AlertDialogAction(
              key: 'cancel',
              label: translate(context).cancel,
            ),
            AlertDialogAction(
              key: 'confirm',
              label: translate(context).confirm,
            ),
          ],
        );
        if (res == 'confirm') {
          // Trong file account_settings_widget.dart
          // ignore: use_build_context_synchronously
          BlocProvider.of<AppBloc>(context).add(
            ChangeLanguageAppEvent(
              locale: isVn ? const Locale('vi') : const Locale('en'),
            ),
          );
          setState(() {
            isSelectedVn = isVn;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: color,
          ),
        ),
        child: SvgPicture.asset(
          isVn ? Assets.svg.icVnFlag : Assets.svg.icEnFlag,
        ),
      ),
    );
  }

  Widget _buildNotification() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).receiveNotifications,
            style: _textTheme.titleSmall,
          ),
          Switch(
            value: false,
            onChanged: (_) {},
            inactiveThumbColor: _colorScheme.onBackground,
            trackOutlineColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.selected)
                  ? null
                  : _colorScheme.primaryContainer;
            }),
          ),
        ],
      ),
    );
  }
}
