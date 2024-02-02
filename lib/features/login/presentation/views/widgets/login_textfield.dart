import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String title;
  final bool isPassword;
  const LoginTextField(
      {super.key, required this.title, required this.isPassword});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late ColorScheme colorScheme;
  bool isHidePassword = true;
  @override
  Widget build(BuildContext context) {
    colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.isPassword && isHidePassword,
            obscuringCharacter: '•',
            decoration: InputDecoration(
                isCollapsed: true,
                prefixIcon: Icon(
                  widget.isPassword ? Icons.lock : Icons.person,
                  color: colorScheme.primary,
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isHidePassword = !isHidePassword;
                      });
                    },
                    child: _getSuffixIcon(isHidePassword: isHidePassword))))
      ],
    );
  }

  Widget _getSuffixIcon({required bool isHidePassword}) {
    if (!widget.isPassword) {
      return const SizedBox();
    } else {
      return Icon(
        isHidePassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: colorScheme.primaryContainer,
      );
    }
  }
}
