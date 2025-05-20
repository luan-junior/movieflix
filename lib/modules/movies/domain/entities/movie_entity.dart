class MovieEntity {
  final int id;
  final String title;
  final String imagePath;
  MovieEntity({required this.id, required this.title, required this.imagePath});

  String get fullImagePath => 'https://image.tmdb.org/t/p/w500$imagePath';
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}

class Cast {
  final int id;
  final String name;

  Cast({required this.id, required this.name});
}

class Crew {
  final int id;
  final String name;

  Crew({required this.id, required this.name});
}

class Credits {
  final List<Cast>? cast;
  final List<Crew>? crew;

  Credits({required this.cast, required this.crew});
}

class CreatedBy {
  final int id;
  final String name;

  CreatedBy({required this.id, required this.name});
}

class Season {
  final int id;
  final String name;
  final String? posterPath;
  final int seasonNumber;

  Season({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.seasonNumber,
  });
}

class MovieEntityDetail {
  final bool adult;
  final String backdropPath;
  final List<Genre> genres;
  final int id;
  final String overview;
  final String? title;
  final Credits? credits;
  final List<CreatedBy>? createdBy;
  final List<Season>? seasons;
  final int? numberOfSeasons;
  final String imagePath;
  MovieEntityDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.title,
    required this.credits,
    required this.createdBy,
    required this.seasons,
    required this.numberOfSeasons,
    required this.imagePath,
  });

  String get fullImagePath => 'https://image.tmdb.org/t/p/w500$imagePath';
}
