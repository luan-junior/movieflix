import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieflix/modules/movies/presentation/enums/movie_serie_section.dart';
import 'package:movieflix/modules/movies/presentation/pages/favorites.dart';
import 'package:movieflix/modules/movies/presentation/pages/initial_page.dart';
import 'package:movieflix/modules/movies/presentation/pages/landing_page.dart';
import 'package:movieflix/components/movie_menu.dart';
import 'package:movieflix/modules/movies/presentation/pages/movie_detail.dart';
import 'package:movieflix/modules/movies/presentation/pages/search.dart';
import 'package:movieflix/modules/movies/presentation/pages/settings.dart';
import 'package:movieflix/modules/movies/presentation/pages/signin.dart';
import 'package:movieflix/modules/movies/presentation/pages/signup.dart';

final router = GoRouter(
  initialLocation: '/intro',

  routes: [
    GoRoute(
      path: '/intro',
      builder: (context, state) {
        return const LandingPage();
      },
    ),
    GoRoute(path: '/signin', builder: (context, state) => Signin()),
    GoRoute(path: '/signup', builder: (context, state) => Signup()),
    GoRoute(
      path: '/detail/movie/:id',
      builder: (BuildContext context, GoRouterState state) {
        final id = int.parse(state.pathParameters['id']!);
        return MovieDetail(section: MovieSection.detail, id: id);
      },
    ),
    GoRoute(
      path: '/detail/serie/:id',
      builder: (BuildContext context, GoRouterState state) {
        final id = int.parse(state.pathParameters['id']!);
        return MovieDetail(section: MovieSection.serieDetail, id: id);
      },
    ),

    ShellRoute(
      builder: (context, state, child) {
        int? index;
        if (state.extra is int) {
          index = state.extra as int;
        }
        return MenuBottomNavigationBar(index: index ?? 0, child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => InitialPage()),

        GoRoute(path: '/search', builder: (context, state) => SearchPage()),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => FavoritesPage(),
        ),
        GoRoute(path: '/config', builder: (context, state) => SettingsPage()),
      ],
    ),
  ],
);
