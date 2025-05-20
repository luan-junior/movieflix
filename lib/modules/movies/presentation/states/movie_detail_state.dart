import 'package:movieflix/modules/movies/domain/entities/movie_entity.dart';

abstract class MovieDetailState {
  final int id;
  final MovieEntityDetail? movie;

  MovieDetailState({required this.id, this.movie});

  MovieDetailState copyWith({int? id, MovieEntityDetail? movie});
}

class MovieDetailInitial extends MovieDetailState {
  MovieDetailInitial({super.id = 1});

  @override
  MovieDetailState copyWith({int? id, MovieEntityDetail? movie}) {
    return MovieDetailInitial(id: id ?? this.id);
  }
}

class MovieDetailLoading extends MovieDetailState {
  MovieDetailLoading({required super.id, super.movie});

  @override
  MovieDetailState copyWith({int? id, MovieEntityDetail? movie}) {
    return MovieDetailLoading(id: id ?? this.id, movie: movie ?? this.movie);
  }
}

class MovieDetailLoaded extends MovieDetailState {
  MovieDetailLoaded({required super.movie, required super.id});

  @override
  MovieDetailState copyWith({int? id, MovieEntityDetail? movie}) {
    return MovieDetailLoaded(id: id ?? this.id, movie: movie ?? this.movie);
  }
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError({required this.message, required super.id, super.movie});

  @override
  MovieDetailState copyWith({int? id, MovieEntityDetail? movie}) {
    return MovieDetailError(
      id: id ?? this.id,
      movie: movie ?? this.movie,
      message: '',
    );
  }
}
