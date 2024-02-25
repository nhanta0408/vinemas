// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../core/utils/localizations.dart';
import '../bloc/movie_detail_bloc.dart';
import '../bloc/movie_detail_event.dart';
import '../bloc/movie_detail_state.dart';
import 'tabs/about_tab_widget.dart';
import 'tabs/session_tab_widget.dart';

part 'movie_detail_screen.action.dart';

class MovieDetailScreenArg {
  String movieId;
  MovieDetailScreenArg({
    required this.movieId,
  });
}

class MovieDetailScreen extends StatefulWidget {
  String movieId;
  MovieDetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;
  late YoutubePlayerController youtubeController;

  MovieDetailBloc get bloc => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bloc.add(
        GetMovieDetailEvent(
          id: widget.movieId,
          languageCode: Localizations.localeOf(context).languageCode,
        ),
      );
    });
    youtubeController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return BlocConsumer<MovieDetailBloc, MovieDetailState>(
      listener: blocListener,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                state.movieDetail?.title ?? '',
                style: _textTheme.titleMedium,
              ),
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: _colorScheme.outline,
                dividerHeight: 2,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(translate(context).about),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(translate(context).sessions),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AboutTabWidget(
                  movieDetailEntity: state.movieDetail,
                ),
                SessionTabWidget(
                  sessions: state.sessions ?? [],
                  movieDetailEntity: state.movieDetail,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
