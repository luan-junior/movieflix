import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchMovies(String option) async {
  final apiKey = '77af48cb85dcc84b275c3791903d7df3';
  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/movie/$option?api_key=$apiKey&language=pt-BR&page=1',
    ),
  );

  if (response.statusCode == 200) {
    final movies = json.decode(response.body)['results'];
    return movies;
  } else {
    throw Exception('Erro ao carregar filmes');
  }
}
