import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.menu, color: Colors.greenAccent),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.greenAccent),
                  decoration: InputDecoration(
                    hintText: 'Search for a title...',
                    hintStyle: TextStyle(color: Colors.greenAccent),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.greenAccent,
                ),
              ),
              Icon(Icons.search, color: Colors.greenAccent),
            ],
          ),
        ),
      ),
    );
  }
}
