import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/constants/app_constants.dart';
import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/localizations.dart';

// ignore: must_be_immutable
class SortTopButton extends StatefulWidget {
  final Function(bool) onChange;
  const SortTopButton({super.key, required this.onChange});

  @override
  State<SortTopButton> createState() => _SortTopButtonState();
}

class _SortTopButtonState extends State<SortTopButton> {
  late TextTheme _textTheme;
  late ColorScheme _colorScheme;

  bool isAsc = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
    _colorScheme = Theme.of(context).colorScheme;
    final isVi = Localizations.localeOf(context).languageCode == viStringCode;
    return GestureDetector(
      onTap: () async {
        setState(() {
          isAsc = !isAsc;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.svg.icSort,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '${translate(context).time} ${isAsc ? '↑' : '↓'}',
              style: _textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
