import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieflix/modules/movies/domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    var url = movie.title != '-' ? '/detail/movie' : '/detail/serie';
    return GestureDetector(
      onTap: () => context.push('$url/${movie.id}'),
      child: Container(
        height: 180,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Image.network(
          movie.fullImagePath,
          errorBuilder:
              (context, error, stackTrace) => Container(color: Colors.grey),
          fit: BoxFit.cover,
          height: 180,
          width: 120,
        ),
      ),
    );
  }
}
