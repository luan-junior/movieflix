import 'package:movieflix/modules/movies/domain/entities/movie_entity.dart';

abstract class MoviesCarouselState {
  final int page;
  final List<MovieEntity> movies;

  MoviesCarouselState({required this.page, this.movies = const []});

  MoviesCarouselState copyWith({int? page, List<MovieEntity>? movies});
}

class MoviesCarouselInitial extends MoviesCarouselState {
  MoviesCarouselInitial({super.page = 1});

  @override
  MoviesCarouselState copyWith({int? page, List<MovieEntity>? movies}) {
    return MoviesCarouselInitial(page: page ?? this.page);
  }
}

class MoviesCarouselLoading extends MoviesCarouselState {
  MoviesCarouselLoading({required super.page, super.movies});

  @override
  MoviesCarouselState copyWith({int? page, List<MovieEntity>? movies}) {
    return MoviesCarouselLoading(
      page: page ?? this.page,
      movies: movies ?? this.movies,
    );
  }
}

class MoviesCarouselLoaded extends MoviesCarouselState {
  MoviesCarouselLoaded({super.movies, required super.page});

  @override
  MoviesCarouselState copyWith({int? page, List<MovieEntity>? movies}) {
    return MoviesCarouselLoaded(
      page: page ?? this.page,
      movies: movies ?? this.movies,
    );
  }
}

class MoviesCarouselError extends MoviesCarouselState {
  final String message;

  MoviesCarouselError({
    required this.message,
    required super.page,
    super.movies,
  });

  @override
  MoviesCarouselState copyWith({int? page, List<MovieEntity>? movies}) {
    return MoviesCarouselError(
      page: page ?? this.page,
      movies: movies ?? this.movies,
      message: '',
    );
  }
}
