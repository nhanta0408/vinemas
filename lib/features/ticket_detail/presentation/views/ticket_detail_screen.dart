// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/widget/customize_button.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../home/presentation/home_route.dart';
import '../../../seat_selection/domain/entities/ticket_entity.dart';

part 'ticket_detail_screen.action.dart';

class TicketDetailScreenArg {
  TicketEntity ticket;
  TicketDetailScreenArg({
    required this.ticket,
  });
}

// ignore: must_be_immutable
class TicketDetailScreen extends StatefulWidget {
  final TicketEntity ticket;
  const TicketDetailScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;

  @override
  void initState() {
    super.initState();
  }

  bool isShowSeat = false;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
      color: _colorScheme.surface,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _colorScheme.surface,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      Text(
                        'Your ticket',
                        style: _textTheme.titleMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(
                            context,
                            HomeRoute.routeName,
                          );
                        },
                        child: SvgPicture.asset(
                          Assets.svg.icClose,
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  clipBehavior: Clip.hardEdge,
                  child: QrImageView(
                    padding: const EdgeInsets.all(16),
                    data: widget.ticket.toString(),
                    version: QrVersions.auto,
                    size: width - 150,
                    backgroundColor: _colorScheme.onBackground,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Show this code to the gatekeeper at the cinema',
                  style: _textTheme.bodyMedium
                      ?.copyWith(color: _colorScheme.primaryContainer),
                ),
                const SizedBox(
                  height: 16,
                ),
                SvgPicture.asset(
                  Assets.svg.tearLine,
                  width: width,
                ),
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ticket.movie?.title ?? '',
                        style: _textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildRowItem(
                        title: 'Cinema',
                        value: widget.ticket.session?.theaterName ?? '',
                      ),
                      _buildRowItem(
                        title: 'Date',
                        value: widget.ticket.session?.time
                                ?.toLocalHHnnddmmyyyy() ??
                            '',
                      ),
                      _buildRowItem(
                        title: 'Thời lượng',
                        value: widget.ticket.movie?.runtime
                                ?.toStringAsFixed(0)
                                .addUnitPost('phút') ??
                            '',
                      ),
                      _buildRowItem(
                        title: 'Seats',
                        value: widget.ticket.seats
                                ?.map((e) => e.position)
                                .join(', ') ??
                            '',
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: _colorScheme.outline,
                          ),
                        ),
                        child: Text(
                          'Refund',
                          style: _textTheme.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomizedButton(
                        onTap: () {},
                        text: 'Send',
                        backgroundColor: _colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
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
