import 'package:flutter/material.dart';
import 'package:weatherapp/view/screens/home_screen.dart';
import 'package:weatherapp/view/screens/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScrenn(),
      title: "Weather App",
    );
  }
}
