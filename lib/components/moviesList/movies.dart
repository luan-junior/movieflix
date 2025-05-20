import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  final void Function()? onPressed;
  final List<dynamic> movies;
  const Movies({super.key, required this.onPressed, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final filme = movies[index];
              final imagem =
                  filme['poster_path'] != null
                      ? 'https://image.tmdb.org/t/p/w500${filme['poster_path']}'
                      : null;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    imagem != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(imagem),
                        )
                        : Container(),
              );
            },
          ),
        ),
      ],
    );
  }
}
