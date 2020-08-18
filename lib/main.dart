import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech News',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: SplashScreen(),
    );
  }
}
