import '../../../../core/common/constants/app_constants.dart';
import '../../../../core/common/enums/genre.dart';
import '../../data/models/session_model.dart';
import '../../data/models/video_movie_model.dart';
import '../entities/movie_detail_entity.dart';
import '../repo/movie_detail_repository.dart';
import 'movie_detail_usecases.dart';

class MovieDetailUsecaseImplement extends MovieDetailUsecases {
  final MovieDetailRepository movieDetailRepo;
  MovieDetailUsecaseImplement(
    this.movieDetailRepo,
  );

  @override
  Future<MovieDetailEntity> getMovieDetail({
    required String id,
    required String languageCode,
  }) async {
    final movieDetailModel = await movieDetailRepo.getMovieDetail(id);
    final videos = (await movieDetailRepo.getVideoMovie(id)).results ??
        <VideoMovieModel>[];
    String? bestVideosUrl;
    String? bestVideoName;
    outerloop:
    for (final video in videos) {
      for (final type in indexVideoType) {
        if (video.type.contains(type) && video.site.contains('YouTube')) {
          bestVideosUrl = video.key;
          bestVideoName = video.name;
          break outerloop;
        }
      }
    }

    return MovieDetailEntity(
      title: movieDetailModel.title,
      description: movieDetailModel.overview,
      tagline: movieDetailModel.tagline,
      budget: movieDetailModel.budget,
      genre: movieDetailModel.genres
          ?.map(
            (e) => Genre.getGenreById(e.id ?? 0)?.getGenreString(languageCode),
          )
          .join(', '),
      releaseDate: DateTime.tryParse(movieDetailModel.releaseDate ?? ''),
      revenue: movieDetailModel.revenue,
      voteAverage: movieDetailModel.voteAverage,
      voteCount: movieDetailModel.voteCount,
      runtime: movieDetailModel.runtime?.toDouble(),
      countries: movieDetailModel.productionCountries
          ?.map((e) => e.name ?? '')
          .toList(),
      youtubeName: bestVideoName,
      youtubeUrl: bestVideosUrl,
      posterUrl: movieDetailModel.posterPath,
    );
  }

  @override
  Future<List<SessionModel>?> getMovieSession(
    String id,
    DateTime dateTime,
  ) async {
    return movieDetailRepo.getMovieSessions(id, dateTime);
  }
}
