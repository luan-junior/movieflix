import 'package:dio/dio.dart';
import 'package:movieflix/core/client/client.dart';
import 'package:movieflix/core/errors/app_error.dart';
import 'package:movieflix/modules/movies/data/models/movie_model.dart';

class MovieApi {
  final Client client;
  MovieApi({required this.client});

  Future<List<MovieModel>> getPopularMovies(int page) async {
    try {
      final response = await client.get(
        '/movie/popular',
        queryParameters: {'page': page},
      );
      final data = response.data['results'] as List;
      return data.map((mv) => MovieModel.fromJson(mv)).toList();
    } on DioException catch (e, s) {
      throw NetworkError(
        stackTrace: s,
        error: e,
        message: 'Não foi possivel buscar filmes',
      );
    } catch (e, _) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getTopRatedMovies(int page) async {
    try {
      final response = await client.get(
        '/movie/top_rated',
        queryParameters: {'page': page},
      );
      final data = response.data['results'] as List;
      return data.map((mv) => MovieModel.fromJson(mv)).toList();
    } on DioException catch (e, s) {
      throw NetworkError(
        stackTrace: s,
        error: e,
        message: 'Não foi possivel buscar filmes',
      );
    } catch (e, _) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getUpcomingMovies(int page) async {
    try {
      final response = await client.get(
        '/movie/upcoming',
        queryParameters: {'page': page},
      );
      final data = response.data['results'] as List;
      return data.map((mv) => MovieModel.fromJson(mv)).toList();
    } on DioException catch (e, s) {
      throw NetworkError(
        stackTrace: s,
        error: e,
        message: 'Não foi possivel buscar filmes',
      );
    } catch (e, _) {
      rethrow;
    }
  }

  Future<MovieDetailModel> getDetail(int id) async {
    try {
      final response = await client.get(
        '/movie/$id',
        queryParameters: {'append_to_response': 'credits'},
      );
      final data = response.data;
      return MovieDetailModel.fromJson(data);
    } on DioException catch (e, s) {
      throw NetworkError(
        stackTrace: s,
        error: e,
        message: 'Não foi possivel buscar detalhe do filme',
      );
    } catch (e, _) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getSeries(int page) async {
    try {
      final response = await client.get(
        '/tv/popular',
        queryParameters: {'page': page},
      );
      final data = response.data['results'] as List;
      return data.map((mv) => MovieModel.fromJson(mv)).toList();
    } on DioException catch (e, s) {
      throw NetworkError(
        stackTrace: s,
        error: e,
        message: 'Não foi possivel buscar series',
      );
    } catch (e, _) {
      rethrow;
    }
  }

  Future<MovieDetailModel> getSerieDetail(int id) async {
    try {
      final response = await client.get(
        '/tv/$id',
        queryParameters: {'append_to_response': 'credits'},
      );
      final data = response.data;
      return MovieDetailModel.fromJson(data);
    } on DioException catch (e, s) {
      throw NetworkError(
        stackTrace: s,
        error: e,
        message: 'Não foi possivel buscar detalhe do serie',
      );
    } catch (e, _) {
      rethrow;
    }
  }
}
