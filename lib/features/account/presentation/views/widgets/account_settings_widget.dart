import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/constants/assets.dart';

class AccountSettingsWidget extends StatefulWidget {
  const AccountSettingsWidget({super.key});

  @override
  State<AccountSettingsWidget> createState() => _AccountSettingsWidgetState();
}

class _AccountSettingsWidgetState extends State<AccountSettingsWidget> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
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
            'Language',
            style: _textTheme.titleSmall,
          ),
          Row(
            children: [
              _buildLanguageItem(isVn: true, isSelected: false),
              const SizedBox(
                width: 8,
              ),
              _buildLanguageItem(isVn: false, isSelected: true),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildLanguageItem({required bool isVn, required bool isSelected}) {
    final color =
        isSelected ? _colorScheme.onPrimary : _colorScheme.primaryContainer;
    return Container(
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
    );
  }

  Widget _buildNotification() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Receive notifications',
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
