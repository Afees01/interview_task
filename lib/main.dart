
import 'package:flutter/material.dart';
import 'package:interview_task/view/bottom_navbar/bottom_navbar.dart';
// import 'package:interview_task/view/home_screen/home_screen.dart';
// import 'package:interview_task/view/news_card/news_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}
