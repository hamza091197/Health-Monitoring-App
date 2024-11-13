import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Heart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
