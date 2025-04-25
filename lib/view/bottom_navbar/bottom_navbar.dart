import 'package:flutter/material.dart';
import 'package:interview_task/view/favorites_screen/favorites_screen.dart';
import 'package:interview_task/view/home_screen/home_screen.dart';
import 'package:interview_task/view/profile_screen/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectivetab = 0;
  List selectivePages = [HomeScreen(),FavoritesScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: selectivePages[selectivetab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectivetab,
            onTap: (value) {
              selectivetab = value;
              setState(() {});
            },
            selectedItemColor: Colors.red,
            selectedLabelStyle: const TextStyle(color: Colors.red),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_sharp), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: "Profile"),
            ]));
  }
}
