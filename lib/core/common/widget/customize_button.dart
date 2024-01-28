import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final Function onTap;
  final double? borderRadius;
  final Widget? child;
  const CustomizedButton(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.onTap,
      this.text,
      this.borderRadius,
      this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            return backgroundColor;
          }), overlayColor: MaterialStateProperty.resolveWith((states) {
            return Colors.white.withOpacity(0.2);
          }), shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            );
          })),
          child: Center(
            child: child ??
                Text(
                  text ?? 'Button',
                  style: theme.textTheme.titleMedium,
                ),
          )),
    );
  }
}
