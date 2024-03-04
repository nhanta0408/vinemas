import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/model/bloc_status_state.dart';

import '../../domain/usecases/movie_detail_usecases.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDetailUsecases _usecases;
  MovieDetailBloc(this._usecases)
      : super(MovieDetailState(status: BlocStatusState.initial)) {
    on<GetMovieDetailEvent>(_onGetMovieDetailEvent);
    on<GetMovieSessionsEvent>(_onGetMovieSessionsEvent);
  }
  FutureOr<void> _onGetMovieDetailEvent(
    GetMovieDetailEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(MovieDetailState(status: BlocStatusState.loading));
    try {
      final movieDetail = await _usecases.getMovieDetail(
        id: event.id,
        languageCode: event.languageCode,
      );
      final sessions = await _usecases.getMovieSession(
        event.id,
        DateTime.now(),
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          movieDetail: movieDetail,
          sessions: sessions,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onGetMovieSessionsEvent(
    GetMovieSessionsEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final sessions = await _usecases.getMovieSession(
        event.id,
        event.dateTime,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          sessions: sessions,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
