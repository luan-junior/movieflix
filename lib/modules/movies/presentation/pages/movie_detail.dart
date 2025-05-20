import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/core/injection/locator.dart';
import 'package:movieflix/modules/movies/presentation/cubit/movie_detail_cubit.dart';
import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';
import 'package:movieflix/modules/movies/presentation/states/movie_detail_state.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  final MovieSection section;

  const MovieDetail({required this.id, required this.section, super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late MovieDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt.get<MovieDetailCubit>();
    cubit.init(widget.section);
    cubit.getMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        bloc: cubit,
        builder: (context, state) {
          final movie = state.movie;

          if (state is MovieDetailLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is MovieDetailError) {
            return Center(child: Text("Erro: ${state.message}"));
          }

          final genreNames = movie?.genres.map((e) => e.name).join(', ');
          final isAdult = movie!.adult ? '18+   | ' : '';

          final starrings = movie.credits!.cast
              ?.take(3)
              .map((e) => e.name)
              .join(', ');

          final credits = movie.credits!.crew
              ?.take(3)
              .map((e) => e.name)
              .join(', ');

          final creators =
              credits != ''
                  ? credits
                  : movie.createdBy?.take(3).map((e) => e.name).join(', ');

          var title = movie.title;

          return Scaffold(
            appBar: AppBar(title: Text(title.toString()), centerTitle: true),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    movie.fullImagePath,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Container(color: Colors.grey),
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      title.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '2022  |  $isAdult  K-Drama',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.overview,
                      style: const TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Starring: $starrings',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Creators: $creators',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Genre: $genreNames',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: movie.seasons?.length,
                    itemBuilder: (context, index) {
                      final serie = movie.seasons?[index];

                      final imagem =
                          serie?.posterPath != null
                              ? 'https://image.tmdb.org/t/p/w500${serie?.posterPath}'
                              : null;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            imagem != null
                                ? EpisodeTile(
                                  episodeNumber: serie!.seasonNumber,
                                  duration: '47m',
                                  description: serie.name,
                                )
                                : Container(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EpisodeTile extends StatelessWidget {
  final int episodeNumber;
  final String duration;
  final String description;

  const EpisodeTile({
    super.key,
    required this.episodeNumber,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumb placeholder
          Container(width: 100, height: 60, color: Colors.grey[800]),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Episode $episodeNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      duration,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
