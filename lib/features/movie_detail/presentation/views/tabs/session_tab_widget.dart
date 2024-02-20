// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/int_utils.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../data/models/session_model.dart';
import '../../bloc/movie_detail_bloc.dart';
import '../../bloc/movie_detail_event.dart';
import '../widgets/by_cinema_top_button.dart';
import '../widgets/calendar_top_button.dart';
import '../widgets/sort_top_button.dart';

class SessionTabWidget extends StatefulWidget {
  List<SessionModel> sessions;
  SessionTabWidget({
    Key? key,
    required this.sessions,
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
              Expanded(
                flex: 3,
                child: Container(
                  child: const Text(
                    'Time',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text('Adult', textAlign: TextAlign.left),
                      ),
                      const Expanded(
                        child: Text('Child', textAlign: TextAlign.left),
                      ),
                      Expanded(
                        child: Container(
                          child: const Text(
                            'Student',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const Expanded(
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
              return Container(
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
                                Expanded(
                                  child: Text(
                                    session.adultCost
                                            ?.toInt()
                                            .addCommas()
                                            .addUnitPost('đ') ??
                                        '',
                                    style: _textTheme.bodySmall,
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    session.childCost
                                            ?.toInt()
                                            .addCommas()
                                            .addUnitPost('đ') ??
                                        '',
                                    style: _textTheme.bodySmall,
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      session.studentCost
                                              ?.toInt()
                                              .addCommas()
                                              .addUnitPost('đ') ??
                                          '',
                                      style: _textTheme.bodySmall,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    session.vipCost
                                            ?.toInt()
                                            .addCommas()
                                            .addUnitPost('đ') ??
                                        '',
                                    maxLines: 1,
                                    style: _textTheme.bodySmall,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

  @override
  bool get wantKeepAlive => true;
}
