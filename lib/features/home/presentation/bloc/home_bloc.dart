import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../domain/usecases/home_usecase.impl.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _homeUsecase = HomeUsecaseImplement();
  HomeBloc() : super(HomeState(status: BlocStatusState.initial)) {
    on<HomeGetNowPlayingMovieEvent>(_onGetNowPlayingMovies);
  }

  Future<void> _onGetNowPlayingMovies(
    HomeGetNowPlayingMovieEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    final nowPlayingMovies = await _homeUsecase.getNowPlayingMovie();
    print(nowPlayingMovies);
  }
}
