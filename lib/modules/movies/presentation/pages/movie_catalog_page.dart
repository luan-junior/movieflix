import 'package:flutter/material.dart';
import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';
import 'package:movieflix/modules/movies/presentation/widgets/movie_carousel.dart';

class MovieCatalogPage extends StatefulWidget {
  const MovieCatalogPage({super.key});

  @override
  State<MovieCatalogPage> createState() => _MovieCatalogPageState();
}

class _MovieCatalogPageState extends State<MovieCatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieCarousel(section: MovieSection.topRated),
        MovieCarousel(section: MovieSection.popular),
        MovieCarousel(section: MovieSection.upComing),
        MovieCarousel(section: MovieSection.series),
      ],
    );
  }
}
