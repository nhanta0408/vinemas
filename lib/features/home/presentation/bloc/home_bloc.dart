import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/constants/app_constants.dart';
import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../di/di.dart';
import '../../../../main.dart';
import '../../data/datasource/remote/home_rest_api.dart';
import '../../domain/repo/home_repository.dart';
import '../../domain/repo/home_repository.implement.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/home_usecase.impl.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase _homeUsecase;
  HomeBloc(this._homeUsecase)
      : super(HomeState(status: BlocStatusState.initial)) {
    on<HomeGetNowPlayingMovieEvent>(_onGetNowPlayingMovies);
  }

  Future<void> _onGetNowPlayingMovies(
    HomeGetNowPlayingMovieEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    final isVi = event.languageCode == viStringCode;
    final nowPlayingMovies = await _homeUsecase
        .getNowPlayingMovie(isVi ? viPairStringCode : enPairStringCode);
    print(nowPlayingMovies);
    emit(
      state.copyWith(
        status: BlocStatusState.success,
        nowPlayingMovies: nowPlayingMovies,
      ),
    );
  }
}
