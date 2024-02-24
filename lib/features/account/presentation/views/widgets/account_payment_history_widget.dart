import 'package:flutter/material.dart';

class AccountPaymentHistoryWidget extends StatefulWidget {
  const AccountPaymentHistoryWidget({super.key});

  @override
  State<AccountPaymentHistoryWidget> createState() =>
      _AccountPaymentHistoryWidgetState();
}

class _AccountPaymentHistoryWidgetState
    extends State<AccountPaymentHistoryWidget> {
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
          'Payment history',
          style: _textTheme.titleMedium
              ?.copyWith(color: _colorScheme.primaryContainer),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _colorScheme.outline,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/vi/3/31/Chi%E1%BA%BFn_binh_b%C3%A1o_%C4%91en_2018.jpg',
                        width: 56,
                        height: 88,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wakanda Forever',
                          style: _textTheme.titleMedium,
                        ),
                        Text(
                          '6 April 2024, 14:40',
                          style: _textTheme.bodyMedium,
                        ),
                        Text(
                          'CGV Cộng Hòa',
                          style: _textTheme.bodyMedium
                              ?.copyWith(color: _colorScheme.primaryContainer),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
