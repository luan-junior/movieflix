import 'package:get_it/get_it.dart';
import 'package:movieflix/core/client/client.dart';
import 'package:movieflix/modules/movies/data/external/movie_api.dart';
import 'package:movieflix/modules/movies/data/repositories/movie_repository_impl.dart';
import 'package:movieflix/modules/movies/presentation/cubit/movie_detail_cubit.dart';
import 'package:movieflix/modules/movies/presentation/cubit/movies_carousel_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton(() => MovieApi(client: getIt.get<Client>()));
  getIt.registerLazySingleton<MovieRepositoryImpl>(
    () => MovieRepositoryImpl(api: getIt.get<MovieApi>()),
  );

  getIt.registerFactory(
    () => MoviesCarouselCubit(getIt.get<MovieRepositoryImpl>()),
  );
  getIt.registerFactory(
    () => MovieDetailCubit(getIt.get<MovieRepositoryImpl>()),
  );
}
