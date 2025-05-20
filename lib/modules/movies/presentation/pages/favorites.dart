import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites = [
    {
      'title': 'Warriors',
      'year': '2019',
      'image': 'assets/images/warriors.jpg',
    },
    {
      'title': 'The Glory',
      'year': '2022',
      'image': 'assets/images/the_glory.jpg',
    },
  ];

  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item['image'],
                    width: 60,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item['year'],
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFB1F2BC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Downloaded',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
