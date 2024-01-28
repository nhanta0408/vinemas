import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinemas_app/core/common/contants/assets.dart';
import 'package:vinemas_app/core/utils/localizations.dart';

import '../../../core/common/widget/customize_button.dart';
import 'widgets/login_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 45,
              ),
              SvgPicture.asset(
                Assets.svg.icAppIcon,
                width: 120,
                height: 120,
              ),
              const SizedBox(
                height: 45,
              ),
              _buildMainLogin(context),
              const SizedBox(
                height: 45,
              ),
              _buildSignInWith(context)
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildMainLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 36),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTextField(
              title: translate(context).username,
              isPassword: false,
            ),
            const SizedBox(
              height: 24,
            ),
            LoginTextField(
              title: translate(context).password,
              isPassword: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
                alignment: Alignment.centerRight,
                child: Text(
                  translate(context).forgotPassword,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.primary),
                )),
            const SizedBox(
              height: 24,
            ),
            CustomizedButton(
              onTap: () {},
              backgroundColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
              child: Text(
                translate(context).login,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            )
          ]),
    );
  }

  Column _buildSignInWith(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(translate(context).orSigninWith),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSignin(isGoogle: true),
              _buildSignin(isGoogle: false),
            ],
          )
        ]);
  }

  SizedBox _buildSignin({required bool isGoogle}) {
    return SizedBox(
        width: 81,
        height: 81,
        child: Column(
          children: [
            Image.asset(
                isGoogle ? Assets.images.icGGSignIn : Assets.images.icFBSignIn),
            const SizedBox(
              height: 12,
            ),
            Text(
              isGoogle ? 'Google' : 'Facebook',
              style: theme.textTheme.bodySmall,
            )
          ],
        ));
  }
}
