import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/enums/gender.dart';
import '../../domain/entities/user_entity.dart';
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
  @override
  void initState() {
    super.initState();
  }

  final UserEntity _user = UserEntity(
    fullName: 'Jack Sparrow',
    avatarUrl:
        'https://static.wikia.nocookie.net/great-characters/images/d/d8/Jacksparrow.jpeg/revision/latest/thumbnail/width/360/height/360?cb=20190323132109',
    phoneNumber: '389191857',
    email: 'jack.sparrow@gmail.com',
    gender: Gender.male,
    city: 'Hồ Chí Minh',
    dateOfBirth: DateTime(1975),
  );
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              AccountAvatarNameWidget(
                name: _user.fullName,
                avatarUrl: _user.avatarUrl,
              ),
              const SizedBox(
                height: 24,
              ),
              AccountInformationWidget(
                initialUser: _user,
                onSaveChanged: (user) {
                  print(user.toString());
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
              const AccountPaymentHistoryWidget(),
            ],
          ),
        ),
      ),
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