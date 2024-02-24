import 'package:flutter/material.dart';

import '../../../../../core/common/constants/assets.dart';

class AccountAvatarNameWidget extends StatefulWidget {
  final String? avatarUrl;
  final String? name;
  const AccountAvatarNameWidget({super.key, this.avatarUrl, this.name});

  @override
  State<AccountAvatarNameWidget> createState() =>
      _AccountAvatarNameWidgetState();
}

class _AccountAvatarNameWidgetState extends State<AccountAvatarNameWidget> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.avatarUrl?.isNotEmpty == true
            ? CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.avatarUrl!),
              )
            : const Icon(
                Icons.person,
                size: 40,
              ),
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.name ?? '',
          style: _textTheme.titleLarge,
        ),
      ],
    );
  }
}
