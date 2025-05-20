import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuBottomNavigationBar extends StatefulWidget {
  const MenuBottomNavigationBar({
    required this.child,
    required this.index,
    super.key,
  });
  final Widget child;
  final int index;

  @override
  State<MenuBottomNavigationBar> createState() =>
      _MenuBottomNavigationBarState();
}

class _MenuBottomNavigationBarState extends State<MenuBottomNavigationBar> {
  final tabs = ['/home', '/search', '/favorites', '/config'];

  void changePage(int index) {
    final route = tabs[index];
    if (!context.mounted) return;
    context.go(route, extra: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        // selectedItemColor: Colors.greenAccent,
        onTap: (value) => changePage(value),
        unselectedItemColor: Colors.grey,
        // backgroundColor: Colors.black,
        showUnselectedLabels: true,
        // type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
