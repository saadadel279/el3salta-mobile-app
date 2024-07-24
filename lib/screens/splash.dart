import 'dart:async';

import 'package:el3salta/screens/initial_input.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const InitialInputPage()),
      );
    });

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.5, // Adjust the opacity as needed
            child: Image.asset(
              'assets/images/Default_Aerial_view_of_a_sprawling_welllit_football_stadium_on_2.jpg', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 6,
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0, // Adjust the radius as needed
                    backgroundImage: AssetImage('assets/images/strategy.png'),
                  ),
                  SizedBox(height: 20.0), // Space between the image and text
                  Text(
                    'el3salta',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
