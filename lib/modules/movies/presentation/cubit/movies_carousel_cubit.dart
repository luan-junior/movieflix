import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/core/response/response.dart';
import 'package:movieflix/modules/movies/domain/repositories/movie_repository.dart';
import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';
import 'package:movieflix/modules/movies/presentation/states/movies_carousel_state.dart';

class MoviesCarouselCubit extends Cubit<MoviesCarouselState> {
  MoviesCarouselCubit(this.repository) : super(MoviesCarouselInitial());

  final MovieRepository repository;

  late Future<Response> Function(int) _getMovies;

  void init(MovieSection type) {
    switch (type) {
      case MovieSection.popular:
        _getMovies = repository.getPopularMovies;
      case MovieSection.topRated:
        _getMovies = repository.getTopRatedMovies;
      case MovieSection.upComing:
        _getMovies = repository.getUpcomingMovies;
      case MovieSection.series:
        _getMovies = repository.getSeries;
      default:
        break;
    }
  }

  bool get isLoading => state is MoviesCarouselLoading;

  Future<void> getMovies() async {
    emit(MoviesCarouselLoading(page: state.page, movies: state.movies));
    final response = await _getMovies(state.page);
    if (response.hasError) {
      emit(
        MoviesCarouselError(
          message: response.error?.message ?? '',
          page: state.page,
          movies: state.movies,
        ),
      );
      return;
    }
    final movies = response.success;
    emit(
      MoviesCarouselLoaded(
        page: state.page + 1,
        movies: [...state.movies, ...movies],
      ),
    );
  }
}
