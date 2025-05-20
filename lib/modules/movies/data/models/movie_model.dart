import 'package:movieflix/core/errors/app_error.dart';
import 'package:movieflix/modules/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.imagePath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    try {
      return MovieModel(
        id: json['id'],
        title: json['title'] ?? '-',
        imagePath: json['poster_path'],
      );
    } catch (e, s) {
      throw SerializerError(
        stackTrace: s,
        error: e,
        message: 'Erro ao tentar de converter MovieModel',
      );
    }
  }
}

class CastModel extends Cast {
  CastModel({required super.id, required super.name});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(id: json['id'], name: json['name']);
  }
}

class CrewModel extends Crew {
  CrewModel({required super.id, required super.name});

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(id: json['id'], name: json['name']);
  }
}

class CreditsModel extends Credits {
  CreditsModel({required super.cast, required super.crew});

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      cast:
          (json['cast'] as List<dynamic>?)
              ?.map((c) => Cast(id: c['id'], name: c['name']))
              .toList(),
      crew:
          (json['crew'] as List<dynamic>?)
              ?.map((c) => Crew(id: c['id'], name: c['name']))
              .toList(),
    );
  }
}

class MovieDetailModel extends MovieEntityDetail {
  MovieDetailModel({
    required super.adult,
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.title,
    required super.credits,
    required super.imagePath,
    required super.createdBy,
    required super.seasons,
    required super.numberOfSeasons,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    try {
      return MovieDetailModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genres:
            (json['genres'] as List)
                .map((g) => Genre(id: g['id'], name: g['name']))
                .toList(),
        id: json['id'],
        overview: json['overview'],

        title: json['title'] ?? json['name'],
        imagePath: json['backdrop_path'],
        credits:
            json['credits'] != null
                ? CreditsModel.fromJson(json['credits'])
                : null,
        createdBy:
            (json['created_by'] as List?)
                ?.map((c) => CreatedBy(id: c['id'], name: c['name']))
                .toList(),
        seasons:
            (json['seasons'] as List?)
                ?.map(
                  (s) => Season(
                    id: s['id'],
                    name: s['overview'] ?? s['name'],
                    posterPath: s['poster_path'] ?? '',
                    seasonNumber: s['season_number'],
                  ),
                )
                .toList() ??
            [],
        numberOfSeasons: json['number_of_seasons'],
      );
    } catch (e, s) {
      throw SerializerError(
        stackTrace: s,
        error: e,
        message: 'Erro ao tentar de converter MovieModel',
      );
    }
  }
}
