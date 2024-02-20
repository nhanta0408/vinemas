abstract class HomeEvent {}

class HomeGetNowPlayingMovieEvent extends HomeEvent {
  final String languageCode;

  HomeGetNowPlayingMovieEvent({required this.languageCode});
}
