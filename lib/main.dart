import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ThogaKadeApp());
}

class ThogaKadeApp extends StatelessWidget {
  const ThogaKadeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thoga Kade',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
