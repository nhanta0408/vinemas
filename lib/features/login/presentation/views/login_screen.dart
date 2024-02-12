import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/contants/assets.dart';
import '../../../../core/common/widget/customize_button.dart';
import '../../../../core/utils/localizations.dart';
import '../../../home/presentation/home_route.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import 'widgets/login_textfield.dart';

part 'login_screen.action.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;

  LoginBloc get bloc => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: blocListener,
      builder: (context, state) {
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
                  _buildSignInWith(context),
                ],
              ),
            ),
          ),
        );
      },
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
            child: GestureDetector(
              onTap: onForgotPassword,
              child: Text(
                translate(context).forgotPassword,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.primary),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomizedButton(
            onTap: () {
              onLogin();
            },
            backgroundColor: theme.colorScheme.primary,
            textColor: theme.colorScheme.onPrimary,
            child: Text(
              translate(context).login,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
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
        ),
      ],
    );
  }

  Widget _buildSignin({required bool isGoogle}) {
    return SizedBox(
      width: 81,
      height: 81,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              isGoogle ? onGoogleSignin() : onFacebookSignin();
            },
            child: Image.asset(
              isGoogle ? Assets.images.icGGSignIn : Assets.images.icFBSignIn,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            isGoogle ? 'Google' : 'Facebook',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
