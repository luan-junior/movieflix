import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';

extension SessionName on MovieSection {
  String label() {
    switch (this) {
      case MovieSection.popular:
        return 'Populares';
      case MovieSection.topRated:
        return 'Melhor avaliados';
      case MovieSection.upComing:
        return 'Chegando em breve';
      case MovieSection.series:
        return 'Series Polulares';
      case MovieSection.detail:
        return 'Carregando Detalhes do Filme';
      case MovieSection.serieDetail:
        return 'Carregando Detalhes da Serie';
    }
  }
}
