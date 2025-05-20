import 'package:movieflix/core/response/response.dart';
import 'package:movieflix/modules/movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Response<List<MovieEntity>>> getPopularMovies(int page);
  Future<Response<List<MovieEntity>>> getTopRatedMovies(int page);
  Future<Response<List<MovieEntity>>> getUpcomingMovies(int page);
  Future<Response<MovieEntityDetail>> getDetail(int id);
  Future<Response<List<MovieEntity>>> getSeries(int page);
  Future<Response<MovieEntityDetail>> getSerieDetail(int id);
}
