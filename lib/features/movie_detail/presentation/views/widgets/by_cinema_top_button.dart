import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/constants/app_constants.dart';
import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/localizations.dart';

// ignore: must_be_immutable
class ByCinemaTopButton extends StatefulWidget {
  final Function(bool) onChange;
  const ByCinemaTopButton({super.key, required this.onChange});

  @override
  State<ByCinemaTopButton> createState() => _ByCinemaTopButtonState();
}

class _ByCinemaTopButtonState extends State<ByCinemaTopButton> {
  late TextTheme _textTheme;
  late ColorScheme _colorScheme;

  bool isSelected = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
    _colorScheme = Theme.of(context).colorScheme;
    final isVi = Localizations.localeOf(context).languageCode == viStringCode;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Switch(
            value: isSelected,
            onChanged: (selected) {
              setState(() {
                isSelected = selected;
              });
            },
            inactiveThumbColor: _colorScheme.onBackground,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            translate(context).byCinema,
            style: _textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
