import 'package:movieflix/core/errors/app_error.dart';
import 'package:movieflix/core/response/response.dart';
import 'package:movieflix/modules/movies/data/external/movie_api.dart';
import 'package:movieflix/modules/movies/domain/entities/movie_entity.dart';
import 'package:movieflix/modules/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi api;
  MovieRepositoryImpl({required this.api});
  @override
  Future<Response<List<MovieEntity>>> getPopularMovies(int page) async {
    try {
      final response = await api.getPopularMovies(page);
      return Response(success: response);
    } on AppError catch (e, _) {
      return Response(error: e);
    } catch (e, _) {
      rethrow;
    }
  }

  @override
  Future<Response<List<MovieEntity>>> getTopRatedMovies(int page) async {
    try {
      final response = await api.getTopRatedMovies(page);
      return Response(success: response);
    } on AppError catch (e, _) {
      return Response(error: e);
    } catch (e, _) {
      rethrow;
    }
  }

  @override
  Future<Response<List<MovieEntity>>> getUpcomingMovies(int page) async {
    try {
      final response = await api.getUpcomingMovies(page);
      return Response(success: response);
    } on AppError catch (e, _) {
      return Response(error: e);
    } catch (e, _) {
      rethrow;
    }
  }

  @override
  Future<Response<MovieEntityDetail>> getDetail(int id) async {
    try {
      final response = await api.getDetail(id);
      return Response(success: response);
    } on AppError catch (e, _) {
      return Response(error: e);
    } catch (e, _) {
      rethrow;
    }
  }

  @override
  Future<Response<List<MovieEntity>>> getSeries(int page) async {
    try {
      final response = await api.getSeries(page);
      return Response(success: response);
    } on AppError catch (e, _) {
      return Response(error: e);
    } catch (e, _) {
      rethrow;
    }
  }

  @override
  Future<Response<MovieEntityDetail>> getSerieDetail(int id) async {
    try {
      final response = await api.getSerieDetail(id);
      return Response(success: response);
    } on AppError catch (e, _) {
      return Response(error: e);
    } catch (e, _) {
      rethrow;
    }
  }
}
