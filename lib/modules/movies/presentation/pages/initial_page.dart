import 'package:flutter/material.dart';
import 'package:movieflix/modules/movies/presentation/pages/movie_catalog_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/capa_home.jpg',
              fit: BoxFit.cover,
              height: 450,
              width: double.infinity,
            ),
            const SizedBox(height: 12),
            MovieCatalogPage(),
          ],
        ),
      ),
    );
  }
}
