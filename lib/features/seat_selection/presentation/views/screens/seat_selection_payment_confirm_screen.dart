import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/common/widget/customize_button.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/int_utils.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../ticket_detail/presentation/ticket_detail_route.dart';
import '../../../../ticket_detail/presentation/views/ticket_detail_screen.dart';
import '../../../domain/entities/ticket_entity.dart';

// ignore: must_be_immutable
class SeatSelectionPaymentConfirmScreen extends StatefulWidget {
  final TicketEntity ticketEntity;
  const SeatSelectionPaymentConfirmScreen({
    Key? key,
    required this.ticketEntity,
  }) : super(key: key);

  @override
  State<SeatSelectionPaymentConfirmScreen> createState() =>
      _SeatSelectionPaymentConfirmScreenState();
}

class _SeatSelectionPaymentConfirmScreenState
    extends State<SeatSelectionPaymentConfirmScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.chevron_left,
                      color: _colorScheme.primaryContainer,
                      size: 32,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Pay for ticket',
                      style: _textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                decoration: BoxDecoration(
                  color: _colorScheme.outline,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ticketEntity.movie?.title ?? '',
                            style: _textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _buildRowItem(
                            title: 'Cinema',
                            value:
                                widget.ticketEntity.session?.theaterName ?? '',
                          ),
                          _buildRowItem(
                            title: 'Date',
                            value: widget.ticketEntity.session?.time
                                    ?.toLocalHHnnddmmyyyy() ??
                                '',
                          ),
                          _buildRowItem(
                            title: 'Thời lượng',
                            value: widget.ticketEntity.movie?.runtime
                                    ?.toStringAsFixed(0)
                                    .addUnitPost('phút') ??
                                '',
                          ),
                          _buildRowItem(
                            title: 'Seats',
                            value: widget.ticketEntity.seats
                                    ?.map((e) => e.position)
                                    .join(', ') ??
                                '',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Total',
                            style: _textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          _buildRowItem(
                            title: 'Số lượng vé',
                            value:
                                widget.ticketEntity.seats?.length.toString() ??
                                    '0',
                          ),
                          _buildRowItem(
                            title: 'Đơn giá',
                            value: 100000.addCommas().addUnitPost('đ'),
                          ),
                          _buildRowItem(
                            title: 'Tổng tiền',
                            value: widget.ticketEntity.totalAmount
                                    ?.toInt()
                                    .addCommas()
                                    .addUnitPost('đ') ??
                                '',
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.svg.tearLine,
                      width: width - 16 * 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: CustomizedButton(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            TicketDetailRoute.routeName,
                            arguments: TicketDetailScreenArg(
                              ticket: widget.ticketEntity,
                            ),
                          );
                        },
                        text: 'Xác nhận',
                        backgroundColor: _colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowItem({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.primaryContainer),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
