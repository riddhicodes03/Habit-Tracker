import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/theme.dart';
import 'package:habit_tracker/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: buildDarkTheme(),
      theme: buildLightTheme(),
      home: const Home(),
    );
  }
}
