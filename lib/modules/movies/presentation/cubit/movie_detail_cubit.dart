import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/core/response/response.dart';
import 'package:movieflix/modules/movies/domain/repositories/movie_repository.dart';
import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';
import 'package:movieflix/modules/movies/presentation/states/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this.repository) : super(MovieDetailInitial());

  final MovieRepository repository;

  late Future<Response> Function(int) _getMovie;

  void init(MovieSection type) {
    switch (type) {
      case MovieSection.detail:
        _getMovie = repository.getDetail;
      case MovieSection.serieDetail:
        _getMovie = repository.getSerieDetail;
      default:
        return;
    }
  }

  bool get isLoading => state is MovieDetailLoading;

  Future<void> getMovie(int id) async {
    emit(MovieDetailLoading(id: state.id, movie: state.movie));
    final response = await _getMovie(id);
    if (response.hasError) {
      emit(
        MovieDetailError(
          message: response.error?.message ?? '',
          id: state.id,
          movie: state.movie,
        ),
      );
      return;
    }
    final movie = response.success;
    emit(MovieDetailLoaded(id: state.id, movie: movie));
  }
}
