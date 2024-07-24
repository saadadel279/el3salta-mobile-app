import 'package:el3salta/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FootballTeamsApp());
}

class FootballTeamsApp extends StatelessWidget {
  const FootballTeamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'el3salta',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}
