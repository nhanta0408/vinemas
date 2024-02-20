import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/constants/app_constants.dart';
import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/utils/date_utils.dart';

// ignore: must_be_immutable
class CalendarTopButton extends StatefulWidget {
  final Function(DateTime) onChange;
  const CalendarTopButton({super.key, required this.onChange});

  @override
  State<CalendarTopButton> createState() => _CalendarTopButtonState();
}

class _CalendarTopButtonState extends State<CalendarTopButton> {
  late TextTheme _textTheme;
  late ColorScheme _colorScheme;

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
    _colorScheme = Theme.of(context).colorScheme;
    final isVi = Localizations.localeOf(context).languageCode == viStringCode;
    return GestureDetector(
      onTap: () async {
        final resultPicker = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: selectedDate,
          lastDate: DateTime(2040),
        );
        if (resultPicker != null) {
          setState(() {
            selectedDate = resultPicker;
          });
          widget.onChange(resultPicker);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.svg.icCalendar,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              !isVi
                  ? selectedDate.toMonthNameWithDate()
                  : selectedDate.toMonthNameWithDate(),
              style: _textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
