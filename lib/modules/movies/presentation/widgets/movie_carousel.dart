import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/components/loading_movie_list.dart';
import 'package:movieflix/core/injection/locator.dart';
import 'package:movieflix/modules/movies/presentation/cubit/movies_carousel_cubit.dart';
import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';
import 'package:movieflix/modules/movies/presentation/extensions/movie_extension.dart';
import 'package:movieflix/modules/movies/presentation/states/movies_carousel_state.dart';
import 'package:movieflix/modules/movies/presentation/widgets/movie_card.dart';

class MovieCarousel extends StatefulWidget {
  final MovieSection section;
  const MovieCarousel({required this.section, super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late MoviesCarouselCubit cubit;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    cubit = getIt.get<MoviesCarouselCubit>();
    cubit.init(widget.section);
    cubit.getMovies();
    scrollController = ScrollController();
    scrollController.addListener(onNextPage);
  }

  @override
  void dispose() {
    cubit.close();
    scrollController.removeListener(onNextPage);
    scrollController.dispose();
    super.dispose();
  }

  void onNextPage() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        !cubit.isLoading) {
      cubit.getMovies();
    }
  }

  void toast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.section.label(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: BlocBuilder<MoviesCarouselCubit, MoviesCarouselState>(
              bloc: cubit,
              builder: (context, state) {
                final movies = state.movies;
                if (state is MoviesCarouselLoading && movies.isEmpty) {
                  return LoadingMovieList();
                }
                if (state is MoviesCarouselError) {
                  // toast(state.message);
                }

                return ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    bool showLoading =
                        cubit.isLoading && ((movies.length - 1) == index);
                    return Row(
                      children: [
                        MovieCard(movie: movies[index]),
                        if (showLoading)
                          SizedBox(
                            height: 180,
                            width: 120,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
