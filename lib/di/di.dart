import 'package:get_it/get_it.dart';

import '../features/home/data/datasource/remote/home_rest_api.dart';
import '../features/home/domain/repo/home_repository.dart';
import '../features/home/domain/repo/home_repository.implement.dart';
import '../features/home/domain/usecases/home_usecase.dart';
import '../features/home/domain/usecases/home_usecase.impl.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/movie_detail/data/datasource/remote/movie_detail_rest_api.dart';
import '../features/movie_detail/data/datasource/remote/session_rest_api.dart';
import '../features/movie_detail/data/datasource/remote/session_rest_api.implement.dart';
import '../features/movie_detail/domain/repo/movie_detail_repository.dart';
import '../features/movie_detail/domain/repo/movie_detail_repository.implement.dart';
import '../features/movie_detail/domain/usecases/movie_detail_usecases.dart';
import '../features/movie_detail/domain/usecases/movie_detail_usecases.implement.dart';
import '../features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import '../main.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt
    ..registerFactory<HomeRestApi>(() => HomeRestApi(dioClient.dio))
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImplement(getIt<HomeRestApi>()),
    )
    ..registerFactory<HomeUsecase>(
      () => HomeUsecaseImplement(getIt<HomeRepository>()),
    )
    ..registerFactory<HomeBloc>(() => HomeBloc(getIt<HomeUsecase>()))
    ..registerFactory<MovieDetailRestApi>(
      () => MovieDetailRestApi(dioClient.dio),
    )
    ..registerFactory<SessionRestApi>(
      SessionRestApiImplement.new,
    )
    ..registerFactory<MovieDetailRepository>(
      () => MovieDetailRepositoryImplement(
        getIt<MovieDetailRestApi>(),
        getIt<SessionRestApi>(),
      ),
    )
    ..registerFactory<MovieDetailUsecases>(
      () => MovieDetailUsecaseImplement(getIt<MovieDetailRepository>()),
    )
    ..registerFactory<MovieDetailBloc>(
      () => MovieDetailBloc(getIt<MovieDetailUsecases>()),
    );
}
