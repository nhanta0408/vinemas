// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../di/di.dart';
import '../../../movie_detail/data/models/session_model.dart';
import '../../../movie_detail/domain/entities/movie_detail_entity.dart';
import '../bloc/seat_selection_bloc.dart';
import '../bloc/seat_selection_event.dart';
import '../bloc/seat_selection_state.dart';
import 'screens/seat_selection_payment_confirm_screen.dart';
import 'widgets/seat_map_widget.dart';

part 'seat_selection_screen.action.dart';

class SeatSelectionScreenArg {
  SessionModel sessionModel;
  MovieDetailEntity movieDetailEntity;
  SeatSelectionScreenArg({
    required this.sessionModel,
    required this.movieDetailEntity,
  });
}

// ignore: must_be_immutable
class SeatSelectionScreen extends StatefulWidget {
  final SessionModel sessionModel;
  final MovieDetailEntity movieDetailEntity;
  const SeatSelectionScreen({
    Key? key,
    required this.sessionModel,
    required this.movieDetailEntity,
  }) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  SeatSelectionBloc get bloc => BlocProvider.of<SeatSelectionBloc>(context);
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;

  @override
  void initState() {
    super.initState();
  }

  final TransformationController _controller = TransformationController();
  bool isShowSeat = false;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocConsumer<SeatSelectionBloc, SeatSelectionState>(
      listener: blocListener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Text(
                  widget.sessionModel.theaterName ?? '',
                  style: _textTheme.titleMedium,
                ),
                Text(
                  widget.movieDetailEntity.title ?? '',
                  style: _textTheme.bodyMedium
                      ?.copyWith(color: _colorScheme.primaryContainer),
                ),
              ],
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                color: _colorScheme.primaryContainer,
                size: 32,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  Assets.svg.icEnlarge,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 64),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: _colorScheme.surface,
                child: Row(
                  children: [
                    _buildAppbarBottomItem(
                      Assets.svg.icCalendar,
                      widget.sessionModel.time?.toMonthNameWithDate() ?? '',
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    _buildAppbarBottomItem(
                      Assets.svg.icClock,
                      widget.sessionModel.time?.toTimeFormat() ?? '',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAnnotationItem(
                      color: _colorScheme.outline,
                      text: 'Available',
                    ),
                    _buildAnnotationItem(
                      color: Colors.grey,
                      text: 'Occupied',
                    ),
                    _buildAnnotationItem(
                      color: _colorScheme.primary,
                      text: 'Chosen',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SeatMapWidget(
                  movieDetail: widget.movieDetailEntity,
                  session: widget.sessionModel,
                  onBookTicket: (ticket) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) {
                        return SeatSelectionPaymentConfirmScreen(
                          ticketEntity: ticket,
                          onConfirm: (finalTicket) {
                            bloc.add(
                              SeatSelectionCreateTicketEvent(
                                ticket: finalTicket,
                              ),
                            );
                          },
                        );
                      },
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => BlocProvider.value(
                    //       value: BlocProvider.of<SeatSelectionBloc>(context),
                    //       child: SeatSelectionPaymentConfirmScreen(
                    //         ticketEntity: ticket,
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnnotationItem({
    required Color color,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: _textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Expanded _buildAppbarBottomItem(String svgAsset, String value) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: _colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgAsset),
            const SizedBox(
              width: 6,
            ),
            Text(
              value,
              style: _textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
