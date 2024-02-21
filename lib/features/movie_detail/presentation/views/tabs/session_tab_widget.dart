// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/int_utils.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../seat_selection/presentation/seat_selection_route.dart';
import '../../../../seat_selection/presentation/views/seat_selection_screen.dart';
import '../../../data/models/session_model.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../bloc/movie_detail_bloc.dart';
import '../../bloc/movie_detail_event.dart';
import '../widgets/by_cinema_top_button.dart';
import '../widgets/calendar_top_button.dart';
import '../widgets/sort_top_button.dart';

class SessionTabWidget extends StatefulWidget {
  List<SessionModel> sessions;
  MovieDetailEntity? movieDetailEntity;
  SessionTabWidget({
    Key? key,
    required this.sessions,
    this.movieDetailEntity,
  }) : super(key: key);

  @override
  State<SessionTabWidget> createState() => _SessionTabWidgetState();
}

class _SessionTabWidgetState extends State<SessionTabWidget>
    with AutomaticKeepAliveClientMixin {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    theme = Theme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _colorScheme.surface,
          ),
          child: Row(
            children: [
              Expanded(
                child: CalendarTopButton(
                  onChange: (dateTime) {
                    BlocProvider.of<MovieDetailBloc>(context)
                        .add(GetMovieSessionsEvent(id: '', dateTime: dateTime));
                  },
                ),
              ),
              Expanded(
                child: SortTopButton(
                  onChange: (_) {},
                ),
              ),
              Expanded(
                child: ByCinemaTopButton(
                  onChange: (_) {},
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: _colorScheme.outline,
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Time',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text('Adult', textAlign: TextAlign.left),
                      ),
                      Expanded(
                        child: Text('Child', textAlign: TextAlign.left),
                      ),
                      Expanded(
                        child: Text(
                          'Student',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text('VIP', textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final session = widget.sessions[index];
              return GestureDetector(
                onTap: () {
                  if (widget.movieDetailEntity == null) {
                    return;
                  }
                  Navigator.pushNamed(
                    context,
                    SeatSelectionRoute.routeName,
                    arguments: SeatSelectionScreenArg(
                      sessionModel: session,
                      movieDetailEntity: widget.movieDetailEntity!,
                    ),
                  );
                },
                child: Container(
                  height: 78,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Text(
                              session.time?.toTimeFormat() ?? '',
                              style: _textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              session.filmFormat ?? '',
                              style: _textTheme.bodySmall?.copyWith(
                                color: _colorScheme.primaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: _colorScheme.outline,
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                session.theaterName ?? '',
                                style: _textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  _buildTicketCost(session.adultCost),
                                  _buildTicketCost(session.childCost),
                                  _buildTicketCost(session.studentCost),
                                  _buildTicketCost(session.vipCost),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                color: _colorScheme.outline,
              );
            },
            itemCount: widget.sessions.length,
          ),
        ),
      ],
    );
  }

  Widget _buildTicketCost(double? cost) {
    return Expanded(
      child: Text(
        cost?.toInt().addCommas().addUnitPost('đ') ?? '',
        style: _textTheme.bodySmall,
        maxLines: 1,
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
