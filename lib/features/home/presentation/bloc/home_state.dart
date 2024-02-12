// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/common/model/bloc_status_state.dart';
import '../../data/model/movie.dart';

class HomeState {
  final BlocStatusState status;
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? upcomingMovies;

  HomeState({
    required this.status,
    this.nowPlayingMovies,
    this.upcomingMovies,
  });

  HomeState copyWith({
    required BlocStatusState status,
    List<Movie>? nowPlayingMovies,
    List<Movie>? upcomingMovies,
  }) {
    return HomeState(
      status: status,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }
}
