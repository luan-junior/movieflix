import 'package:flutter/material.dart';
import 'package:movieflix/modules/movies/data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final path = 'https://image.tmdb.org/t/p/original${movie.imagePath}';
    return Container(
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        path,
        errorBuilder:
            (context, error, stackStrace) => Container(color: Colors.grey),
        fit: BoxFit.cover,
        height: 180,
        width: 120,
      ),
    );
  }
}
